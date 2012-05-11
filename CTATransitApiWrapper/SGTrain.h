//
//  SGTrain.h
//  CTATransitApiWrapper
//
//  Created by Jacob Van Order on 5/10/12.
//  Copyright (c) 2012 sushiGrass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGTrain : NSObject

@property (nonatomic, strong) NSNumber *staID; //Numeric GTFS parent station ID which this prediction is for (five digits in 4xxxx range) (matches “mapid” specified by requestor in query)
@property (nonatomic, strong) NSString *staNm; // Textual proper name of parent station
@property (nonatomic, strong) NSString *stpDe; //Textual description of platform for which this prediction applies
@property (nonatomic, strong) NSNumber *rn; //Run number of train being predicted for
@property (nonatomic, strong) NSString *rt; //Textual, abbreviated route name of train being predicted for (matches GTFS routes)
@property (nonatomic, strong) NSNumber *destSt; //GTFS unique stop ID where this train is expected to ultimately end its service run (experimental and supplemental only—see note below)
@property (nonatomic, strong) NSString *destNm; //Friendly destination description
@property (nonatomic, strong) NSNumber *trDr; //Numeric train route direction code
@property (nonatomic, strong) NSDate *prdt; //Date-time format stamp for when the prediction was generated:yyyyMMdd HH:mm:ss (24-hour format, time local to Chicago)
@property (nonatomic, strong) NSDate *arrT; //Date-time format stamp for when a train is expected to arrive/depart:yyyyMMdd HH:mm:ss (24-hour format, time local to Chicago)
@property (nonatomic) BOOL isApp; //Indicates that Train Tracker is now declaring “Approaching” or “Due” on site for this train
@property (nonatomic) BOOL isSch; //Boolean flag to indicate whether this is a live prediction or based on schedule in lieu of live data
@property (nonatomic) BOOL isFlt; //Boolean flag to indicate whether a potential fault has been detected
@property (nonatomic) BOOL isDly; //Boolean flag to indicate whether a train is considered “delayed” in Train Tracker

@end
