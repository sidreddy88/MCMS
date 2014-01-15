//
//  ViewController.m
//  MythicalCreatures
//
//  Created by Anthony  Severino on 1/14/14.
//  Copyright (c) 2014 Simple Management Solutions, Inc. All rights reserved.
//

#import "ViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

{
    
    NSMutableArray *creatures;
    
    __weak IBOutlet UITableView *tableView;
  
    
    __weak IBOutlet UITextField *magicalCreatureTextField;
 
}

@end

@implementation ViewController



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [tableView indexPathForCell:sender];
//    indexPath = [myTableView indexPathForSelectedRow];
    vc.creature = creatures[indexPath.row];
    
    

}

- (IBAction)onAddButtonPressed:(id)sender {
    MagicalCreature *animal = [[MagicalCreature alloc]init];
    animal.name = magicalCreatureTextField.text;
    
    [creatures addObject:animal];
    [tableView reloadData];
    magicalCreatureTextField.text = @"";
    

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreaturesCellID"];
    
    MagicalCreature *animal = creatures [indexPath.row];
    
    cell.textLabel.numberOfLines = 6;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@\n %@", animal.name, animal.description];
//    cell.textLabel.text = animal.description;
    
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return creatures.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    creatures = [NSMutableArray array];
    MagicalCreature *Centaur = [[MagicalCreature alloc]init];
    MagicalCreature *Unicorn = [[MagicalCreature alloc]init];
    MagicalCreature *Cerberus= [[MagicalCreature alloc]init];
    Centaur.name = @"Centaur";
    Centaur.description = @"A centaur or hippocentaur is a mythological creature with the head, arms, and torso of a human and the body and legs of a horse";
    Centaur.image = [UIImage imageNamed:@"Centaur"];
    Unicorn.name = @"Unicorn";
    Unicorn.description = @" Cerberus in Greek and Roman mythology, is a multi-headed (usually three-headed) dog, or hellhound which guards the entrance of Hades, to prevent those who entered from ever escaping.";
    Unicorn.image = [UIImage imageNamed:@"unicorn"];
    Cerberus.name = @"Cerberus";
    Cerberus.description = @"The unicorn is a legendary animal that has been described since antiquity as a beast with a large, pointed, spiraling horn projecting from its forehead";
    Cerberus.image = [UIImage imageNamed:@"Cerberus"];
    [creatures addObject:Centaur];
    [creatures addObject:Unicorn];
    [creatures addObject: Cerberus];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
