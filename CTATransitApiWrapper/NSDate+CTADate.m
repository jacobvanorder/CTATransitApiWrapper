//
//  NSDate+CTADate.m
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/10/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import "NSDate+CTADate.h"

@implementation NSDate (CTADate)

+ (NSDate *) ctaDateFromString:(NSString *)ctaDateString {
    
    // Example of the CTA format: 20110620 17:55:30
    
    NSDateFormatter *dateFM = [[NSDateFormatter alloc] init];
    [dateFM setDateFormat:@"yyyyMMdd HH:mm:ss"]; //lowercase y!
    [dateFM setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFM setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *formattedCTADate = [dateFM dateFromString:ctaDateString];
    
    return formattedCTADate;
}

@end
