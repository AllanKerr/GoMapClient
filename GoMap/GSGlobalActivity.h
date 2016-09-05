//
//  GSGlobalActivity.h
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalActivityLog.pbobjc.h"

@interface GSGlobalActivity : NSObject
@property (readonly, nonatomic, strong) NSString *gymName;
@property (readonly, nonatomic, strong) NSString *playerName;
@property (readonly, nonatomic, strong) NSString *formattedTime;
@property (readonly, nonatomic, strong) UIColor *color;
@property (readonly, nonatomic) uint64_t timestamp;
- (instancetype)initWithActivity:(GlobalActivityLog *)activity gymName:(NSString *)gymName;
@end
