//
//  PGEncounter.m
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "PGEncounter.h"
#import "PGUtil.h"
#import <UIKit/UIKit.h>
#import "PGPokemonSettings.h"

@interface PGEncounter ()
@property (readwrite, nonatomic) BOOL requiresAlert;
@property (readwrite, nonatomic, strong) UIImage *image;
@property (nonatomic, strong) EncounterData *encounterData;
@property (readwrite, nonatomic) NSTimeInterval travelTime;
@end

@implementation PGEncounter
@dynamic isExpired;
@dynamic expirationTime;
@dynamic pokemonID;
@dynamic timeRemaining;

- (BOOL)isExpired {
    return [self timeRemaining] <= 0;
}

- (uint64_t)expirationTime {
    return self.encounterData.expirationTime;
}

- (PokemonId)pokemonID {
    return self.encounterData.pokemonId;
}

- (int)timeRemaining {
    return (self.encounterData.expirationTime / 1000.0) - [[NSDate date] timeIntervalSince1970];
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.encounterData.latitude, self.encounterData.longitude);
}

- (NSString *)title {
    return [PGUtil nameFromPokemonId:self.encounterData.pokemonId];
}

- (NSString *)subtitle {
    int timeRemaining = MAX([self timeRemaining], 0);
    return [NSString stringWithFormat:@"Expires:%d:%02d", timeRemaining/60, timeRemaining%60];
}

- (instancetype)initWithData:(EncounterData *)data {
    if (self = [super init]) {
        self.requiresAlert = [[PGPokemonSettings sharedSettings] requiresAlert:data.pokemonId];
        self.encounterData = data;
        self.travelTime = -1;

        NSString *imageName = [NSString stringWithFormat:@"%i",(int)data.pokemonId];
        self.image = [UIImage imageNamed:imageName];
    }
    return self;
}

- (void)fetchTravelTimeWithCompletion:(PGTravelTimeCompletion)completion {
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.coordinate addressDictionary:nil];
    request.destination = [[MKMapItem alloc] initWithPlacemark:placemark];
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateETAWithCompletionHandler:^(MKETAResponse *response, NSError *error) {
        if (error == nil) {
            self.travelTime = response.expectedTravelTime;
            completion([NSString stringWithFormat:@"Travel Time:%d:%02d", (int)response.expectedTravelTime/60, (int)response.expectedTravelTime%60]);
        } else {
            completion(nil);
        }
    }];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.encounterData.data forKey:@"encounterData"];
    if (self.travelTime != -1) {
        [aCoder encodeDouble:self.travelTime forKey:@"travelTime"];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSData *data = [aDecoder decodeObjectForKey:@"encounterData"];
    EncounterData *encounterData = [EncounterData parseFromData:data error:nil];
    if (self = [self initWithData:encounterData]) {
        if ([aDecoder containsValueForKey:@"travelTime"]) {
            self.travelTime = [aDecoder decodeDoubleForKey:@"travelTime"];
        }
        self.requiresAlert = NO;
    }
    return self;
}

@end
