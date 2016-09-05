//
//  PGUtil.h
//  ObjectivePoGo
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-08-27.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokemonId.pbobjc.h"
#import "ItemId.pbobjc.h"
#import "PokemonMove.pbobjc.h"
#import "TeamColor.pbobjc.h"

@interface PGUtil : NSObject
+ (double)applyNoise:(double)value magnitude:(double)magnitude;
+ (NSString *)nameFromPokemonId:(PokemonId)pokemonId;
+ (NSString *)nameFromItemId:(ItemId)item;
+ (NSString *)nameForMove:(PokemonMove)move;
+ (NSString *)nameForTeam:(TeamColor)color;
+ (UIColor *)colorForTeam:(TeamColor)color;
@end
