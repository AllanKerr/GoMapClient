//
//  GSPokemonViewController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSPokemonViewController.h"
#import "PGUtil.h"

@interface GSPokemonViewController ()

@end

@implementation GSPokemonViewController

- (instancetype)initWithPokemonData:(PokemonData *)data {

    XLFormDescriptor *form;
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;

    NSString *title = [PGUtil nameFromPokemonId:data.pokemonId];
    form = [XLFormDescriptor formDescriptorWithTitle:title];

    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Owner"];
    row.value = data.ownerName;
    [section addFormRow:row];
    
    if (data.nickname.length > 0) {
        row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Nickname"];
        row.value = data.nickname;
        [section addFormRow:row];
    }
    NSDate *foundAtDate = [NSDate dateWithTimeIntervalSince1970:data.creationTimeMs/1000];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Caught"];
    row.value = [dateFormatter stringFromDate:foundAtDate];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Stamina"];
    row.value = [NSString stringWithFormat:@"%i/%i", data.stamina, data.staminaMax];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Moves";
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Move 1"];
    row.value = [PGUtil nameForMove:data.move1];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Move 2"];
    row.value = [PGUtil nameForMove:data.move2];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Combat Power";
    [form addFormSection:section];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"CP"];
    row.value = [NSString stringWithFormat:@"%i", data.cp];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"CP Multiplier"];
    row.value = [NSString stringWithFormat:@"%f", data.cpMultiplier];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Additional CP Multiplier"];
    row.value = [NSString stringWithFormat:@"%f", data.additionalCpMultiplier];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Individual Values";
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Attack IV"];
    row.value = [NSString stringWithFormat:@"%i", data.individualAttack];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Defense IV"];
    row.value = [NSString stringWithFormat:@"%i", data.individualDefense];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Stamina IV"];
    row.value = [NSString stringWithFormat:@"%i", data.individualStamina];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Size";
    [form addFormSection:section];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Height"];
    row.value = [NSString stringWithFormat:@"%f m", data.heightM];
    [section addFormRow:row];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Weight"];
    row.value = [NSString stringWithFormat:@"%f kg", data.weightKg];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Miscellaneous";
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Upgrades"];
    row.value = [NSString stringWithFormat:@"%i", data.numUpgrades];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Battles Attacked"];
    row.value = [NSString stringWithFormat:@"%i", data.battlesAttacked];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Battles Defended"];
    row.value = [NSString stringWithFormat:@"%i", data.battlesDefended];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Poké Ball"];
    row.value = [PGUtil nameFromItemId:data.pokeball];
    [section addFormRow:row];

    return (self = [super initWithForm:form]);
}

@end
