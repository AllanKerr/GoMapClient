//
//  GSGym.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-01.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSGym.h"
#import "TeamColor.pbobjc.h"

@interface GSGym ()
@property (readwrite, nonatomic, strong) GetGymDetailsResponse *details;
@property (readwrite, nonatomic) GSGymAttackType attackType;
@property (readwrite, nonatomic) BOOL changedColor;
@end

@implementation GSGym
@dynamic isBattling;
@dynamic coordinate;
@dynamic color;
@dynamic title;
@dynamic subtitle;
@dynamic identifier;

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

+ (UIColor *)teamYellowColor {
    static UIColor *color;
    if (!color) {
        color = [UIColor yellowColor];
    }
    return color;
}

+ (UIColor *)teamRedColor {
    static UIColor *color;
    if (!color) {
        color = [UIColor redColor];
    }
    return color;
}

+ (UIColor *)teamBlueColor {
    static UIColor *color;
    if (!color) {
        color = [UIColor blueColor];
    }
    return color;
}

+ (UIColor *)teamNeutralColor {
    static UIColor *color;
    if (!color) {
        color = [UIColor whiteColor];
    }
    return color;
}

- (NSString *)identifier {
    return self.details.gymState.fortData.id_p;
}

- (BOOL)isBattling {
    return self.details.gymState.fortData.isInBattle;
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.details.gymState.fortData.latitude, self.details.gymState.fortData.longitude);
}

- (NSString *)title {
    return self.details.name;
}

- (NSString *)subtitle {
    NSString *attackType = nil;
    if (self.attackType == GSGymAttackTypeIncreasing) {
        attackType = @"Increasing";
    } else if (self.attackType == GSGymAttackTypeDecreasing) {
        attackType = @"Decreasing";
    }
    if (attackType != nil && !self.changedColor) {
        return [NSString stringWithFormat:@"Points: %lli Pokemon:%lu %@", self.details.gymState.fortData.gymPoints, (unsigned long)self.details.gymState.membershipsArray.count, attackType];
    } else {
        return [NSString stringWithFormat:@"Points: %lli Pokemon:%lu", self.details.gymState.fortData.gymPoints, (unsigned long)self.details.gymState.membershipsArray.count];
    }
}

- (UIColor *)color {
    switch (self.details.gymState.fortData.ownedByTeam) {
        case TeamColor_Blue:
            return [GSGym teamBlueColor];
        case TeamColor_Yellow:
            return [GSGym teamYellowColor];
        case TeamColor_Red:
            return [GSGym teamRedColor];
        default:
            return [GSGym teamNeutralColor];
    }
}

- (instancetype)initWithDetails:(GetGymDetailsResponse *)details {
    if (self = [super init]) {
        self.attackType = GSGymAttackTypeUnknown;
        self.details = details;
    }
    return self;
}

- (void)updateWithDetails:(GetGymDetailsResponse *)details {
    int64_t points = details.gymState.fortData.gymPoints;
    int64_t oldPoints = self.details.gymState.fortData.gymPoints;
    if (points > oldPoints) {
        self.attackType = GSGymAttackTypeIncreasing;
    } else  if (points < oldPoints){
        self.attackType = GSGymAttackTypeDecreasing;
    } else if (!self.isBattling) {
        self.attackType = GSGymAttackTypeUnknown;
    }    
    self.changedColor = self.details.gymState.fortData.ownedByTeam != details.gymState.fortData.ownedByTeam;
    self.details = details;
}

- (BOOL)isEqual:(id)other {
    if (other == self) {
        return YES;
    } else if ([self class] != [other class]) {
        return NO;
    }
    GSGym *gym = (GSGym *)other;
    return [self.details.gymState.fortData.id_p isEqual:gym.details.gymState.fortData.id_p];
}

- (NSUInteger)hash {
    return [self.details.gymState.fortData.id_p hash];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.details.data forKey:@"details"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSData *detailsData = [aDecoder decodeObjectForKey:@"details"];
    GetGymDetailsResponse *details = [GetGymDetailsResponse parseFromData:detailsData error:nil];
    return (self = [self initWithDetails:details]);
}

@end
