//
//  GSGlobalActivityViewController.m
//  GoMap
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-03.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSGlobalActivityViewController.h"
#import "GSPlayerViewController.h"
#import "GoMapClient.h"
#import "PGUtil.h"

NSString *const GSGlobalActivityReuseIdentifier = @"Cell";

@interface GSGlobalActivityViewController () <GoMapClientActivityDelegate>
@property (nonatomic, strong) NSMutableArray *activities;
@end

@implementation GSGlobalActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Recent Activity";
    self.activities = [NSMutableArray arrayWithCapacity:50];
    [GoMapClient sharedInstance].activityDelegate = self;
}

- (void)client:(GoMapClient *)client didLogActivity:(GSGlobalActivity *)activity {
    NSInteger index = [self.activities indexOfObject:activity inSortedRange:(NSRange){0, self.activities.count} options:NSBinarySearchingInsertionIndex usingComparator:^NSComparisonResult(GSGlobalActivity *a, GSGlobalActivity *b){
        uint64_t expirationTime1 = a.timestamp;
        uint64_t expirationTime2 = b.timestamp;
        if (expirationTime1 > expirationTime2) {
            return NSOrderedAscending;
        } else if (expirationTime1 < expirationTime2) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    [self.activities insertObject:activity atIndex:index];
    while (self.activities.count > 100) {
        [self.activities removeObjectAtIndex:self.activities.count - 1];
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.activities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {    
    GSGlobalActivity *activity = [self.activities objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:GSGlobalActivityReuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:GSGlobalActivityReuseIdentifier];
    }
    cell.textLabel.text = activity.playerName;
    cell.backgroundColor = activity.color;
    cell.opaque = YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\t%@", activity.formattedTime, activity.gymName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GSGlobalActivity *activity = [self.activities objectAtIndex:indexPath.row];
    NSString *playerName = activity.playerName;
    [[GoMapClient sharedInstance] fetchPlayer:playerName completion:^(GetPlayerInfoResponse *response, NSError *error){
        if (error == nil) {
            GSPlayerViewController *viewController = [[GSPlayerViewController alloc] initWithPlayerName:playerName data:response];
            [self.navigationController pushViewController:viewController animated:YES];
        } else {
            
        }
    }];
}

@end
