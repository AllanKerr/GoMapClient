//
//  PGUtil.m
//  ObjectivePoGo
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-08-27.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "PGUtil.h"

#define ARC4RANDOM_MAX 0x100000000

@implementation PGUtil

+ (double)applyNoise:(double)value magnitude:(double)magnitude {
    return value + ((double)arc4random() / ARC4RANDOM_MAX) * (2 * magnitude) - magnitude;
}

+ (NSString *)nameFromPokemonId:(PokemonId)pokemonId {
    switch (pokemonId) {
        case PokemonId_Missingno:
            return @"Missingno";
        case PokemonId_Bulbasaur:
            return @"Bulbasaur";
        case PokemonId_Ivysaur:
            return @"Ivysaur";
        case PokemonId_Venusaur:
            return @"Venusaur";
        case PokemonId_Charmander:
            return @"Charmander";
        case PokemonId_Charmeleon:
            return @"Charmeleon";
        case PokemonId_Charizard:
            return @"Charizard";
        case PokemonId_Squirtle:
            return @"Squirtle";
        case PokemonId_Wartortle:
            return @"Wartortle";
        case PokemonId_Blastoise:
            return @"Blastoise";
        case PokemonId_Caterpie:
            return @"Caterpie";
        case PokemonId_Metapod:
            return @"Metapod";
        case PokemonId_Butterfree:
            return @"Butterfree";
        case PokemonId_Weedle:
            return @"Weedle";
        case PokemonId_Kakuna:
            return @"Kakuna";
        case PokemonId_Beedrill:
            return @"Beedrill";
        case PokemonId_Pidgey:
            return @"Pidgey";
        case PokemonId_Pidgeotto:
            return @"Pidgeotto";
        case PokemonId_Pidgeot:
            return @"Pidgeot";
        case PokemonId_Rattata:
            return @"Rattata";
        case PokemonId_Raticate:
            return @"Raticate";
        case PokemonId_Spearow:
            return @"Spearow";
        case PokemonId_Fearow:
            return @"Fearow";
        case PokemonId_Ekans:
            return @"Ekans";
        case PokemonId_Arbok:
            return @"Arbok";
        case PokemonId_Pikachu:
            return @"Pikachu";
        case PokemonId_Raichu:
            return @"Raichu";
        case PokemonId_Sandshrew:
            return @"Sandshrew";
        case PokemonId_Sandslash:
            return @"Sandslash";
        case PokemonId_NidoranFemale:
            return @"Nidoran Female";
        case PokemonId_Nidorina:
            return @"Nidorina";
        case PokemonId_Nidoqueen:
            return @"Nidoqueen";
        case PokemonId_NidoranMale:
            return @"Nidoran Male";
        case PokemonId_Nidorino:
            return @"Nidorino";
        case PokemonId_Nidoking:
            return @"Nidoking";
        case PokemonId_Clefairy:
            return @"Clefairy";
        case PokemonId_Clefable:
            return @"Clefable";
        case PokemonId_Vulpix:
            return @"Vulpix";
        case PokemonId_Ninetales:
            return @"Ninetales";
        case PokemonId_Jigglypuff:
            return @"Jigglypuff";
        case PokemonId_Wigglytuff:
            return @"Wigglytuff";
        case PokemonId_Zubat:
            return @"Zubat";
        case PokemonId_Golbat:
            return @"Golbat";
        case PokemonId_Oddish:
            return @"Oddish";
        case PokemonId_Gloom:
            return @"Gloom";
        case PokemonId_Vileplume:
            return @"Vileplume";
        case PokemonId_Paras:
            return @"Paras";
        case PokemonId_Parasect:
            return @"Parasect";
        case PokemonId_Venonat:
            return @"Venonat";
        case PokemonId_Venomoth:
            return @"Venomoth";
        case PokemonId_Diglett:
            return @"Diglett";
        case PokemonId_Dugtrio:
            return @"Dugtrio";
        case PokemonId_Meowth:
            return @"Meowth";
        case PokemonId_Persian:
            return @"Persian";
        case PokemonId_Psyduck:
            return @"Psyduck";
        case PokemonId_Golduck:
            return @"Golduck";
        case PokemonId_Mankey:
            return @"Mankey";
        case PokemonId_Primeape:
            return @"Primeape";
        case PokemonId_Growlithe:
            return @"Growlithe";
        case PokemonId_Arcanine:
            return @"Arcanine";
        case PokemonId_Poliwag:
            return @"Poliwag";
        case PokemonId_Poliwhirl:
            return @"Poliwhirl";
        case PokemonId_Poliwrath:
            return @"Poliwrath";
        case PokemonId_Abra:
            return @"Abra";
        case PokemonId_Kadabra:
            return @"Kadabra";
        case PokemonId_Alakazam:
            return @"Alakazam";
        case PokemonId_Machop:
            return @"Machop";
        case PokemonId_Machoke:
            return @"Machoke";
        case PokemonId_Machamp:
            return @"Machamp";
        case PokemonId_Bellsprout:
            return @"Bellsprout";
        case PokemonId_Weepinbell:
            return @"Weepinbell";
        case PokemonId_Victreebel:
            return @"Victreebel";
        case PokemonId_Tentacool:
            return @"Tentacool";
        case PokemonId_Tentacruel:
            return @"Tentacruel";
        case PokemonId_Geodude:
            return @"Geodude";
        case PokemonId_Graveler:
            return @"Graveler";
        case PokemonId_Golem:
            return @"Golem";
        case PokemonId_Ponyta:
            return @"Ponyta";
        case PokemonId_Rapidash:
            return @"Rapidash";
        case PokemonId_Slowpoke:
            return @"Slowpoke";
        case PokemonId_Slowbro:
            return @"Slowbro";
        case PokemonId_Magnemite:
            return @"Magnemite";
        case PokemonId_Magneton:
            return @"Magneton";
        case PokemonId_Farfetchd:
            return @"Farfetchd";
        case PokemonId_Doduo:
            return @"Doduo";
        case PokemonId_Dodrio:
            return @"Dodrio";
        case PokemonId_Seel:
            return @"Seel";
        case PokemonId_Dewgong:
            return @"Dewgong";
        case PokemonId_Grimer:
            return @"Grimer";
        case PokemonId_Muk:
            return @"Muk";
        case PokemonId_Shellder:
            return @"Shellder";
        case PokemonId_Cloyster:
            return @"Cloyster";
        case PokemonId_Gastly:
            return @"Gastly";
        case PokemonId_Haunter:
            return @"Haunter";
        case PokemonId_Gengar:
            return @"Gengar";
        case PokemonId_Onix:
            return @"Onix";
        case PokemonId_Drowzee:
            return @"Drowzee";
        case PokemonId_Hypno:
            return @"Hypno";
        case PokemonId_Krabby:
            return @"Krabby";
        case PokemonId_Kingler:
            return @"Kingler";
        case PokemonId_Voltorb:
            return @"Voltorb";
        case PokemonId_Electrode:
            return @"Electrode";
        case PokemonId_Exeggcute:
            return @"Exeggcute";
        case PokemonId_Exeggutor:
            return @"Exeggutor";
        case PokemonId_Cubone:
            return @"Cubone";
        case PokemonId_Marowak:
            return @"Marowak";
        case PokemonId_Hitmonlee:
            return @"Hitmonlee";
        case PokemonId_Hitmonchan:
            return @"Hitmonchan";
        case PokemonId_Lickitung:
            return @"Lickitung";
        case PokemonId_Koffing:
            return @"Koffing";
        case PokemonId_Weezing:
            return @"Weezing";
        case PokemonId_Rhyhorn:
            return @"Rhyhorn";
        case PokemonId_Rhydon:
            return @"Rhydon";
        case PokemonId_Chansey:
            return @"Chansey";
        case PokemonId_Tangela:
            return @"Tangela";
        case PokemonId_Kangaskhan:
            return @"Kangaskhan";
        case PokemonId_Horsea:
            return @"Horsea";
        case PokemonId_Seadra:
            return @"Seadra";
        case PokemonId_Goldeen:
            return @"Goldeen";
        case PokemonId_Seaking:
            return @"Seaking";
        case PokemonId_Staryu:
            return @"Staryu";
        case PokemonId_Starmie:
            return @"Starmie";
        case PokemonId_MrMime:
            return @"MrMime";
        case PokemonId_Scyther:
            return @"Scyther";
        case PokemonId_Jynx:
            return @"Jynx";
        case PokemonId_Electabuzz:
            return @"Electabuzz";
        case PokemonId_Magmar:
            return @"Magmar";
        case PokemonId_Pinsir:
            return @"Pinsir";
        case PokemonId_Tauros:
            return @"Tauros";
        case PokemonId_Magikarp:
            return @"Magikarp";
        case PokemonId_Gyarados:
            return @"Gyarados";
        case PokemonId_Lapras:
            return @"Lapras";
        case PokemonId_Ditto:
            return @"Ditto";
        case PokemonId_Eevee:
            return @"Eevee";
        case PokemonId_Vaporeon:
            return @"Vaporeon";
        case PokemonId_Jolteon:
            return @"Jolteon";
        case PokemonId_Flareon:
            return @"Flareon";
        case PokemonId_Porygon:
            return @"Porygon";
        case PokemonId_Omanyte:
            return @"Omanyte";
        case PokemonId_Omastar:
            return @"Omastar";
        case PokemonId_Kabuto:
            return @"Kabuto";
        case PokemonId_Kabutops:
            return @"Kabutops";
        case PokemonId_Aerodactyl:
            return @"Aerodactyl";
        case PokemonId_Snorlax:
            return @"Snorlax";
        case PokemonId_Articuno:
            return @"Articuno";
        case PokemonId_Zapdos:
            return @"Zapdos";
        case PokemonId_Moltres:
            return @"Moltres";
        case PokemonId_Dratini:
            return @"Dratini";
        case PokemonId_Dragonair:
            return @"Dragonair";
        case PokemonId_Dragonite:
            return @"Dragonite";
        case PokemonId_Mewtwo:
            return @"Mewtwo";
        case PokemonId_Mew:
            return @"Mew";
        default:
            return nil;
    }
}

+ (NSString *)nameFromItemId:(ItemId)item {
    switch (item) {
        case ItemId_ItemPokeBall:
            return @"Poké Ball";
        case ItemId_ItemGreatBall:
            return @"Great Ball";
        case ItemId_ItemUltraBall:
            return @"Ultra Ball";
        case ItemId_ItemMasterBall:
            return @"Master Ball";
        default:
            return nil;
    }
}

+ (NSString *)nameForMove:(PokemonMove)move {
    switch (move) {
        case PokemonMove_ThunderShock:
            return @"Thunder Shock";
        case PokemonMove_QuickAttack:
            return @"Quick Attack";
        case PokemonMove_Scratch:
            return @"Scratch";
        case PokemonMove_Ember:
            return @"Ember";
        case PokemonMove_VineWhip:
            return @"Vine Whip";
        case PokemonMove_Tackle:
            return @"Tackle";
        case PokemonMove_RazorLeaf:
            return @"Razor Leaf";
        case PokemonMove_TakeDown:
            return @"Take Down";
        case PokemonMove_WaterGun:
            return @"Water Gun";
        case PokemonMove_Bite:
            return @"Bite";
        case PokemonMove_Pound:
            return @"Pound";
        case PokemonMove_DoubleSlap:
            return @"Double Slap";
        case PokemonMove_Wrap:
            return @"Wrap";
        case PokemonMove_HyperBeam:
            return @"Hyper Beam";
        case PokemonMove_Lick:
            return @"Lick";
        case PokemonMove_DarkPulse:
            return @"Dark Pulse";
        case PokemonMove_Smog:
            return @"Smog";
        case PokemonMove_Sludge:
            return @"Sludge";
        case PokemonMove_MetalClaw:
            return @"Metal Claw";
        case PokemonMove_ViceGrip:
            return @"Vice Grip";
        case PokemonMove_FlameWheel:
            return @"Flame Wheel";
        case PokemonMove_Megahorn:
            return @"Megahorn";
        case PokemonMove_WingAttack:
            return @"Wing Attack";
        case PokemonMove_Flamethrower:
            return @"Flamethrow";
        case PokemonMove_SuckerPunch:
            return @"Sucker Punch";
        case PokemonMove_Dig:
            return @"Dig";
        case PokemonMove_LowKick:
            return @"Low Kick";
        case PokemonMove_CrossChop:
            return @"Cross Chop";
        case PokemonMove_PsychoCut:
            return @"Psycho Cut";
        case PokemonMove_Psybeam:
            return @"Psybeam";
        case PokemonMove_Earthquake:
            return @"Earthquake";
        case PokemonMove_StoneEdge:
            return @"Stone";
        case PokemonMove_IcePunch:
            return @"Ice Punch";
        case PokemonMove_HeartStamp:
            return @"Heart Stamp";
        case PokemonMove_Discharge:
            return @"Discharge";
        case PokemonMove_FlashCannon:
            return @"Flash Cannon";
        case PokemonMove_Peck:
            return @"Peck";
        case PokemonMove_DrillPeck:
            return @"Drill Peck";
        case PokemonMove_IceBeam:
            return @"Ice Beam";
        case PokemonMove_Blizzard:
            return @"Blizzard";
        case PokemonMove_AirSlash:
            return @"Air Slash";
        case PokemonMove_HeatWave:
            return @"Heat Wave";
        case PokemonMove_Twineedle:
            return @"Twineedle";
        case PokemonMove_PoisonJab:
            return @"Poison Jab";
        case PokemonMove_AerialAce:
            return @"Aerial Ace";
        case PokemonMove_DrillRun:
            return @"Drill Run";
        case PokemonMove_PetalBlizzard:
            return @"Petal Blizzard";
        case PokemonMove_MegaDrain:
            return @"Mega Drain";
        case PokemonMove_BugBuzz:
            return @"Bug Buzz";
        case PokemonMove_PoisonFang:
            return @"Poison Fang";
        case PokemonMove_NightSlash:
            return @"Night Slash";
        case PokemonMove_Slash:
            return @"Slash";
        case PokemonMove_BubbleBeam:
            return @"Bubble Beam";
        case PokemonMove_Submission:
            return @"Submission";
        case PokemonMove_KarateChop:
            return @"Karate Chop";
        case PokemonMove_LowSweep:
            return @"Low Sweep";
        case PokemonMove_AquaJet:
            return @"Aqua Jet";
        case PokemonMove_AquaTail:
            return @"Aqua Tail";
        case PokemonMove_SeedBomb:
            return @"Seed Bomb";
        case PokemonMove_Psyshock:
            return @"Psyshock";
        case PokemonMove_RockThrow:
            return @"Rock Throw";
        case PokemonMove_AncientPower:
            return @"Ancient Power";
        case PokemonMove_RockTomb:
            return @"Rock Tomb";
        case PokemonMove_RockSlide:
            return @"Rock Slide";
        case PokemonMove_PowerGem:
            return @"Power Gem";
        case PokemonMove_ShadowSneak:
            return @"Shadow Sneak";
        case PokemonMove_ShadowPunch:
            return @"Shadow Punch";
        case PokemonMove_ShadowClaw:
            return @"Shadow Claw";
        case PokemonMove_OminousWind:
            return @"Ominous Wind";
        case PokemonMove_ShadowBall:
            return @"Shadow Ball";
        case PokemonMove_BulletPunch:
            return @"Bullet Punch";
        case PokemonMove_MagnetBomb:
            return @"Magnet Bomb";
        case PokemonMove_SteelWing:
            return @"Steel Wing";
        case PokemonMove_IronHead:
            return @"Iron Head";
        case PokemonMove_ParabolicCharge:
            return @"Parabolic Charge";
        case PokemonMove_Spark:
            return @"Spark";
        case PokemonMove_ThunderPunch:
            return @"Thunder Punch";
        case PokemonMove_Thunder:
            return @"Thunder";
        case PokemonMove_Thunderbolt:
            return @"Thunderbolt";
        case PokemonMove_Twister:
            return @"Twister";
        case PokemonMove_DragonBreath:
            return @"Dragon Breath";
        case PokemonMove_DragonPulse:
            return @"Dragon Pulse";
        case PokemonMove_DragonClaw:
            return @"Dragon Claw";
        case PokemonMove_DisarmingVoice:
            return @"Disarming Voice";
        case PokemonMove_DrainingKiss:
            return @"Draining Kiss";
        case PokemonMove_DazzlingGleam:
            return @"Dazzling Gleam";
        case PokemonMove_Moonblast:
            return @"Moon Blast";
        case PokemonMove_PlayRough:
            return @"Play Rough";
        case PokemonMove_CrossPoison:
            return @"Cross Poison";
        case PokemonMove_SludgeBomb:
            return @"Sludge Bomb";
        case PokemonMove_SludgeWave:
            return @"Sludge Wave";
        case PokemonMove_GunkShot:
            return @"Gunk Shot";
        case PokemonMove_MudShot:
            return @"Mud Shot";
        case PokemonMove_BoneClub:
            return @"Bone Club";
        case PokemonMove_Bulldoze:
            return @"Bulldoze";
        case PokemonMove_MudBomb:
            return @"Mud Bomb";
        case PokemonMove_FuryCutter:
            return @"Fury Cutter";
        case PokemonMove_BugBite:
            return @"Bug Bite";
        case PokemonMove_SignalBeam:
            return @"Signal Beam";
        case PokemonMove_XScissor:
            return @"X Scissor";
        case PokemonMove_FlameCharge:
            return @"Flame Charge";
        case PokemonMove_FlameBurst:
            return @"Flame Burst";
        case PokemonMove_FireBlast:
            return @"Fire Blast";
        case PokemonMove_Brine:
            return @"Brine";
        case PokemonMove_WaterPulse:
            return @"Water Pulse";
        case PokemonMove_Scald:
            return @"Scald";
        case PokemonMove_HydroPump:
            return @"Hydro Pump";
        case PokemonMove_Psychic:
            return @"Psychic";
        case PokemonMove_Psystrike:
            return @"Psystrike";
        case PokemonMove_IceShard:
            return @"Ice Shard";
        case PokemonMove_IcyWind:
            return @"Icy Wind";
        case PokemonMove_FrostBreath:
            return @"Frost Breath";
        case PokemonMove_Absorb:
            return @"Absorb";
        case PokemonMove_GigaDrain:
            return @"Giga Drain";
        case PokemonMove_FirePunch:
            return @"Fire Punch";
        case PokemonMove_SolarBeam:
            return @"Solar Beam";
        case PokemonMove_LeafBlade:
            return @"Leaf Blade";
        case PokemonMove_PowerWhip:
            return @"Power Whip";
        case PokemonMove_Splash:
            return @"Splash";
        case PokemonMove_Acid:
            return @"Acid";
        case PokemonMove_AirCutter:
            return @"Air Cutter";
        case PokemonMove_Hurricane:
            return @"Hurricane";
        case PokemonMove_BrickBreak:
            return @"Brick Break";
        case PokemonMove_Cut:
            return @"Cut";
        case PokemonMove_Swift:
            return @"Swift";
        case PokemonMove_HornAttack:
            return @"Horn Attack";
        case PokemonMove_Stomp:
            return @"Stomp";
        case PokemonMove_Headbutt:
            return @"Headbutt";
        case PokemonMove_HyperFang:
            return @"Hyper Fang";
        case PokemonMove_Slam:
            return @"Slam";
        case PokemonMove_BodySlam:
            return @"Body Slam";
        case PokemonMove_Rest:
            return @"Rest";
        case PokemonMove_Struggle:
            return @"Struggle";
        case PokemonMove_ScaldBlastoise:
            return @"Blastoise Scald";
        case PokemonMove_HydroPumpBlastoise:
            return @"Blastoise Hydro Pump";
        case PokemonMove_WrapGreen:
            return @"Green Rap";
        case PokemonMove_WrapPink:
            return @"Pink Wrap";
        case PokemonMove_FuryCutterFast:
            return @"Fast Fury Cutter";
        case PokemonMove_BugBiteFast:
            return @"Fast Bug Bite";
        case PokemonMove_BiteFast:
            return @"Fast Bite";
        case PokemonMove_SuckerPunchFast:
            return @"Fast Sucker Punch";
        case PokemonMove_DragonBreathFast:
            return @"Fast Dragon Breath";
        case PokemonMove_ThunderShockFast:
            return @"Fast Thunder Shock";
        case PokemonMove_SparkFast:
            return @"Fast Spawk";
        case PokemonMove_LowKickFast:
            return @"Fast Low Kick";
        case PokemonMove_KarateChopFast:
            return @"Fast Karate Chop";
        case PokemonMove_EmberFast:
            return @"Fast Ember";
        case PokemonMove_WingAttackFast:
            return @"Fask Wing Attack";
        case PokemonMove_PeckFast:
            return @"Fast Peck";
        case PokemonMove_LickFast:
            return @"Fast Lick";
        case PokemonMove_ShadowClawFast:
            return @"Fast Shadow Claw";
        case PokemonMove_VineWhipFast:
            return @"Fast Vine Whip";
        case PokemonMove_RazorLeafFast:
            return @"Fast Razor Leaf";
        case PokemonMove_MudShotFast:
            return @"Fast Mud Shot";
        case PokemonMove_IceShardFast:
            return @"Fast Ice Shard";
        case PokemonMove_FrostBreathFast:
            return @"Fast Frost Breath";
        case PokemonMove_QuickAttackFast:
            return @"Fast Quick Attack";
        case PokemonMove_ScratchFast:
            return @"Fast Scratch";
        case PokemonMove_TackleFast:
            return @"Fast Tackle";
        case PokemonMove_PoundFast:
            return @"Fast Pound";
        case PokemonMove_CutFast:
            return @"Fast Cut";
        case PokemonMove_PoisonJabFast:
            return @"Fast Poison Jab";
        case PokemonMove_AcidFast:
            return @"Fast Acid";
        case PokemonMove_PsychoCutFast:
            return @"Fast Psycho Cut";
        case PokemonMove_RockThrowFast:
            return @"Fast Rock Throw";
        case PokemonMove_MetalClawFast:
            return @"Fast Metal Claw";
        case PokemonMove_BulletPunchFast:
            return @"Fast Bullet Punch";
        case PokemonMove_WaterGunFast:
            return @"Fast Water Gun";
        case PokemonMove_SplashFast:
            return @"Fast Splash";
        case PokemonMove_WaterGunFastBlastoise:
            return @"Fast Blastoise Water Gun";
        case PokemonMove_MudSlapFast:
            return @"Fast Mud Slap";
        case PokemonMove_ZenHeadbuttFast:
            return @"Fast Zen Headbutt";
        case PokemonMove_ConfusionFast:
            return @"Fast Confusion";
        case PokemonMove_PoisonStingFast:
            return @"Fast Poison String";
        case PokemonMove_BubbleFast:
            return @"Fast Bubble";
        case PokemonMove_FeintAttackFast:
            return @"Fast Feint Attack";
        case PokemonMove_SteelWingFast:
            return @"Fast Steel Wing";
        case PokemonMove_FireFangFast:
            return @"Fast Fire Fang";
        case PokemonMove_RockSmashFast:
            return @"Fast Rock Smash";
        default:
            return nil;
    }
}

+ (NSString *)nameForTeam:(TeamColor)color {
    switch (color) {
        case TeamColor_Neutral:
            return @"Neutral";
        case TeamColor_Blue:
            return @"Blue";
        case TeamColor_Red:
            return @"Red";
        case TeamColor_Yellow:
            return @"Yellow";
        default:
            return nil;
    }
}

+ (UIColor *)colorForTeam:(TeamColor)color {
    switch (color) {
        case TeamColor_Neutral:
            return [UIColor whiteColor];
        case TeamColor_Blue:
            return [UIColor blueColor];
        case TeamColor_Red:
            return [UIColor redColor];
        case TeamColor_Yellow:
            return [UIColor yellowColor];
        default:
            return nil;
    }
}

@end
