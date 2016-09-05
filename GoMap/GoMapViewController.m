//
//  FirstViewController.m
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GoMapViewController.h"
#import "GoMapClient.h"
#import <MapKit/MapKit.h>
#import "GSGymViewController.h"
#import "PMPokemonAlertsController.h"
#import "PGPokemonSettings.h"
#import <AudioToolbox/AudioToolbox.h>

@interface GoMapViewController () <GoMapClientDelegate, PMPokemonAlertsDelegate, MKMapViewDelegate>
@property (nonatomic, assign) BOOL isShowingAlert;
@property (nonatomic, assign) BOOL isShowingAlertsController;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSMutableDictionary *battleOverlays;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *pendingAlerts;
@property (nonatomic, strong) NSMutableArray *alertedPokemon;
@end

@implementation GoMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [GoMapClient sharedInstance].delegate = self;
    self.battleOverlays = [NSMutableDictionary dictionary];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    
    self.navigationItem.leftBarButtonItem = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Alerts" style:UIBarButtonItemStylePlain target:self action:@selector(showAlertsController)];

    self.pendingAlerts = [NSMutableArray array];
    self.alertedPokemon = [NSMutableArray array];
    self.isShowingAlertsController = NO;
    
    self.mapView.showsUserLocation = YES;
    self.mapView.pitchEnabled = NO;
    self.mapView.mapType = MKMapTypeHybrid;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(52.121204, -106.645660), 22500, 22500);
    [self.mapView setRegion:region animated:YES];
}

- (void)client:(GoMapClient *)client didLocateGym:(GSGym *)gym {
    if (gym.isBattling) {
        [self addOverlayForCoordinate:gym.coordinate identifier:gym.identifier];
    } else {
        [self removeOverlayForIdentifier:gym.identifier];
    }
    [self.mapView addAnnotation:gym];
}

- (void)client:(GoMapClient *)client didUpdateGym:(GSGym *)gym {
    if (gym.isBattling) {
        [self addOverlayForCoordinate:gym.coordinate identifier:gym.identifier];
    } else {
        [self removeOverlayForIdentifier:gym.identifier];
    }
    if (gym.changedColor) {
        [self.mapView removeAnnotation:gym];
        [self.mapView addAnnotation:gym];
    }
}

- (void)client:(GoMapClient *)client didLocationEncounter:(PGEncounter *)encounter {
    if (encounter.pokemonID == PokemonId_Missingno) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missed Spawn" message:@"Failed to find pokemon at active spawn." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            [self _showNextAlert];
        }];
        [alert addAction:defaultAction];
        [self _presentAlert:alert];
    } else {
        [self.mapView addAnnotation:encounter];
        
        PGPokemonSettings *settings = [PGPokemonSettings sharedSettings];
        if ([settings requiresAlert:encounter.pokemonID]) {
            if ([settings requiresAlarm:encounter.pokemonID]) {
                AudioServicesPlayAlertSound(1010);
                [self.pendingAlerts removeAllObjects];
                [self _showPokemonAlert:encounter];
            } else {
                if (encounter.requiresAlert && [settings requiresVibration:encounter.pokemonID]) {
                    AudioServicesPlayAlertSound(1009);
                    [self.pendingAlerts removeAllObjects];
                }
                [self _showPokemonAlert:encounter];
            }
        }
    }
}

- (void)_showPokemonAlert:(PGEncounter *)encounter {
    if (self.isShowingAlertsController || !encounter.requiresAlert) {
        [encounter fetchTravelTimeWithCompletion:^(NSString *travelTime){
            [self.alertedPokemon insertObject:encounter atIndex:0];
        }];
    } else {
        NSString *title = [NSString stringWithFormat:@"Located %@", encounter.title];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:encounter.subtitle preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"View" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            [self encounterWasSelected:encounter];
            [self _showNextAlert];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Skip" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
            [self _showNextAlert];
        }];
        UIImage *image = [encounter.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [defaultAction setValue:image forKey:@"image"];
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        
        [encounter fetchTravelTimeWithCompletion:^(NSString *travelTime){
            if (travelTime != nil) {
                alert.message = [NSString stringWithFormat:@"%@\n%@", travelTime, encounter.subtitle];
            }
            [self.alertedPokemon insertObject:encounter atIndex:0];
        }];
        [self _presentAlert:alert];
    }
}

- (void)_showNextAlert {
    UIAlertController *alert = [self.pendingAlerts firstObject];
    if (alert != nil) {
        [self.pendingAlerts removeObjectAtIndex:0];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        self.isShowingAlert = NO;
    }
}

- (void)_presentAlert:(UIAlertController *)alert {
    if (self.isShowingAlert) {
        [self.pendingAlerts addObject:alert];
    } else {
        [self presentViewController:alert animated:YES completion:nil];
        self.isShowingAlert = YES;
    }
}

- (void)encounterWasSelected:(PGEncounter *)encounter {
    self.isShowingAlertsController = NO;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(encounter.coordinate, 1000, 1000);
    [self.mapView setRegion:region animated:YES];
    [self.mapView selectAnnotation:encounter animated:YES];
}

- (void)showAlertsController {
    self.isShowingAlertsController = YES;
    PMPokemonAlertsController *controller = [[PMPokemonAlertsController alloc] initWithAlertedPokemon:self.alertedPokemon];
    controller.delegate = self;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)alertsControllerDismissed {
    self.isShowingAlertsController = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    self.isShowingAlert = NO;
    [self _showNextAlert];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.isShowingAlert = YES;
}

- (void)client:(GoMapClient *)client despawnedEncounter:(PGEncounter *)encounter {
    [self.mapView removeAnnotation:encounter];
    [self.alertedPokemon removeObject:encounter];
}

- (void)addOverlayForCoordinate:(CLLocationCoordinate2D)coordinate identifier:(NSString *)identifier {
    id <MKOverlay> overlay = [self.battleOverlays valueForKey:identifier];
    if (overlay == nil) {
        overlay = [MKCircle circleWithCenterCoordinate:coordinate radius:500];
        [self.battleOverlays setValue:overlay forKey:identifier];
        [self.mapView addOverlay:overlay];
    }
}

- (void)removeOverlayForIdentifier:(NSString *)identifier {
    id <MKOverlay> overlay = [self.battleOverlays valueForKey:identifier];
    [self.battleOverlays removeObjectForKey:identifier];
    [self.mapView removeOverlay:overlay];
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
        view.animatesDrop = gym.changedColor;
        view.pinTintColor = gym.color;
        return view;
    } else if ([annotation isKindOfClass:[PGEncounter class]]) {
        PGEncounter *encounter = (PGEncounter *)annotation;
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"Encounter"];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Encounter"];
            annotationView.canShowCallout = YES;
            annotationView.enabled = YES;
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.image = encounter.image;
        return annotationView;
    }
    return nil;
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithCircle:overlay];
    renderer.fillColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.625];
    return renderer;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    GSGymViewController *viewController = [[GSGymViewController alloc] initWithGym:(GSGym *)view.annotation];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navController animated:YES completion:nil];
}

@end
