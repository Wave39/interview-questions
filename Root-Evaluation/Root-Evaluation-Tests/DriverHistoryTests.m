//
//  DriverHistoryTests.m
//  Root-Evaluation-Tests
//
//  Created by Brian Prescott on 10/27/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DriverHistory.h"
#import "DriverInfo.h"

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

- (void)testGeneral {
    XCTAssert([self.driverHistory.driverDictionary count] == 2);
    NSArray<DriverInfo *> *sortedArray = [self.driverHistory arraySortedByMilesDriven];
    XCTAssert([sortedArray[0].name isEqualToString:@"Slowpoke"]);
}

@end
