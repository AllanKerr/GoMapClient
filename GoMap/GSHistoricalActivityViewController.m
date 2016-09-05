//
//  GSHistoricalActivityViewController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSHistoricalActivityViewController.h"
#import "GSHistoricalActivity.h"
#import "GSRecentActivity.h"
#import "GSGym.h"
#import "PGUtil.h"
#import "GoMapClient.h"
#import "GymHistory.pbobjc.h"
#import <MapKit/MapKit.h>

@interface GSHistoricalActivityViewController () <MKMapViewDelegate>
@property (nonatomic, weak) MKMapView *mapView;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSArray *activities;
@end

@implementation GSHistoricalActivityViewController
@dynamic mapView;

- (MKMapView *)mapView {
    return (MKMapView *)self.view;
}

- (void)initializeHistoricalActivity:(NSArray *)activityLogs teamColor:(TeamColor)teamColor {
    NSMutableArray *activities = [NSMutableArray arrayWithCapacity:activityLogs.count];
    for (GymHistory *activityLog in activityLogs) {
        GSGym *gym = [[GoMapClient sharedInstance] getGymWithID:activityLog.gymId];
        GSHistoricalActivity *activity = [[GSHistoricalActivity alloc] initWithGymName:gym.title coordinate:gym.coordinate count:activityLog.num];
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
    
    self.navigationItem.title = @"History";
    
    self.mapView.showsUserLocation = YES;
    self.mapView.pitchEnabled = NO;
    self.mapView.mapType = MKMapTypeHybrid;
    
    if (self.activities.count > 0) {
        CLLocationCoordinate2D center = [[self.activities firstObject] coordinate];
        for (int i = 1; i < self.activities.count; i++) {
            GSHistoricalActivity *activity = [self.activities objectAtIndex:i];
            center.latitude += activity.coordinate.latitude;
            center.longitude += activity.coordinate.longitude;
        }
        center.latitude /= self.activities.count;
        center.longitude /= self.activities.count;
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 5000, 5000);
        [self.mapView setRegion:region animated:YES];
        
        if (self.activities.count > 1) {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = @"Center";
            annotation.coordinate = center;
            [self.mapView addAnnotation:annotation];
        }
    } else {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(52.1332, -106.6700), 5000, 5000);
        [self.mapView setRegion:region animated:YES];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[GSHistoricalActivity class]]) {
        NSString *reuseIdentifier = [GSHistoricalActivity reuseIdentifier];
        MKPinAnnotationView *view = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
        if (view == nil) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
            view.canShowCallout = YES;
        }
        view.animatesDrop = YES;
        view.pinTintColor = self.color;
        return view;
    } else if ([annotation isKindOfClass:[MKPointAnnotation class]]){
        MKPinAnnotationView *view = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"HomeCell"];
        if (view == nil) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"HomeCell"];
            view.canShowCallout = YES;
        }
        view.animatesDrop = YES;
        view.pinTintColor = [UIColor whiteColor];
        return view;

    }
    return nil;
}

@end
