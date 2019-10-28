//
//  TripInfoTests.m
//  Root-Evaluation-Tests
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "TripInfo.h"

@interface TripInfoTests : XCTestCase

@end

@implementation TripInfoTests

- (void)setUp {
}

- (void)tearDown {
}

- (void)testTripInfoParsing
{
    TripInfo *tripInfo = [[TripInfo alloc] initByParsingData:@"Trip Dan 07:15 07:45 17.3"];
    XCTAssert([tripInfo.name isEqualToString:@"Dan"]);
    XCTAssert(roundf(tripInfo.milesDriven * 10) == 173); // multiply by 10 and take integer to eliminate floating point error
    XCTAssert(tripInfo.minutesDriven == 30);
    
    // greater than 100 mph
    tripInfo = [[TripInfo alloc] initByParsingData:@"Trip Dan 07:15 07:16 2.0"];
    XCTAssertNil(tripInfo);
    
    // just under 100 mph
    tripInfo = [[TripInfo alloc] initByParsingData:@"Trip Dan 07:15 08:15 99.9"];
    XCTAssertNotNil(tripInfo);
    
    // less than 5 mph
    tripInfo = [[TripInfo alloc] initByParsingData:@"Trip Dan 07:15 08:15 4.9"];
    XCTAssertNil(tripInfo);
    
    // just above 5 mph
    tripInfo = [[TripInfo alloc] initByParsingData:@"Trip Dan 07:15 08:15 5.1"];
    XCTAssertNotNil(tripInfo);
}

- (void)testValidTime
{
    // trues
    XCTAssertTrue([TripInfo validTime:@"00:00"]);
    XCTAssertTrue([TripInfo validTime:@"07:00"]);
    XCTAssertTrue([TripInfo validTime:@"19:00"]);
    XCTAssertTrue([TripInfo validTime:@"23:59"]);

    // falses
    XCTAssertFalse([TripInfo validTime:nil]);
    XCTAssertFalse([TripInfo validTime:@""]);
    XCTAssertFalse([TripInfo validTime:@"0700"]);
    XCTAssertFalse([TripInfo validTime:@"07 00"]);
    XCTAssertFalse([TripInfo validTime:@"24:00"]);
    XCTAssertFalse([TripInfo validTime:@"204:00"]);
    XCTAssertFalse([TripInfo validTime:@"20:0A"]);
}

- (void)testTimeToMinutes
{
    XCTAssert([TripInfo timeToMinutes:@"00:00"] == 0);
    XCTAssert([TripInfo timeToMinutes:@"00:01"] == 1);
    XCTAssert([TripInfo timeToMinutes:@"07:00"] == 420);
    XCTAssert([TripInfo timeToMinutes:@"07:01"] == 421);
}

@end
