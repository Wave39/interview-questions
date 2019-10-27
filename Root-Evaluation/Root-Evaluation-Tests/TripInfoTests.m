//
//  TripInfoTests.m
//  Root-Evaluation-Tests
//
//  Created by Brian Prescott on 10/27/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
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

- (void)testTripInfoParsing {
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

@end