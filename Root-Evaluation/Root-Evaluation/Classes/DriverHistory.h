//
//  DriverHistory.h
//  Root-Evaluation
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TripInfo;

@interface DriverHistory : NSObject

@property (nonatomic, strong) NSMutableDictionary *driverDictionary;

- (void)addTripInfo:(TripInfo *)tripInfo;
+ (DriverHistory *)parseFromFile:(NSString *)filename;
- (NSArray *)arraySortedByMilesDriven;
- (void)outputSortedList;

@end

NS_ASSUME_NONNULL_END
