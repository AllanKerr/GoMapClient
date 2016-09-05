//
//  GSGymViewController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-01.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSGymViewController.h"
#import "GSPokemonViewController.h"
#import "GymMembership.pbobjc.h"
#import "PlayerPublicProfile.pbobjc.h"
#import "PokemonData.pbobjc.h"
#import "PGUtil.h"
#import "GSPokemonViewController.h"
#import "GSPlayerViewController.h"
#import "GoMapClient.h"

@interface GSGymViewController ()
@property (nonatomic, strong) GSGym *gym;
@end

@implementation GSGymViewController

- (instancetype)initWithGym:(GSGym *)gym {
    
    self.gym = gym;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];

    XLFormDescriptor *form;
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:gym.title];
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Level";
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Team"];
    row.value = [PGUtil nameForTeam:gym.details.gymState.fortData.ownedByTeam];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Points"];
    row.value = [NSString stringWithFormat:@"%lli", gym.details.gymState.fortData.gymPoints];
    [section addFormRow:row];
    
    int i = 0;
    for (GymMembership *membership in gym.details.gymState.membershipsArray) {
        section = [XLFormSectionDescriptor formSection];
        if (i == 0) {
            section.title = @"Pokemon";
        }
        [form addFormSection:section];
        
        NSString *tag = [NSString stringWithFormat:@"%i", i];
        row = [XLFormRowDescriptor formRowDescriptorWithTag:tag rowType:XLFormRowDescriptorTypeSelectorPush title:@"Trainer"];
        row.value = [NSString stringWithFormat:@"%@\t%i", membership.trainerPublicProfile.name, membership.trainerPublicProfile.level];
        [section addFormRow:row];

        row = [XLFormRowDescriptor formRowDescriptorWithTag:tag rowType:XLFormRowDescriptorTypeSelectorPush title:@""];
        row.value = [NSString stringWithFormat:@"%@\t%i", [PGUtil nameFromPokemonId:membership.pokemonData.pokemonId], membership.pokemonData.cp];
        NSString *identifier = [NSString stringWithFormat:@"%i",(int)membership.pokemonData.pokemonId];
        [row.cellConfigAtConfigure setObject:[UIImage imageNamed:identifier] forKey:@"imageView.image"];
        [section addFormRow:row];
        i++;
    }
    return (self = [super initWithForm:form]);
}

- (void)didSelectFormRow:(XLFormRowDescriptor *)formRow {
    [super didSelectFormRow:formRow];

    if (formRow.tag != nil) {
        int index = [formRow.tag intValue];
        if ([formRow.title isEqualToString:@"Trainer"]) {
            GymMembership *membership = [self.gym.details.gymState.membershipsArray objectAtIndex:index];
            NSString *name = membership.trainerPublicProfile.name;
            [[GoMapClient sharedInstance] fetchPlayer:name completion:^(GetPlayerInfoResponse *response, NSError *error){
                if (error == nil) {
                    GSPlayerViewController *viewController = [[GSPlayerViewController alloc] initWithPlayerName:name data:response];
                    [self.navigationController pushViewController:viewController animated:YES];
                } else {
                    
                }
            }];
        } else {
            GymMembership *membership = [self.gym.details.gymState.membershipsArray objectAtIndex:index];
            GSPokemonViewController *viewController = [[GSPokemonViewController alloc] initWithPokemonData:membership.pokemonData];
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
}

- (void)done {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
@property(nonatomic, readwrite) uint64_t id_p;


@property(nonatomic, readwrite) enum PokemonMove move1;

@property(nonatomic, readwrite) enum PokemonMove move2;

@property(nonatomic, readwrite) enum ItemId pokeball;

@property(nonatomic, readwrite) uint64_t capturedCellId;

@property(nonatomic, readwrite) int32_t battlesAttacked;

@property(nonatomic, readwrite) int32_t battlesDefended;

@property(nonatomic, readwrite, copy, null_resettable) NSString *eggIncubatorId;

@property(nonatomic, readwrite) uint64_t creationTimeMs;

@property(nonatomic, readwrite) int32_t numUpgrades;

@property(nonatomic, readwrite) float additionalCpMultiplier;

@property(nonatomic, readwrite) int32_t favorite;

@property(nonatomic, readwrite, copy, null_resettable) NSString *nickname;

@property(nonatomic, readwrite) int32_t fromFort;

@property(nonatomic, readwrite) int32_t buddyCandyAwarded;
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
