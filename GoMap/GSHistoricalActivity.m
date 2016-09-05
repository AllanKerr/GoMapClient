//
//  GSHistoricalActivity.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSHistoricalActivity.h"

@interface GSHistoricalActivity ()
@property (nonatomic, copy) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (readwrite, nonatomic) uint64_t count;
@end

@implementation GSHistoricalActivity
@dynamic subtitle;

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

- (NSString *)subtitle {
    return [NSString stringWithFormat:@"Attacked:%lu", (unsigned long)self.count];
}

- (instancetype)initWithGymName:(NSString *)gymName coordinate:(CLLocationCoordinate2D)coordinate count:(uint64_t)count {
    if (self = [super init]) {
        self.title = gymName;
        self.coordinate = coordinate;
        self.count = count;
    }
    return self;
}

@end
