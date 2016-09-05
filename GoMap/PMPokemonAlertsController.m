//
//  PMPokemonAlertsController.m
//  Pokemap
//
//  Created by Allan Kerr on 2016-07-27.
//  Copyright © 2016 ruffneck. All rights reserved.
//

#import "PMPokemonAlertsController.h"

@interface PMPokemonAlertsController ()
@property (nonatomic, strong) NSMutableArray *alertedPokemon;
@property (nonatomic, strong) NSArray *currentPokemon;
@property (nonatomic, weak) NSTimer *updateTimer;
@end

@implementation PMPokemonAlertsController

- (instancetype)initWithAlertedPokemon:(NSMutableArray *)alertedPokemon {
    if (self = [super init]) {
        self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(_updateExpirationTimes) userInfo:nil repeats:YES];
        self.alertedPokemon = alertedPokemon;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Alerts";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)done {
    [self _stopTimer];
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate alertsControllerDismissed];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.currentPokemon = [NSArray arrayWithArray:self.alertedPokemon];
    return  self.currentPokemon.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    PGEncounter *encounter = [self.currentPokemon objectAtIndex:indexPath.row];
    NSString *identifier = [NSString stringWithFormat:@"%i",(int)encounter.pokemonID];
    cell.imageView.image = [UIImage imageNamed:identifier];
    cell.textLabel.text = encounter.title;
    
    NSTimeInterval travelTime = encounter.travelTime;
    if (travelTime != -1) {
        cell.backgroundColor = [self computeBackgroundColorWithTravelTime:travelTime timeRemaining:encounter.timeRemaining];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Travel Time:%d:%02d\t%@", (int)travelTime/60, (int)travelTime%60, encounter.subtitle];
    } else {
        cell.detailTextLabel.text = encounter.subtitle;
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (UIColor *)computeBackgroundColorWithTravelTime:(NSTimeInterval)travelTime timeRemaining:(NSTimeInterval)timeRemaining {
    int diff = (int)(timeRemaining - (travelTime * 0.9));
    if (diff > 150) {
        diff = 150;
    } else if (diff < -150) {
        diff = -150;
    }
    diff += 150;
    CGFloat hue = ((diff / 300.0) * 120)/360.0;
    return [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:0.5];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:^{
        PGEncounter *encounter = [self.currentPokemon objectAtIndex:indexPath.row];
        [self.delegate encounterWasSelected:encounter];
    }];
    [self _stopTimer];
}

- (void)_stopTimer {
    [self.updateTimer invalidate];
    self.updateTimer = nil;
}

- (void)_updateExpirationTimes {
    [self.tableView reloadData];
}

@end
