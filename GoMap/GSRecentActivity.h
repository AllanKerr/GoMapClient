//
//  GSRecentActivity.h
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "PlayerActivityLog.pbobjc.h"
#import "GymActivityType.pbobjc.h"

@interface GSRecentActivity : NSObject <MKAnnotation>
@property (readonly, nonatomic) uint64_t timestamp;
+ (NSString *)reuseIdentifier;
- (instancetype)initWithGymName:(NSString *)gymName coordinate:(CLLocationCoordinate2D)coordinate timestamp:(uint64_t)timestamp;
@end
