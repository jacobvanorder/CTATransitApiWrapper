//
//  SGCTATrainTool.h
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/9/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SGTrainResponse;

@interface SGCTATrainTool : NSObject

+(id)trainToolWithApiKey:(NSString *)apiKey;

-(void)getCTAInfoForStopID:(NSString *)stopID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *returnResponse, NSError *responseError))trainHandler;
-(void)getCTAInfoForMapID:(NSString *)mapID andMaxResponses:(int)maxResponses withCallback:(void (^)(SGTrainResponse *, NSError *))trainHandler;

@end
