//
//  PGEncounter.h
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "EncounterData.pbobjc.h"
#import "PokemonId.pbobjc.h"

typedef void(^PGTravelTimeCompletion)(NSString *);

@interface PGEncounter : NSObject <MKAnnotation>
@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
@property (readonly, nonatomic, strong) UIImage *image;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (readonly, nonatomic) BOOL isExpired;
@property (readonly, nonatomic) BOOL requiresAlert;
@property (readonly, nonatomic) int timeRemaining;
@property (readonly, nonatomic) uint64_t expirationTime;
@property (readonly, nonatomic) NSTimeInterval travelTime;
@property (readonly, nonatomic) PokemonId pokemonID;
- (instancetype)initWithData:(EncounterData *)data;
- (void)fetchTravelTimeWithCompletion:(PGTravelTimeCompletion)completion;
@end
