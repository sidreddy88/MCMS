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
    
    
    

    __weak IBOutlet UITextField *nameTextField;
    
   
    __weak IBOutlet UITextView *labelShowingDescription;
    
    __weak IBOutlet UILabel *name;
    
    __weak IBOutlet UIButton *Save;
//    UIImage *image;
}


@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation CreatureViewController
@synthesize creature, imageView;


- (IBAction)onSaveButtonPressed:(id)sender {
    
    creature.name = nameTextField.text;
    name.alpha = 1;
    name.text = creature.name;
    nameTextField.alpha = 0;
    
}

- (IBAction)onEditButtonPressed:(id)sender {
    name.alpha = 0;
    nameTextField.alpha = 1;
    nameTextField.text = creature.name;
    labelShowingDescription.text = creature.description;
    labelShowingDescription.alpha = 1;
    
    
  
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	name.text = creature.name;
    nameTextField.alpha = 0;
    labelShowingDescription.alpha = 0;
//    imageView = [[UIImageView alloc]initWithImage:creature.image];
    imageView.image = creature.image;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
