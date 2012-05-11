//
//  SGTrain.m
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/10/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import "SGTrain.h"

@implementation SGTrain

@synthesize staID = _staID;
@synthesize staNm = _staNm;
@synthesize stpDe = _stpDe;
@synthesize rn = _rn;
@synthesize rt = _rt;
@synthesize destSt = _destSt;
@synthesize destNm = _destNm;
@synthesize trDr = _trDr;
@synthesize prdt = _prdt;
@synthesize arrT = _arrT;
@synthesize isApp = _isApp;
@synthesize isSch = _isSch;
@synthesize isFlt = _isFlt;
@synthesize isDly = _isDly;

-(NSString *)description {
    NSString *description;
    if (!self.isDly) {
        description = [NSString stringWithFormat:@"A %@ line train, route number %@, which is heading towards %@, will be arriving at stop %@ in %@", self.rt, self.rn, self.destNm, self.staNm, self.prdt];
    }
    else {
        description = [NSString stringWithFormat:@"A DELAYED %@ line train, route number %@, which is heading towards %@, will be arriving at stop %@ in %@ minutes", self.rt, self.rn, self.destNm, self.staNm, self.prdt];
    }
    return description;
}

@end
