//
//  SGFlipsideViewController.h
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/9/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SGFlipsideViewController;

@protocol SGFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(SGFlipsideViewController *)controller;
@end

@interface SGFlipsideViewController : UIViewController

@property (weak, nonatomic) id <SGFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
