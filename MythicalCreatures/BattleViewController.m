//
//  BattleViewController.m
//  MCMS
//
//  Created by Siddharth Sukumar on 1/14/14.
//  Copyright (c) 2014 Simple Management Solutions, Inc. All rights reserved.
//

#import "BattleViewController.h"
#import "ViewController.h"
#import "MagicalCreature.h"

@interface BattleViewController () {
    int numberOfLivesValueOfCentaur;
    int numberOFArrows;
    int numberOfLivesValueOfUnicorn;
    int numberOFPokes;
    int numberOfLivesValueOfCerberus;
    int numberOFSpits;
    
    
    
}
@property (strong, nonatomic) IBOutlet UITextField *playerOne;

@property (strong, nonatomic) IBOutlet UITextField *playerTwo;
@property (strong, nonatomic) IBOutlet UITextField *choosePlayerOne;
@property (strong, nonatomic) IBOutlet UITextField *choosePlayerTwo;

@property (strong, nonatomic) IBOutlet UITextField *winner;
@property ViewController *basicClass;

@property int numberOfTimesGamesPlayed;
@end

@implementation BattleViewController
@synthesize playerOne, playerTwo, choosePlayerOne, choosePlayerTwo, winner, basicClass, numberOfTimesGamesPlayed;

- (IBAction)startFight:(id)sender {
    playerOne.text = choosePlayerOne.text;
    playerTwo.text = choosePlayerTwo.text;
    
    int playerWhoWins = [self playGame];
    
    
    
    
    if (playerWhoWins == 1){
        winner.text = @"Centaur";
        
    } else if (playerWhoWins == 2){
        winner.text = @"Unicorn";
        
    } else {
        winner.text = @"Cerberus";
    }
    
}

- (int) playGame {
    
    
    MagicalCreature *centaur = basicClass.creatures[0];
    
    MagicalCreature *unicorn = basicClass.creatures[1];
    
    
    MagicalCreature *cerberus = basicClass.creatures[2];
    
    
    
    if(numberOfTimesGamesPlayed % 2 != 0){
        numberOfLivesValueOfCentaur =[[centaur.accesories objectAtIndex:0] integerValue];
        numberOfLivesValueOfCentaur--;
        
         numberOFArrows = [[centaur.accesories objectAtIndex:0] integerValue];
        numberOFArrows --;
    }
    
    if(numberOfTimesGamesPlayed % 3 != 0){
         numberOfLivesValueOfUnicorn =[[unicorn.accesories objectAtIndex:0] integerValue];
        numberOfLivesValueOfUnicorn--;
        
         numberOFPokes= [[centaur.accesories objectAtIndex:0] integerValue];
        numberOFPokes--;
    }
    
    if (numberOfTimesGamesPlayed % 4 != 0){
        
         numberOfLivesValueOfCerberus =[[unicorn.accesories objectAtIndex:0] integerValue];
        numberOfLivesValueOfUnicorn--;
        
         numberOFSpits= [[cerberus.accesories objectAtIndex:0] integerValue];
        numberOFSpits--;
    
    }
    
    numberOfTimesGamesPlayed++;
    
    
    if (numberOfLivesValueOfCentaur > numberOfLivesValueOfUnicorn && numberOfLivesValueOfCentaur> numberOfLivesValueOfCerberus && numberOFArrows > numberOFPokes  && numberOFArrows > numberOFPokes){
        return 1;
    } else if (numberOfLivesValueOfUnicorn > numberOfLivesValueOfCentaur && numberOfLivesValueOfCerberus > numberOfLivesValueOfCerberus && numberOFPokes > numberOFArrows && numberOFPokes > numberOFSpits){
        return 2;
    } else if (numberOfLivesValueOfCerberus > numberOfLivesValueOfCentaur && numberOfLivesValueOfCerberus> numberOfLivesValueOfUnicorn && numberOFSpits > numberOFPokes && numberOFSpits > numberOFArrows){
        return 3;
    } else {
        return 1;
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
