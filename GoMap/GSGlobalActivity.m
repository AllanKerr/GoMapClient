//
//  GSGlobalActivity.m
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSGlobalActivity.h"
#import "PGUtil.h"

@interface GSGlobalActivity ()
@property (readwrite, nonatomic, strong) NSString *gymName;
@property (readwrite, nonatomic, strong) NSString *playerName;
@property (readwrite, nonatomic, strong) NSString *formattedTime;
@property (readwrite, nonatomic, strong) UIColor *color;
@property (readwrite, nonatomic) uint64_t timestamp;
@property (readwrite, nonatomic, strong) GlobalActivityLog *activity;
@end

@implementation GSGlobalActivity

- (instancetype)initWithActivity:(GlobalActivityLog *)activity gymName:(NSString *)gymName {
    if (self = [super init]) {
        self.gymName = gymName;
        self.playerName = activity.playerName;
        self.color = [[PGUtil colorForTeam:activity.team] colorWithAlphaComponent:0.5];
        self.timestamp = activity.timestamp;
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:(activity.timestamp / 1000.0)];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        self.formattedTime = [dateFormatter stringFromDate:date];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.gymName forKey:@"gymName"];
    [aCoder encodeObject:self.activity.data forKey:@"activity"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSString *gymName = [aDecoder decodeObjectForKey:@"gymName"];
    NSData *activityData = [aDecoder decodeObjectForKey:@"activity"];
    GlobalActivityLog *activity = [GlobalActivityLog parseFromData:activityData error:nil];
    return self = [self initWithActivity:activity gymName:gymName];
}

@end
