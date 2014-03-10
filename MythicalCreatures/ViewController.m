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
    
    
    __weak IBOutlet UITableView *tableView;
  
    
    __weak IBOutlet UITextField *magicalCreatureTextField;
 
}

@end

@implementation ViewController

@synthesize  creatures;

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

-(UITableViewCell *)tableView:(UITableView *)myTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

-(void ) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [tableView reloadData];
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
    Centaur.image = [UIImage imageNamed:@"Centaur.jpg"];
    
    NSNumber *numberOfLives = [NSNumber numberWithInt:5];
    NSNumber *numberOfArrowsLeft = [NSNumber numberWithInt: 5];
    
    [Centaur.accesories addObject:numberOfLives];
    [Centaur.accesories addObject:numberOfArrowsLeft];
    
    
    Unicorn.name = @"Unicorn";
    Unicorn.description = @" The unicorn is a legendary animal that has been described since antiquity as a beast with a large, pointed, spiraling horn projecting from its forehead";
    
    Unicorn.image = [UIImage imageNamed:@"unicorn.jpg"];
    NSNumber *numberOfPokesLeft = @5;
    [Unicorn.accesories addObject:numberOfLives];
    [Unicorn.accesories addObject:numberOfPokesLeft];
         Cerberus.name = @"Cerberus";
    Cerberus.description = @"Cerberus in Greek and Roman mythology, is a multi-headed (usually three-headed) dog, or hellhound which guards the entrance of Hades, to prevent those who entered from ever escaping.";
    Cerberus.image = [UIImage imageNamed:@"cerberus.jpg"];
    NSNumber *numberOfSpitsLeft = [NSNumber numberWithInt: 5];
    [Cerberus.accesories addObject:numberOfLives];
    [Cerberus.accesories addObject:numberOfSpitsLeft];

    
    
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
