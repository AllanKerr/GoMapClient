//
//  PMPokemonSettings.h
//  Pokemap
//
//  Created by Allan Kerr on 2016-07-27.
//  Copyright © 2016 ruffneck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PokemonId.pbobjc.h"

typedef NS_ENUM(NSUInteger, PokemonSettings) {
    PokemonSettingsDisabled,
    PokemonSettingsDefault,
    PokemonSettingsSearch,
    PokemonSettingsSearchAndAlert,
    PokemonSettingsAlertAndVibrate,
    PokemonSettingsAlarm
};

@interface PGPokemonSettings : NSObject
+ (PGPokemonSettings *)sharedSettings;
- (PokemonSettings)settingsForId:(PokemonId)pokemonId;
- (BOOL)requiresSearch:(PokemonId)pokemonId;
- (BOOL)requiresAlert:(PokemonId)pokemonId;
- (BOOL)requiresVibration:(PokemonId)pokemonId;
- (BOOL)requiresAlarm:(PokemonId)pokemonId;
- (void)updateSettings:(PokemonSettings)settings forId:(PokemonId)pokemonId;
@end
