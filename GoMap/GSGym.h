//
//  GSGym.h
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-01.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "GetGymDetailsResponse.pbobjc.h"
#import "GymState.pbobjc.h"
#import "FortData.pbobjc.h"

typedef NS_ENUM(NSUInteger, GSGymAttackType) {
    GSGymAttackTypeIncreasing,
    GSGymAttackTypeDecreasing,
    GSGymAttackTypeUnknown,
};

@interface GSGym : NSObject <MKAnnotation, NSCoding>
@property (readonly, nonatomic) BOOL isBattling;
@property (readonly, nonatomic) BOOL changedColor;
@property (readonly, nonatomic) UIColor *color;
@property (readonly, nonatomic) NSString *identifier;
@property (readonly, nonatomic, strong) GetGymDetailsResponse *details;
@property (readonly, nonatomic) GSGymAttackType attackType;
+ (NSString *)reuseIdentifier;
- (instancetype)initWithDetails:(GetGymDetailsResponse *)details;
- (void)updateWithDetails:(GetGymDetailsResponse *)details;
@end
