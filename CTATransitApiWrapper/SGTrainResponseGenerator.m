//
//  SGTrainResponseGenerator.m
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/10/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import "SGTrainResponseGenerator.h"
#import "SGTrainResponse.h"
#import "SGTrain.h"
#import "GDataXMLNode.h"
#import "NSDate+CTADate.h"

@implementation SGTrainResponseGenerator

+ (SGTrainResponse *)trainResponseFromXMLData:(NSData *)xmlData {
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    
    SGTrainResponse *trainResponse = [[SGTrainResponse alloc] init];
    
    NSMutableArray *etaMutableArray = [NSMutableArray array];
    GDataXMLElement *errorElement = [[[doc rootElement] elementsForName:@"errCd"] objectAtIndex:0];
    trainResponse.errCd = [NSNumber numberWithInt:[[errorElement stringValue] intValue]];
    
    if (![trainResponse.errCd isEqualToNumber:[NSNumber numberWithInt:0]]) {
        NSString *xmlErrNm = [(GDataXMLElement *)[[[doc rootElement] elementsForName:@"errNm"] objectAtIndex:0] stringValue];
        trainResponse.errNm = [NSNumber numberWithInt:xmlErrNm.intValue];
    }
    
    NSArray *allTrains = [doc.rootElement elementsForName:@"eta"];
    
    for (GDataXMLElement *element in allTrains) {
        SGTrain *train = [[SGTrain alloc] init];
        NSArray *individualTrain = element.children;
        NSMutableDictionary *trainDictionary = [NSMutableDictionary dictionary];
        
        for (GDataXMLElement *prop in individualTrain) {
            NSDictionary *elementDictionary = [NSDictionary dictionaryWithObject:prop.stringValue forKey:prop.name];
            [trainDictionary addEntriesFromDictionary:elementDictionary];
        }
        
        train.staID = [NSNumber numberWithInt:[[trainDictionary objectForKey:@"staID"] intValue]];
        train.staNm = [trainDictionary objectForKey:@"staNm"];
        train.stpDe = [trainDictionary objectForKey:@"staDe"];
        train.rn = [NSNumber numberWithInt:[[trainDictionary objectForKey:@"rn"] intValue]];
        train.rt = [trainDictionary objectForKey:@"rt"];
        train.destSt = [NSNumber numberWithInt:[[trainDictionary objectForKey:@"destSt"] intValue]];
        train.destNm = [trainDictionary objectForKey:@"destNm"];
        train.trDr = [NSNumber numberWithInt:[[trainDictionary objectForKey:@"trDr"] intValue]];
        train.prdt = [NSDate ctaDateFromString:[trainDictionary objectForKey:@"prdt"]];
        train.arrT = [NSDate ctaDateFromString:[trainDictionary objectForKey:@"arrT"]];
        train.isApp = [[trainDictionary objectForKey:@"isApp"] boolValue];
        train.isSch = [[trainDictionary objectForKey:@"isSch"] boolValue];
        train.isDly = [[trainDictionary objectForKey:@"isDly"] boolValue];
        train.isFlt = [[trainDictionary objectForKey:@"isFlt"] boolValue];
        
        [etaMutableArray addObject:train];
    }
    
    trainResponse.eta = [NSArray arrayWithArray:etaMutableArray];
    return trainResponse;
}

@end
