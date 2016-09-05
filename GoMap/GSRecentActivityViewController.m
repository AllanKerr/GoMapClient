//
//  GSRecentActivityViewController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSRecentActivityViewController.h"
#import "PlayerActivityLog.pbobjc.h"
#import "GSRecentActivity.h"
#import "GoMapClient.h"
#import "PGUtil.h"

@interface GSRecentActivityViewController () <MKMapViewDelegate>
@property (nonatomic, weak) MKMapView *mapView;
@property (nonatomic, strong) NSArray *activities;
@property (nonatomic, strong) UIColor *color;
@end

@implementation GSRecentActivityViewController
@dynamic mapView;

- (MKMapView *)mapView {
    return (MKMapView *)self.view;
}

- (void)initializeRecentActivity:(NSArray *)activityLogs teamColor:(TeamColor)teamColor {
    NSMutableArray *activities = [NSMutableArray arrayWithCapacity:activityLogs.count];
    for (PlayerActivityLog *activityLog in activityLogs) {
        GSGym *gym = [[GoMapClient sharedInstance] getGymWithID:activityLog.gymId];
        GSRecentActivity *activity = [[GSRecentActivity alloc] initWithGymName:gym.title coordinate:gym.coordinate timestamp:activityLog.timestamp];
        if (activity != nil) {
            [activities addObject:activity];
        }
    }
    self.activities = activities;
    self.color = [PGUtil colorForTeam:teamColor];
    self.mapView.delegate = self;
    [self.mapView addAnnotations:activities];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Recent";
    
    self.mapView.showsUserLocation = YES;
    self.mapView.pitchEnabled = NO;
    self.mapView.mapType = MKMapTypeHybrid;
    
    if (self.activities.count > 0) {
        CLLocationCoordinate2D center = [[self.activities firstObject] coordinate];
        for (int i = 1; i < self.activities.count; i++) {
            GSRecentActivity *activity = [self.activities objectAtIndex:i];
            center.latitude += activity.coordinate.latitude;
            center.longitude += activity.coordinate.longitude;
        }
        center.latitude /= self.activities.count;
        center.longitude /= self.activities.count;
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 5000, 5000);
        [self.mapView setRegion:region animated:YES];
        [self addPlayerRadius];
        [self addPlayerPath];
       
    } else {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(52.1332, -106.6700), 5000, 5000);
        [self.mapView setRegion:region animated:YES];
    }
}

- (void)addPlayerRadius {
    if (self.activities.count == 0) {
        return;
    }
    GSRecentActivity *activity = [self.activities lastObject];
    NSTimeInterval current = [[NSDate date] timeIntervalSince1970];
    CLLocationDistance distance = (current - (activity.timestamp / 1000)) * 10;
    if (distance <= 2500) {
        MKCircle *circle = [MKCircle circleWithCenterCoordinate:activity.coordinate radius:distance];
        [self.mapView addOverlay:circle];
    }
}

- (void)addPlayerPath {
    if (self.activities.count < 2) {
        return;
    }
    int i = 0;
    CLLocationDegrees lastLatitude = 0;
    CLLocationDegrees lastLongitude = 0;
    CLLocationCoordinate2D coordinates[self.activities.count];
    for (GSRecentActivity *activity in self.activities) {
        if (activity.coordinate.latitude != lastLatitude ||
            activity.coordinate.longitude != lastLongitude) {
            coordinates[i] = activity.coordinate;
            lastLatitude = activity.coordinate.latitude;
            lastLongitude = activity.coordinate.longitude;
            i++;
        }
    }
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:i];
    [self.mapView addOverlay:polyline];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[GSRecentActivity class]]) {
        NSString *reuseIdentifier = [GSRecentActivity reuseIdentifier];
        MKPinAnnotationView *view = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
        if (view == nil) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
            view.canShowCallout = YES;
        }
        view.animatesDrop = YES;
        view.pinTintColor = self.color;
        return view;
    }  else if ([annotation isKindOfClass:[GSGym class]]) {
        GSGym *gym = (GSGym *)annotation;
        NSString *reuseIdentifier = [GSGym reuseIdentifier];
        MKPinAnnotationView *view = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
        if (view == nil) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
            view.canShowCallout = YES;
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:nil action:NSSelectorFromString(@"") forControlEvents:UIControlEventTouchUpInside];
            view.rightCalloutAccessoryView = rightButton;
        }
        view.pinTintColor = gym.color;
        return view;
    }
    return nil;
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKCircle class]]) {
        MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithCircle:overlay];
        renderer.fillColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
        return renderer;
    } else if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *polylineView = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        polylineView.strokeColor = [UIColor redColor];
        polylineView.lineWidth = 5;
        return polylineView;
    }
    return nil;
}

@end
