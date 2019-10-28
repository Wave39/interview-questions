//
//  DriverInfoTests.m
//  Root-Evaluation-Tests
//
//  Created by Brian Prescott on 10/27/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DriverInfo.h"

@interface DriverInfoTests : XCTestCase

@property (nonatomic, strong) DriverInfo *speedy, *soccerMom, *slowpoke, *sleepy;

@end

@implementation DriverInfoTests

- (void)setUp {
    self.speedy = [[DriverInfo alloc] initWithName:@"Speedy" minutes:1 miles:2];
    self.soccerMom = [[DriverInfo alloc] initWithName:@"Mom" minutes:10 miles:10];
    self.slowpoke = [[DriverInfo alloc] initWithName:@"Slowpoke" minutes:20 miles:1];
    self.sleepy = [[DriverInfo alloc] initWithName:@"Sleepy" minutes:0 miles:0];
}

- (void)tearDown {
}

- (void)testConsoleOutput
{
    XCTAssert([[self.speedy consoleOutput] isEqualToString:@"Speedy: 2 miles @ 120 mph"]);
    XCTAssert([[self.soccerMom consoleOutput] isEqualToString:@"Mom: 10 miles @ 60 mph"]);
    XCTAssert([[self.slowpoke consoleOutput] isEqualToString:@"Slowpoke: 1 mile @ 3 mph"]);
    XCTAssert([[self.sleepy consoleOutput] isEqualToString:@"Sleepy: 0 miles"]);
}

@end
