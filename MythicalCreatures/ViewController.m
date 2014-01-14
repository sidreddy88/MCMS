//
//  ViewController.m
//  MythicalCreatures
//
//  Created by Anthony  Severino on 1/14/14.
//  Copyright (c) 2014 Simple Management Solutions, Inc. All rights reserved.
//

#import "ViewController.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

{
    
    NSMutableArray *creatures;
    
    __weak IBOutlet UITableView *tableView;
    __weak IBOutlet UITextField *magicalCreatureTextfield;
    
}

@end

@implementation ViewController

- (IBAction)onAddButtonPressed:(id)sender
{
    [creatures addObject:magicalCreatureTextfield.text];
    [tableView reloadData];
    magicalCreatureTextfield.text = @"";

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [tableView indexPathForCell:sender];
//    indexPath = [myTableView indexPathForSelectedRow];
    vc.creature = creatures[indexPath.row];
    
    

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreaturesCellID"];
    
    MagicalCreature *animal = creatures [indexPath.row];
    
    cell.textLabel.text = animal.name;
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return creatures.count;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    creatures = [NSMutableArray array];
    MagicalCreature *Lion = [[MagicalCreature alloc]init];
    MagicalCreature *Tiger = [[MagicalCreature alloc]init];
    MagicalCreature *Bear = [[MagicalCreature alloc]init];
    Lion.name = @"Lion";
    Tiger.name = @"Tiger";
    Bear.name = @"Bear";
    [creatures addObject:Lion];
    [creatures addObject:Tiger];
    [creatures addObject:Bear];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
