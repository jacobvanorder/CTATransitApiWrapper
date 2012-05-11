//
//  SGMainViewController.m
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/9/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import "SGMainViewController.h"
#import "SGCTATrainTool.h"
#import "SGTrainResponse.h"
#import "SGTrain.h"

@interface SGMainViewController ()

@property (strong, nonatomic) IBOutlet UITextField *apiTextField;
@property (strong, nonatomic) IBOutlet UITextField *stationIDTextField;
@property (strong, nonatomic) IBOutlet UITextField *mapIDTextField;
@property (strong, nonatomic) IBOutlet UILabel *resultsLabel;

- (IBAction)lookupButtonWasTapped:(id)sender;
-(void)populateResultsLabelWith:(SGTrainResponse *)trainResponse;

@end

@implementation SGMainViewController
@synthesize apiTextField;
@synthesize stationIDTextField;
@synthesize mapIDTextField;
@synthesize resultsLabel;

#pragma mark delegate methods

#pragma mark customization

- (IBAction)lookupButtonWasTapped:(id)sender {
    
    [self.apiTextField resignFirstResponder];
    [self.stationIDTextField resignFirstResponder];
    [self.mapIDTextField resignFirstResponder];
    
    NSString *apiKey = self.apiTextField.text;    
    if (apiKey.length < 32 || apiKey.length > 32) {
        [self showAlertWithTitle:@"API Key invalid" andReason:@"Did you put in your API key correctly?"];
        return;
    }    
    SGCTATrainTool *trainTool = [SGCTATrainTool trainToolWithApiKey:apiKey];
    
    NSString *stopID = stationIDTextField.text;
    if (![stopID isEqualToString:@""]) {
        if (stopID.length < 5 && stopID != 0) {
            [self showAlertWithTitle:@"Bad StopID" andReason:@"Your stationID doesn't seem valid"];
            return;
        }
        else {
            [trainTool getCTAInfoForStopID:stopID andMaxResponses:5 withCallback:^(SGTrainResponse *returnResponse, NSError *responseError) {
                if (responseError) {
                    [self showAlertWithTitle:@"Error" andReason:@"There was a problem with your request. Double check and try again."];
                }
                else {
                    [self populateResultsLabelWith:returnResponse];
                }
            }];
            return;
        }
    }
    
    NSString *mapID = mapIDTextField.text;
    if (![mapID isEqualToString:@""]) {
        if (mapID.length < 5 && mapID != 0) {
            [self showAlertWithTitle:@"Bad MapID" andReason:@"Your mapID doesn't seem valid"];
            return;
        }
        else {
            [trainTool getCTAInfoForMapID:mapID andMaxResponses:5 withCallback:^(SGTrainResponse *returnResponse, NSError *responseError) {
                if (responseError) {
                    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error with your request. Double check your info" delegate:nil cancelButtonTitle:@"Drag…" otherButtonTitles: nil];
                    [errorAlert show];
                }
                else {
                    [self populateResultsLabelWith:returnResponse];
                }
            }];
        } 
    }

}

-(void)showAlertWithTitle:(NSString *)titleString andReason:(NSString *)reasonString {
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:titleString message:reasonString delegate:nil cancelButtonTitle:@"Drag…" otherButtonTitles: nil];
    [errorAlert show];      
}


-(void)populateResultsLabelWith:(SGTrainResponse *)trainResponse {
    NSMutableString *responseString = [NSMutableString string];
    
    for (SGTrain *chooChoo in trainResponse.eta) {
        [responseString appendString:[NSString stringWithFormat:@"%@ \n", chooChoo.description]];
    }
    
    self.resultsLabel.text = responseString;
}

#pragma mark prototyping

#pragma mark stock code


- (void)viewDidLoad
{
    [super viewDidLoad];    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setApiTextField:nil];
    [self setResultsLabel:nil];
    [self setStationIDTextField:nil];
    [self setMapIDTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(SGFlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}




@end
