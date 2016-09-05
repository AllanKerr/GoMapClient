//
//  PMPokemonSettings.m
//  Pokemap
//
//  Created by Allan Kerr on 2016-07-27.
//  Copyright © 2016 ruffneck. All rights reserved.
//

#import "PGPokemonSettings.h"

NSString *const PMPokemonSettingsKey = @"pokemonSettings";

@interface PGPokemonSettings ()
@property (atomic, strong) NSMutableDictionary *pokemonSettings;
@end

@implementation PGPokemonSettings

- (PokemonSettings)defaultPokemonSettingsForId:(PokemonId)pokemonId {
    switch (pokemonId) {
        case PokemonId_Missingno:
            return PokemonSettingsDefault;
        case PokemonId_Bulbasaur:
            return PokemonSettingsSearch;
        case PokemonId_Ivysaur:
            return PokemonSettingsSearch;
        case PokemonId_Venusaur:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Charmander:
            return PokemonSettingsSearch;
        case PokemonId_Charmeleon:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Charizard:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Squirtle:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Wartortle:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Blastoise:
            return PokemonSettingsAlarm;
        case PokemonId_Caterpie:
            return PokemonSettingsDisabled;
        case PokemonId_Metapod:
            return PokemonSettingsSearch;
        case PokemonId_Butterfree:
            return PokemonSettingsSearch;
        case PokemonId_Weedle:
            return PokemonSettingsDisabled;
        case PokemonId_Kakuna:
            return PokemonSettingsSearch;
        case PokemonId_Beedrill:
            return PokemonSettingsSearch;
        case PokemonId_Pidgey:
            return PokemonSettingsDisabled;
        case PokemonId_Pidgeotto:
            return PokemonSettingsDisabled;
        case PokemonId_Pidgeot:
            return PokemonSettingsSearch;
        case PokemonId_Rattata:
            return PokemonSettingsDisabled;
        case PokemonId_Raticate:
            return PokemonSettingsSearch;
        case PokemonId_Spearow:
            return PokemonSettingsDisabled;
        case PokemonId_Fearow:
            return PokemonSettingsSearch;
        case PokemonId_Ekans:
            return PokemonSettingsSearch;
        case PokemonId_Arbok:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Pikachu:
            return PokemonSettingsSearch;
        case PokemonId_Raichu:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Sandshrew:
            return PokemonSettingsSearch;
        case PokemonId_Sandslash:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_NidoranFemale:
            return PokemonSettingsDisabled;
        case PokemonId_Nidorina:
            return PokemonSettingsDisabled;
        case PokemonId_Nidoqueen:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_NidoranMale:
            return PokemonSettingsDisabled;
        case PokemonId_Nidorino:
            return PokemonSettingsDisabled;
        case PokemonId_Nidoking:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Clefairy:
            return PokemonSettingsSearch;
        case PokemonId_Clefable:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Vulpix:
            return PokemonSettingsSearch;
        case PokemonId_Ninetales:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Jigglypuff:
            return PokemonSettingsSearch;
        case PokemonId_Wigglytuff:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Zubat:
            return PokemonSettingsDisabled;
        case PokemonId_Golbat:
            return PokemonSettingsSearch;
        case PokemonId_Oddish:
            return PokemonSettingsSearch;
        case PokemonId_Gloom:
            return PokemonSettingsSearch;
        case PokemonId_Vileplume:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Paras:
            return PokemonSettingsDisabled;
        case PokemonId_Parasect:
            return PokemonSettingsSearch;
        case PokemonId_Venonat:
            return PokemonSettingsDisabled;
        case PokemonId_Venomoth:
            return PokemonSettingsSearch;
        case PokemonId_Diglett:
            return PokemonSettingsDisabled;
        case PokemonId_Dugtrio:
            return PokemonSettingsSearch;
        case PokemonId_Meowth:
            return PokemonSettingsDisabled;
        case PokemonId_Persian:
            return PokemonSettingsSearch;
        case PokemonId_Psyduck:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Golduck:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Mankey:
            return PokemonSettingsDisabled;
        case PokemonId_Primeape:
            return PokemonSettingsSearch;
        case PokemonId_Growlithe:
            return PokemonSettingsSearch;
        case PokemonId_Arcanine:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Poliwag:
            return PokemonSettingsSearch;
        case PokemonId_Poliwhirl:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Poliwrath:
            return PokemonSettingsAlarm;
        case PokemonId_Abra:
            return PokemonSettingsDisabled;
        case PokemonId_Kadabra:
            return PokemonSettingsSearch;
        case PokemonId_Alakazam:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Machop:
            return PokemonSettingsSearch;
        case PokemonId_Machoke:
            return PokemonSettingsSearch;
        case PokemonId_Machamp:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Bellsprout:
            return PokemonSettingsSearch;
        case PokemonId_Weepinbell:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Victreebel:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Tentacool:
            return PokemonSettingsSearch;
        case PokemonId_Tentacruel:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Geodude:
            return PokemonSettingsDisabled;
        case PokemonId_Graveler:
            return PokemonSettingsSearch;
        case PokemonId_Golem:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Ponyta:
            return PokemonSettingsDisabled;
        case PokemonId_Rapidash:
            return PokemonSettingsSearch;
        case PokemonId_Slowpoke:
            return PokemonSettingsSearch;
        case PokemonId_Slowbro:
            return PokemonSettingsAlarm;
        case PokemonId_Magnemite:
            return PokemonSettingsDisabled;
        case PokemonId_Magneton:
            return PokemonSettingsSearch;
        case PokemonId_Farfetchd:
            return PokemonSettingsAlarm;
        case PokemonId_Doduo:
            return PokemonSettingsSearch;
        case PokemonId_Dodrio:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Seel:
            return PokemonSettingsSearch;
        case PokemonId_Dewgong:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Grimer:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Muk:
            return PokemonSettingsAlarm;
        case PokemonId_Shellder:
            return PokemonSettingsSearch;
        case PokemonId_Cloyster:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Gastly:
            return PokemonSettingsSearch;
        case PokemonId_Haunter:
            return PokemonSettingsSearch;
        case PokemonId_Gengar:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Onix:
            return PokemonSettingsDisabled;
        case PokemonId_Drowzee:
            return PokemonSettingsDisabled;
        case PokemonId_Hypno:
            return PokemonSettingsSearch;
        case PokemonId_Krabby:
            return PokemonSettingsDisabled;
        case PokemonId_Kingler:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Voltorb:
            return PokemonSettingsDisabled;
        case PokemonId_Electrode:
            return PokemonSettingsSearch;
        case PokemonId_Exeggcute:
            return PokemonSettingsSearch;
        case PokemonId_Exeggutor:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Cubone:
            return PokemonSettingsDisabled;
        case PokemonId_Marowak:
            return PokemonSettingsSearch;
        case PokemonId_Hitmonlee:
            return PokemonSettingsSearch;
        case PokemonId_Hitmonchan:
            return PokemonSettingsSearch;
        case PokemonId_Lickitung:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Koffing:
            return PokemonSettingsSearch;
        case PokemonId_Weezing:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Rhyhorn:
            return PokemonSettingsDisabled;
        case PokemonId_Rhydon:
            return PokemonSettingsSearch;
        case PokemonId_Chansey:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Tangela:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Kangaskhan:
            return PokemonSettingsAlarm;
        case PokemonId_Horsea:
            return PokemonSettingsSearch;
        case PokemonId_Seadra:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Goldeen:
            return PokemonSettingsSearch;
        case PokemonId_Seaking:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Staryu:
            return PokemonSettingsSearch;
        case PokemonId_Starmie:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_MrMime:
            return PokemonSettingsAlarm;
        case PokemonId_Scyther:
            return PokemonSettingsSearch;
        case PokemonId_Jynx:
            return PokemonSettingsSearch;
        case PokemonId_Electabuzz:
            return PokemonSettingsSearch;
        case PokemonId_Magmar:
            return PokemonSettingsSearch;
        case PokemonId_Pinsir:
            return PokemonSettingsSearch;
        case PokemonId_Tauros:
            return PokemonSettingsAlarm;
        case PokemonId_Magikarp:
            return PokemonSettingsSearch;
        case PokemonId_Gyarados:
            return PokemonSettingsAlarm;
        case PokemonId_Lapras:
            return PokemonSettingsAlarm;
        case PokemonId_Ditto:
            return PokemonSettingsAlarm;
        case PokemonId_Eevee:
            return PokemonSettingsSearch;
        case PokemonId_Vaporeon:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Jolteon:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Flareon:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Porygon:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Omanyte:
            return PokemonSettingsSearch;
        case PokemonId_Omastar:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Kabuto:
            return PokemonSettingsSearch;
        case PokemonId_Kabutops:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Aerodactyl:
            return PokemonSettingsSearchAndAlert;
        case PokemonId_Snorlax:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Articuno:
            return PokemonSettingsAlarm;
        case PokemonId_Zapdos:
            return PokemonSettingsAlarm;
        case PokemonId_Moltres:
            return PokemonSettingsAlarm;
        case PokemonId_Dratini:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Dragonair:
            return PokemonSettingsAlertAndVibrate;
        case PokemonId_Dragonite:
            return PokemonSettingsAlarm;
        case PokemonId_Mewtwo:
            return PokemonSettingsAlarm;
        case PokemonId_Mew:
            return PokemonSettingsAlarm;
        default:
            return PokemonSettingsAlarm;
    }
}

+ (PGPokemonSettings *)sharedSettings {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults] ;
        self.pokemonSettings = [[userDefaults dictionaryForKey:PMPokemonSettingsKey] mutableCopy];
        if (self.pokemonSettings == nil) {
            self.pokemonSettings = [self defaultPokemonSettings];
            [userDefaults setValue:self.pokemonSettings forKey:PMPokemonSettingsKey];
        }
    }
    return self;
}

- (NSMutableDictionary *)defaultPokemonSettings {
    NSMutableDictionary *defaultDesiredPokemon = [NSMutableDictionary dictionaryWithCapacity:(PokemonId_Mew - PokemonId_Missingno) + 1];
    for (PokemonId pokemonId = PokemonId_Missingno; pokemonId <= PokemonId_Mew; pokemonId++) {
        NSString *identifier = [NSString stringWithFormat:@"%i",(int)pokemonId];
        PokemonSettings settings = [self defaultPokemonSettingsForId:pokemonId];
        [defaultDesiredPokemon setValue:@(settings) forKey:identifier];
    }
    return defaultDesiredPokemon;
}

- (PokemonSettings)settingsForId:(PokemonId)pokemonId {
    NSString *identifier = [NSString stringWithFormat:@"%i",(int)pokemonId];
    return [[self.pokemonSettings valueForKey:identifier] unsignedIntegerValue];
}

- (BOOL)requiresSearch:(PokemonId)pokemonId {
    PokemonSettings settings = [self settingsForId:pokemonId];
    return (settings == PokemonSettingsSearch) || (settings == PokemonSettingsSearchAndAlert) || (settings == PokemonSettingsAlertAndVibrate) || (settings == PokemonSettingsAlarm);
}

- (BOOL)requiresAlert:(PokemonId)pokemonId {
    PokemonSettings settings = [self settingsForId:pokemonId];
    return (settings == PokemonSettingsSearchAndAlert) || (settings == PokemonSettingsAlertAndVibrate) || (settings == PokemonSettingsAlarm);
}

- (BOOL)requiresVibration:(PokemonId)pokemonId {
    PokemonSettings settings = [self settingsForId:pokemonId];
    return (settings == PokemonSettingsAlertAndVibrate) || (settings == PokemonSettingsAlarm);
}

- (BOOL)requiresAlarm:(PokemonId)pokemonId {
    return [self settingsForId:pokemonId] == PokemonSettingsAlarm;
}

- (void)updateSettings:(PokemonSettings)settings forId:(PokemonId)pokemonId {
    NSString *identifier = [NSString stringWithFormat:@"%i",(int)pokemonId];
    [self.pokemonSettings setValue:@(settings) forKey:identifier];
    [[NSUserDefaults standardUserDefaults] setValue:self.pokemonSettings forKey:PMPokemonSettingsKey];
}

@end
