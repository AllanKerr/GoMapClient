//
//  GSPlayerViewController.m
//  GymSniperClient
//
//  Created by 43f9879ddabcb80a685cf0e269a0bfca1e52786dee41c38604ae3b28a9d53657 on 2016-09-02.
//  Copyright © 2016 f6da75852aea28f8213466482daa395c113ec503406009dcaf1659e8139d4e56. All rights reserved.
//

#import "GSPlayerViewController.h"
#import "GSPokemonsViewController.h"
#import "GSPlayerGymsViewController.h"
#import "GSHistoricalActivityViewController.h"
#import "GSRecentActivityViewController.h"
#import "GSHistoricalActivity.h"
#import "GymHistory.pbobjc.h"
#import "GoMapClient.h"
#import "PGUtil.h"

NSString *const GSPokemonDescriptorTag = @"GSPokemonDescriptorTag";
NSString *const GSGymsDescriptorTag = @"GSGymsDescriptorTag";
NSString *const GSRecentActivityDescriptorTag = @"GSRecentActivityDescriptorTag";
NSString *const GSHistoricalActivityDescriptorTag = @"GSHistoricalActivityDescriptorTag";

@interface GSPlayerViewController ()
@property (nonatomic, strong) GetPlayerInfoResponse *data;
@end

@implementation GSPlayerViewController

- (instancetype)initWithPlayerName:(NSString *)name data:(GetPlayerInfoResponse *)data {

    self.data = data;
    
    XLFormDescriptor *form;
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:name];
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeInfo title:@"Team"];
    row.value = [PGUtil nameForTeam:data.teamColor];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:GSPokemonDescriptorTag rowType:XLFormRowDescriptorTypeSelectorPush title:@"Pokemon"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:GSGymsDescriptorTag rowType:XLFormRowDescriptorTypeSelectorPush title:@"Gyms"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:GSRecentActivityDescriptorTag rowType:XLFormRowDescriptorTypeSelectorPush title:@"Recent Activity"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:GSHistoricalActivityDescriptorTag rowType:XLFormRowDescriptorTypeSelectorPush title:@"Historical Activity"];
    [section addFormRow:row];

    return (self = [super initWithForm:form]);
}

-(void)didSelectFormRow:(XLFormRowDescriptor *)formRow {
    [super didSelectFormRow:formRow];
    
    if ([formRow.tag isEqualToString:GSPokemonDescriptorTag]) {
        GSPokemonsViewController *viewController = [[GSPokemonsViewController alloc] initWithPokemons:self.data.pokemonArray];
        [self.navigationController pushViewController:viewController animated:YES];
    } else if ([formRow.tag isEqualToString:GSGymsDescriptorTag]) {
        GSPlayerGymsViewController *viewController = [[GSPlayerGymsViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
        [viewController initializeGyms:self.data.gymIdsArray];
        [self.navigationController pushViewController:viewController animated:YES];
    } else if ([formRow.tag isEqualToString:GSRecentActivityDescriptorTag]) {
        GSRecentActivityViewController *viewController = [[GSRecentActivityViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
        [viewController initializeRecentActivity:self.data.recentActivityArray teamColor:self.data.teamColor];
        [self.navigationController pushViewController:viewController animated:YES];
    } else if ([formRow.tag isEqualToString:GSHistoricalActivityDescriptorTag]) {
        GSHistoricalActivityViewController *viewController = [[GSHistoricalActivityViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
        [viewController initializeHistoricalActivity:self.data.gymHistoryArray teamColor:self.data.teamColor];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
