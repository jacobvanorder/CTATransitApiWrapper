//
//  SGCTATrainTool.m
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/9/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import "SGCTATrainTool.h"
#import "SGTrainResponse.h"
#import "SGTrainResponseGenerator.h"

static NSString *apiKey;

@interface SGCTATrainTool ()

@end

@implementation SGCTATrainTool

+(id)trainToolWithApiKey:(NSString *)incomingApiKey {
    
    apiKey = incomingApiKey;
    
    return [[SGCTATrainTool alloc] init];
}

-(void)getCTAInfoForStopID:(NSString *)stopID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *, NSError *))trainHandler {
    
    NSString *urlString = [NSString stringWithFormat:@"http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=%@&stpid=%@&max=%i",apiKey, stopID, maxResponses];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSOperationQueue *operationQueue = [NSOperationQueue currentQueue];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:operationQueue completionHandler:^(NSURLResponse *response, NSData *sendData, NSError *connectionError) {
        BOOL requestHadError = NO;
        
        if (connectionError) {
            requestHadError = YES;
        }
        else {
            SGTrainResponse *trainResponse = [SGTrainResponseGenerator trainResponseFromXMLData:sendData];
            trainHandler(trainResponse, nil);
        }
        
        if (requestHadError) {
            trainHandler(nil, connectionError);
        }
        
    }]; 
}

-(void)getCTAInfoForMapID:(NSString *)mapID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *, NSError *))trainHandler {
    
    NSString *urlString = [NSString stringWithFormat:@"http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=%@&mapid=%@&max=%i",apiKey, mapID, maxResponses];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSOperationQueue *operationQueue = [NSOperationQueue currentQueue];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:operationQueue completionHandler:^(NSURLResponse *response, NSData *sendData, NSError *connectionError) {
        BOOL requestHadError = NO;
        
        if (connectionError) {
            requestHadError = YES;
        }
        else {
            SGTrainResponse *trainResponse = [SGTrainResponseGenerator trainResponseFromXMLData:sendData];
            trainHandler(trainResponse, nil);
        }
        
        if (requestHadError) {
            trainHandler(nil, connectionError);
        }
        
    }]; 
}



-(NSString *)description {
    return apiKey;
}

#pragma mark delegate methods

#pragma mark customization

#pragma mark prototyping

#pragma mark stock code

-(id)init {
    self = [super init];
    if (self) {
    }
    
    return  self;
}


@end
