//
//  ViewController.m
//  DSLoopLabelExample
//
//  Created by David Sahakyan on 4/12/13.
//  Copyright (c) 2013 David Sahakyan. All rights reserved.
//

#import "DSLoopLabel.h"

#import "ViewController.h"

@interface ViewController () <DSLoopLabelDelegate>

@property (weak, nonatomic) IBOutlet DSLoopLabel *loopLabel1;
@property (weak, nonatomic) IBOutlet DSLoopLabel *loopLabel2;
@property (weak, nonatomic) IBOutlet DSLoopLabel *loopLabel3;
@property (weak, nonatomic) IBOutlet DSLoopLabel *loopLabel4;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

//------------------------------------------------//
#pragma mark - DSLoopLabel Delegate
//------------------------------------------------//
- (void)loopingDidStarted
{
    self.statusLabel.text = @"status: loop started";
}

- (void)loopingDidEnded
{
    self.statusLabel.text = @"status: loop ended";
}

//------------------------------------------------//
#pragma mark - Actions
//------------------------------------------------//

- (IBAction)demoPressed:(UIButton *)sender
{
    self.loopLabel1.score = 1234567;
    self.loopLabel2.score = 4321;
    self.loopLabel3.score = 21;
    
    self.loopLabel4.score = 12;
}

- (IBAction)resetPressed:(UIButton *)sender
{
    self.loopLabel1.score = 0;
    self.loopLabel2.score = 0;
    self.loopLabel3.score = 0;
    self.loopLabel4.score = 0;
}

//------------------------------------------------//
#pragma mark - LifeCycle
//------------------------------------------------//

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Initing delegate
    self.loopLabel1.delegate = self;
    
    //Adding sound for looping
    self.loopLabel1.soundForLooping = @"loop.caf";
    //Custom time to label4
    self.loopLabel4.looperTime = 5.0;
}

- (void)viewDidUnload {
    [self setLoopLabel4:nil];
    [super viewDidUnload];
}
@end
