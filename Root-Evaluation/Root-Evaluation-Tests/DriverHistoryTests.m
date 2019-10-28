//
//  DriverHistoryTests.m
//  Root-Evaluation-Tests
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DriverHistory.h"
#import "DriverInfo.h"
#import "TripInfo.h"

@interface DriverHistoryTests : XCTestCase

@property (nonatomic, strong) DriverHistory *driverHistory;

@end

@implementation DriverHistoryTests

- (void)setUp {
    self.driverHistory = [[DriverHistory alloc] init];
    self.driverHistory.driverDictionary[@"Speedy"] = [[DriverInfo alloc] initWithName:@"Speedy" minutes:1 miles:2];
    self.driverHistory.driverDictionary[@"Slowpoke"] = [[DriverInfo alloc] initWithName:@"Slowpoke" minutes:60 miles:2];
}

- (void)tearDown {
}

- (void)testGeneral
{
    XCTAssert([self.driverHistory.driverDictionary count] == 2);
    NSArray<DriverInfo *> *sortedArray = [self.driverHistory arraySortedByMilesDriven];
    XCTAssert([sortedArray[0].name isEqualToString:@"Slowpoke"]);
}

- (void)testAddTripInfo
{
    TripInfo *newTrip = [[TripInfo alloc] initWithName:@"Slowpoke" minutes:5 miles:1];
    [self.driverHistory addTripInfo:newTrip];
    DriverInfo *slowpoke = self.driverHistory.driverDictionary[@"Slowpoke"];
    XCTAssert(slowpoke.minutesDriven == 65);
    XCTAssert(roundf(slowpoke.milesDriven) == 3);
}

@end
