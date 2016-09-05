//
//  GSPokemonsViewController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSPokemonsViewController.h"
#import "GSPokemonViewController.h"
#import "PGUtil.h"
#import "PokemonData.pbobjc.h"

@interface GSPokemonsViewController ()
@property (nonatomic, strong) NSArray *pokemons;
@end

@implementation GSPokemonsViewController

- (instancetype)initWithPokemons:(NSArray *)pokemons {

    self.pokemons = [pokemons sortedArrayUsingComparator:^NSComparisonResult(PokemonData *data1, PokemonData *data2) {
        if (data1.cp == data2.cp) {
            return NSOrderedSame;
        } else if (data1.cp > data2.cp) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    XLFormDescriptor *form;
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Pokemon"];
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    int i = 0;
    for (PokemonData *data in self.pokemons) {
        NSString *tag = [NSString stringWithFormat:@"%i", i];
        row = [XLFormRowDescriptor formRowDescriptorWithTag:tag rowType:XLFormRowDescriptorTypeSelectorPush title:[PGUtil nameFromPokemonId:data.pokemonId]];
        NSString *identifier = [NSString stringWithFormat:@"%i",(int)data.pokemonId];
        [row.cellConfigAtConfigure setObject:[UIImage imageNamed:identifier] forKey:@"imageView.image"];
        row.value = [NSString stringWithFormat:@"%i", data.cp];
        [section addFormRow:row];
        i++;
    }
    return (self = [super initWithForm:form]);
}

-(void)didSelectFormRow:(XLFormRowDescriptor *)formRow {
    [super didSelectFormRow:formRow];
    
    int index = [formRow.tag intValue];
    PokemonData *data = [self.pokemons objectAtIndex:index];
    GSPokemonViewController *viewController = [[GSPokemonViewController alloc] initWithPokemonData:data];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
