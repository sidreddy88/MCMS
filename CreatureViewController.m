//
//  CreatureViewController.m
//  MythicalCreatures
//
//  Created by Anthony  Severino on 1/14/14.
//  Copyright (c) 2014 Simple Management Solutions, Inc. All rights reserved.
//

#import "CreatureViewController.h"


@interface CreatureViewController ()
{
    
    __weak IBOutlet UILabel *name;
}




@end

@implementation CreatureViewController
@synthesize creature;




- (void)viewDidLoad
{
    [super viewDidLoad];
	name.text = creature.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
