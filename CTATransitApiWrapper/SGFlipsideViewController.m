//
//  SGFlipsideViewController.m
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/9/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import "SGFlipsideViewController.h"

@interface SGFlipsideViewController ()

@end

@implementation SGFlipsideViewController

@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
