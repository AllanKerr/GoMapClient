//
//  PMPokemonAlertsController.h
//  Pokemap
//
//  Created by Allan Kerr on 2016-07-27.
//  Copyright © 2016 ruffneck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGEncounter.h"

@protocol PMPokemonAlertsDelegate <NSObject>
- (void)encounterWasSelected:(PGEncounter *)encounter;
- (void)alertsControllerDismissed;
@end

@interface PMPokemonAlertsController : UITableViewController
@property (nonatomic, weak) id <PMPokemonAlertsDelegate>delegate;
- (instancetype)initWithAlertedPokemon:(NSMutableArray *)alertedPokemon;
@end
