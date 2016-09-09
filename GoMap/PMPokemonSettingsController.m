//
//  PMPokemonSettingsController.m
//  Pokemap
//
//  Created by Allan Kerr on 2016-07-27.
//  Copyright © 2016 ruffneck. All rights reserved.
//

#import "PMPokemonSettingsController.h"
#import "PGPokemonSettings.h"
#import "PGUtil.h"

@interface PMPokemonSettingsController ()
@property (nonatomic) BOOL updateFailed;
@end

@implementation PMPokemonSettingsController

- (NSString *)nameForSettings:(PokemonSettings)settings {
    switch (settings) {
        case PokemonSettingsDisabled:
            return @"Disabled";
        case PokemonSettingsDefault:
            return @"Hidden";
        case PokemonSettingsSearch:
            return @"Normal";
        case PokemonSettingsSearchAndAlert:
            return @"Alert";
        case PokemonSettingsAlertAndVibrate:
            return @"Alert and Vibrate";
        case PokemonSettingsAlarm:
            return @"Alarm";
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        XLFormDescriptor *form;
        XLFormSectionDescriptor *section;
        XLFormRowDescriptor *row;
        
        form = [XLFormDescriptor formDescriptorWithTitle:NSLocalizedString(@"Settings", nil)];
        
        section = [XLFormSectionDescriptor formSection];
        [form addFormSection:section];
        
        PGPokemonSettings *sharedSettings = [PGPokemonSettings sharedSettings];
        for (PokemonId pokemonId = PokemonId_Bulbasaur; pokemonId <= PokemonId_Mew; pokemonId++) {
            NSString *identifier = [NSString stringWithFormat:@"%i",(int)pokemonId];
            PokemonSettings settings = [sharedSettings settingsForId:pokemonId];
            row = [XLFormRowDescriptor formRowDescriptorWithTag:identifier rowType:XLFormRowDescriptorTypeSelectorPush title:[PGUtil nameFromPokemonId:pokemonId]];
            row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(settings) displayText:[self nameForSettings:settings]];
            [row.cellConfigAtConfigure setObject:[UIImage imageNamed:identifier] forKey:@"imageView.image"];

            row.selectorTitle = row.title;
            if (settings != PokemonSettingsDisabled) {
                row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(PokemonSettingsDefault) displayText:[self nameForSettings:PokemonSettingsDefault]],
                                        [XLFormOptionsObject formOptionsObjectWithValue:@(PokemonSettingsSearch) displayText:[self nameForSettings:PokemonSettingsSearch]],
                                        [XLFormOptionsObject formOptionsObjectWithValue:@(PokemonSettingsSearchAndAlert) displayText:[self nameForSettings:PokemonSettingsSearchAndAlert]],
                                        [XLFormOptionsObject formOptionsObjectWithValue:@(PokemonSettingsAlertAndVibrate) displayText:[self nameForSettings:PokemonSettingsAlertAndVibrate]],
                                        [XLFormOptionsObject formOptionsObjectWithValue:@(PokemonSettingsAlarm) displayText:[self nameForSettings:PokemonSettingsAlarm]]];

            } else {
                row.disabled = @YES;
            }
            [section addFormRow:row];
        }
        self.form = form;
    }
    return self;
}

- (void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)rowDescriptor oldValue:(id)oldValue newValue:(id)newValue {
    [super formRowDescriptorValueHasChanged:rowDescriptor oldValue:oldValue newValue:newValue];
    if (self.updateFailed) {
        self.updateFailed = NO;
    } else {
        PokemonId pokemondId = (PokemonId)[rowDescriptor.tag integerValue];
        PokemonSettings settings = (PokemonSettings)[[rowDescriptor.value formValue] unsignedIntegerValue];
        [[PGPokemonSettings sharedSettings] updateSettings:settings forId:pokemondId completion:^(NSError *error){
            if (error != nil) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Update Failed" message:@"An error occurred while updating the settings. Please try again." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
                
                self.updateFailed = YES;
                rowDescriptor.value = oldValue;
                [self.tableView reloadData];
            }
        }];
    }
}

- (void)done {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
