//
//  GoMapClient.h
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetPlayerInfoResponse.pbobjc.h"
#import "UpdateNotificationsRequest.pbobjc.h"
#import "PGEncounter.h"
#import "GSGlobalActivity.h"
#import "GSGym.h"

typedef void(^GSNameSearchCompletion)(NSArray *names, NSError *error);
typedef void(^GSGetPlayerCompletion)(GetPlayerInfoResponse *response, NSError *error);
typedef void(^GSUpdateSettingsCompletion)(NSError *error);

@class GoMapClient;
@protocol GoMapClientDelegate <NSObject>
- (void)client:(GoMapClient *)client didLocateGym:(GSGym *)gym;
- (void)client:(GoMapClient *)client didUpdateGym:(GSGym *)gym;
- (void)client:(GoMapClient *)client didLocationEncounter:(PGEncounter *)encounter;
- (void)client:(GoMapClient *)client despawnedEncounter:(PGEncounter *)encounter;
@end

@protocol GoMapClientActivityDelegate <NSObject>
- (void)client:(GoMapClient *)client didLogActivity:(GSGlobalActivity *)activity;
@end


@interface GoMapClient : NSObject
@property (readonly, nonatomic, strong) NSArray *globalActivity;
@property (readonly, nonatomic, strong) NSArray *pokemon;
@property (readonly, nonatomic, strong) NSArray *gymsArray;
@property (nonatomic, weak) id <GoMapClientDelegate>delegate;
@property (nonatomic, weak) id <GoMapClientActivityDelegate>activityDelegate;
+ (instancetype)sharedInstance;
- (void)searchForName:(NSString *)name completion:(GSNameSearchCompletion)completion;
- (void)fetchPlayer:(NSString *)name completion:(GSGetPlayerCompletion)completion;
- (void)updateNotificationSettingsWithRequest:(UpdateNotificationsRequest *)notificationsRequest completion:(GSUpdateSettingsCompletion)completion;
- (void)registerNotificationToken:(NSString *)token;
- (GSGym *)getGymWithID:(NSString *)gymID;
@end
