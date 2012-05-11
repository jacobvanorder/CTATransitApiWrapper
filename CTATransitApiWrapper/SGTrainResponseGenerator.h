//
//  SGTrainResponseGenerator.h
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/10/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SGTrainResponse;

@interface SGTrainResponseGenerator : NSObject

+ (SGTrainResponse *)trainResponseFromXMLData:(NSData *)xmlData;

@end
