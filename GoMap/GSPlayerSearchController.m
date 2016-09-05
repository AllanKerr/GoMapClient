//
//  GSPlayerSearchController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSPlayerSearchController.h"
#import "GSPlayerViewController.h"
#import "GoMapClient.h"

NSString *const GSPlayerSearchReuseIdentifier = @"Cell";

@interface GSPlayerSearchController () <UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSArray *playerNames;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSString *mostRecentSearch;
@property (nonatomic, retain) NSTimer *validationTimer;
@end

@implementation GSPlayerSearchController

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:GSPlayerSearchReuseIdentifier];

    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playerNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GSPlayerSearchReuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GSPlayerSearchReuseIdentifier];
    }
    cell.textLabel.text = [self.playerNames objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self cancelValidation];
    if (searchText.length > 0) {
        [self scheduleValidation];
    } else {
        self.playerNames = nil;
    }
    [self.tableView reloadData];
}

- (void)scheduleValidation {
    self.validationTimer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(validateLocation) userInfo:nil repeats:NO];
}

- (void)cancelValidation {
    if (self.validationTimer) {
        [self.validationTimer invalidate];
        self.validationTimer = nil;
    }
}

- (void)validateLocation {
    [self cancelValidation];
    
    NSString *text = self.searchBar.text;
    self.mostRecentSearch = text;
    [[GoMapClient sharedInstance] searchForName:text completion:^(NSArray *names, NSError *error){
        if (error == nil) {
            if ([self.mostRecentSearch isEqualToString:text]) {
                self.playerNames = [names sortedArrayUsingComparator:^NSComparisonResult(NSString *name1, NSString *name2) {
                    return [name1 compare:name2 options:NSCaseInsensitiveSearch];
                }];
                [self.tableView reloadData];
            }
        } else {
            
        }
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.searchBar resignFirstResponder];
    NSString *playerName = [self.playerNames objectAtIndex:indexPath.row];
    [[GoMapClient sharedInstance] fetchPlayer:playerName completion:^(GetPlayerInfoResponse *response, NSError *error){
        if (error == nil) {
            GSPlayerViewController *viewController = [[GSPlayerViewController alloc] initWithPlayerName:playerName data:response];
            [self.navigationController pushViewController:viewController animated:YES];
        } else {
            
        }
    }];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)cancelButtonClicked:(UISearchBar *)searchBar {
    [self cancelValidation];
    [self.searchBar setText:nil];
    [self.searchBar resignFirstResponder];
    self.playerNames = nil;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    textField.text = nil;
    [textField resignFirstResponder];
    return YES;
}


@end
