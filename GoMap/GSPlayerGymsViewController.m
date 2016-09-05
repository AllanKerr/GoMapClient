//
//  GSPlayerGymsViewController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSPlayerGymsViewController.h"
#import "GetGymDetailsResponse.pbobjc.h"
#import "GoMapClient.h"
#import "GSGymViewController.h"
#import "GSGym.h"
#import <MapKit/MapKit.h>

@interface GSPlayerGymsViewController () <MKMapViewDelegate>
@property (nonatomic, weak) MKMapView *mapView;
@property (nonatomic, strong) NSArray *gyms;
@end

@implementation GSPlayerGymsViewController
@dynamic mapView;

- (MKMapView *)mapView {
    return (MKMapView *)self.view;
}

- (void)initializeGyms:(NSArray *)gymIDs {
    NSMutableArray *gyms = [NSMutableArray arrayWithCapacity:gymIDs.count];
    for (NSString *gymID in gymIDs) {
        GSGym *gym = [[GoMapClient sharedInstance] getGymWithID:gymID];
        if (gym != nil) {
            [gyms addObject:gym];
        }
    }
    self.gyms = gyms;
    self.mapView.delegate = self;
    [self.mapView addAnnotations:gyms];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.navigationItem.title = @"Gyms";
    
    self.mapView.showsUserLocation = YES;
    self.mapView.pitchEnabled = NO;
    self.mapView.mapType = MKMapTypeHybrid;
    
    if (self.gyms.count > 0) {
        CLLocationCoordinate2D center = [[self.gyms firstObject] coordinate];
        for (int i = 1; i < self.gyms.count; i++) {
            GSGym *gym = [self.gyms objectAtIndex:i];
            center.latitude += gym.coordinate.latitude;
            center.longitude += gym.coordinate.longitude;
        }
        center.latitude /= self.gyms.count;
        center.longitude /= self.gyms.count;
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 5000, 5000);
        [self.mapView setRegion:region animated:YES];
    } else {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(52.1332, -106.6700), 5000, 5000);
        [self.mapView setRegion:region animated:YES];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[GSGym class]]) {
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
        view.animatesDrop = YES;
        view.pinTintColor = gym.color;
        return view;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    GSGymViewController *viewController = [[GSGymViewController alloc] initWithGym:(GSGym *)view.annotation];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navController animated:YES completion:nil];
}

@end
