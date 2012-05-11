//
//  NSDate+CTADate.h
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/10/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CTADate)

+ (NSDate *) ctaDateFromString:(NSString *)ctaDateString;

@end
