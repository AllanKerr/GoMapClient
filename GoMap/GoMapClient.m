//
//  GoMapClient.m
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GoMapClient.h"
#import "UpdateDataRequest.pbobjc.h"
#import "UpdateDataResponse.pbobjc.h"
#import "NameSearchRequest.pbobjc.h"
#import "NameSearchResponse.pbobjc.h"
#import "GetPlayerInfoRequest.pbobjc.h"
#import "GetPlayerProfileResponse.pbobjc.h"
#import "PGPokemonSettings.h"
#import <AFNetworking/AFNetworking.h>
#import "PGEncounter.h"
#import "GSGlobalActivity.h"
#import "RegisterTokenRequest.pbobjc.h"
#import "UICKeyChainStore.h"

NSString *const GSDataProviderServer = @"http://159.203.44.63:9090";
NSString *const GSClientSecret = @"2QDnZ7lbFZ7t6dkXAZoQLp4LBMRqg4Hf";

@interface GoMapClient ()
@property (readonly, nonatomic, strong) NSString *deviceIdentifier;
@property (readwrite, nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (readwrite, nonatomic, weak) NSTimer *timer;
@property (readwrite, nonatomic, strong) NSMutableDictionary *gyms;
@property (nonatomic, strong) NSMutableArray *encounters;
@property (nonatomic, strong) NSMutableArray *activities;
@property (nonatomic) uint64_t timestamp;
@property (nonatomic) BOOL isUpdatingData;
@end

@implementation GoMapClient
@dynamic gymsArray;
@dynamic deviceIdentifier;

- (NSArray *)gymsArray {
    return [self.gyms allValues];
}

- (NSString *)deviceIdentifier {
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.kerr.GoMap"];
    NSString *identifier = [keychain stringForKey:@"UDID"];
    if (identifier == nil) {
        identifier =  [NSUUID UUID].UUIDString;
        [keychain setString:identifier forKey:@"UDID"];
    }
    return identifier;
}

- (NSURL *)urlForEndPoint:(NSString *)endPoint {
    NSString *path = [NSString stringWithFormat:@"%@/%@", GSDataProviderServer, endPoint];
    return [NSURL URLWithString:path];
}

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.gyms = [NSMutableDictionary dictionary];
        self.encounters = [NSMutableArray array];
        self.activities = [NSMutableArray array];
        self.timestamp = 0;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(updateData) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)setActivityDelegate:(id<GoMapClientActivityDelegate>)activityDelegate {
    for (GSGlobalActivity *activity in self.activities) {
        [activityDelegate client:self didLogActivity:activity];
    }
    _activityDelegate = activityDelegate;
}

- (GSGym *)getGymWithID:(NSString *)gymID {
    return [self.gyms valueForKey:gymID];
}

- (void)updateData {
    if (!self.isUpdatingData) {
        self.isUpdatingData = YES;
        
        UpdateDataRequest *message = [UpdateDataRequest message];
        message.timestamp = self.timestamp;
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[self urlForEndPoint:@"update_data"]];
        [request setValue:GSClientSecret forHTTPHeaderField:@"User-Agent"];
        request.HTTPMethod = @"POST";
        request.HTTPBody = message.data;
        
        NSURLSession *session = [self.sessionManager session];
        uint64_t newTimestamp = [[NSDate date] timeIntervalSince1970] * 1000;
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^(void){

                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                if (httpResponse.statusCode != 200) {
                    NSError *parseError;
                    UpdateDataResponse *response = [UpdateDataResponse parseFromData:data error:&parseError];
                    NSLog(@"Invalid status code:%li response:%@", (long)httpResponse.statusCode, response);
                } else if (error != nil) {
                    NSLog(@"Data update failed:%@", error);
                } else {
                    NSError *parseError;
                    UpdateDataResponse *response = [UpdateDataResponse parseFromData:data error:&parseError];
                    if (parseError == nil) {
                        for (GetGymDetailsResponse *gymDetail in response.gymsDetailsArray) {
                            GSGym *gym = [self.gyms valueForKey:gymDetail.gymState.fortData.id_p];
                            if (gym == nil) {
                                gym = [[GSGym alloc] initWithDetails:gymDetail];
                                [self.gyms setValue:gym forKey:gymDetail.gymState.fortData.id_p];
                                [self.delegate client:self didLocateGym:gym];
                            } else {
                                [gym updateWithDetails:gymDetail];
                                [self.delegate client:self didUpdateGym:gym];
                            }
                        }
                        for (EncounterData *encounterData in response.encounterArray) {
                            PGEncounter *encounter = [[PGEncounter alloc] initWithData:encounterData];
                            [self _addEncounter:encounter];
                        }
                        for (GlobalActivityLog *activity in response.activityArray) {
                            GSGym *gym = [self getGymWithID:activity.gymId];
                            GSGlobalActivity *globalActivity = [[GSGlobalActivity alloc] initWithActivity:activity gymName:gym.title];
                            [self.activityDelegate client:self didLogActivity:globalActivity];
                            [self.activities addObject:globalActivity];
                        }
                        self.timestamp = newTimestamp;
                    } else {
                        NSLog(@"Data update parsing failed:%@", parseError);
                    }
                }
                self.isUpdatingData = NO;
            });
        }];
        [task resume];
    }
    [self _removeExpiredEncounters];
}

- (void)_addEncounter:(PGEncounter *)encounter {
    if ([[PGPokemonSettings sharedSettings] requiresSearch:encounter.pokemonID]) {
        NSInteger index = [self.encounters indexOfObject:encounter inSortedRange:(NSRange){0, self.encounters.count} options:NSBinarySearchingInsertionIndex usingComparator:^NSComparisonResult(PGEncounter *a, PGEncounter *b){
            uint64_t expirationTime1 = a.expirationTime;
            uint64_t expirationTime2 = b.expirationTime;
            if (expirationTime1 > expirationTime2) {
                return NSOrderedDescending;
            } else if (expirationTime1 < expirationTime2) {
                return NSOrderedAscending;
            }
            return NSOrderedSame;
        }];
        [self.delegate client:self didLocationEncounter:encounter];
        [self.encounters insertObject:encounter atIndex:index];
    }
}

- (void)_removeExpiredEncounters {
    PGEncounter *encounter;
    uint64_t currentTime = [[NSDate date] timeIntervalSince1970] * 1000;
    while (self.encounters.count > 0 && ((encounter = (PGEncounter *)[self.encounters firstObject]).expirationTime <= currentTime)) {
        [self.delegate client:self despawnedEncounter:encounter];
        [self.encounters removeObjectAtIndex:0];
    }
}

- (void)searchForName:(NSString *)name completion:(GSNameSearchCompletion)completion {
    if (name.length == 0) {
        completion([NSArray array], nil);
        return;
    }
    NameSearchRequest *searchRequest = [NameSearchRequest message];
    searchRequest.playerName = name;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[self urlForEndPoint:@"search_player"]];
    [request setValue:GSClientSecret forHTTPHeaderField:@"User-Agent"];
    request.HTTPMethod = @"POST";
    request.HTTPBody = searchRequest.data;
    
    NSURLSession *session = [self.sessionManager session];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            if (error != nil) {
                completion(nil, error);
            } else {
                NSError *parseError;
                NameSearchResponse *response = [NameSearchResponse parseFromData:data error:&parseError];
                completion(response.namesArray, parseError);
            }
        });
    }];
    [task resume];
}

- (void)fetchPlayer:(NSString *)name completion:(GSGetPlayerCompletion)completion {
    if (name.length == 0) {
        completion(nil, nil);
        return;
    }
    GetPlayerInfoRequest *searchRequest = [GetPlayerInfoRequest message];
    searchRequest.playerName = name;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[self urlForEndPoint:@"get_player"]];
    [request setValue:GSClientSecret forHTTPHeaderField:@"User-Agent"];
    request.HTTPMethod = @"POST";
    request.HTTPBody = searchRequest.data;
    
    NSURLSession *session = [self.sessionManager session];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            if (error != nil) {
                completion(nil, error);
            } else {
                NSError *parseError;
                GetPlayerInfoResponse *response = [GetPlayerInfoResponse parseFromData:data error:&parseError];
                completion(response, parseError);
            }
        });
    }];
    [task resume];
}

- (void)registerNotificationToken:(NSString *)token {
    if (token.length == 0) {
        return;
    }
    NSLog(@"%@", token);
    RegisterTokenRequest *tokenRequest = [RegisterTokenRequest message];
    tokenRequest.deviceIdentifier = self.deviceIdentifier;
    tokenRequest.token = token;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[self urlForEndPoint:@"register_token"]];
    [request setValue:GSClientSecret forHTTPHeaderField:@"User-Agent"];
    request.HTTPMethod = @"POST";
    request.HTTPBody = tokenRequest.data;
    
    NSURLSession *session = [self.sessionManager session];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if (httpResponse.statusCode != 200) {
            NSLog(@"Failed to register for push notifications:%li", (long)httpResponse.statusCode);
        } else {
            NSLog(@"Registered for push notifications:%li", (long)httpResponse.statusCode);
        }
    }];
    [task resume];
}

- (void)updateNotificationSettingsWithRequest:(UpdateNotificationsRequest *)notificationsRequest completion:(GSUpdateSettingsCompletion)completion {

    notificationsRequest.deviceIdentifier = self.deviceIdentifier;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[self urlForEndPoint:@"update_notifications"]];
    [request setValue:GSClientSecret forHTTPHeaderField:@"User-Agent"];
    request.HTTPMethod = @"POST";
    request.HTTPBody = notificationsRequest.data;
    
    NSURLSession *session = [self.sessionManager session];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if (httpResponse.statusCode != 200) {
                completion([NSError errorWithDomain:NSURLErrorDomain code:httpResponse.statusCode userInfo:nil]);
                NSLog(@"Failed to update notification settings:%li", (long)httpResponse.statusCode);
            } else {
                completion(nil);
            }
        });
    }];
    [task resume];
}

@end
