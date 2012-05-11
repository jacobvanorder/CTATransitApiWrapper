//
//  SGTrainResponse.h
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/9/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGTrainResponse : NSObject

@property (nonatomic, strong) NSDate *tmst; //Shows time when response was generated in format: yyyyMMdd HH:mm:ss (24-hour format, time local to Chicago)
@property (nonatomic, strong) NSNumber *errCd; // Numeric error code (see appendices)
@property (nonatomic, strong) NSNumber *errNm; // Textual error description/message (see appendices)
@property (nonatomic, strong) NSArray *eta; // Container element (one per individual prediction)

@end
