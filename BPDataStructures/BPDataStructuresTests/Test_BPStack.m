//
//  Test_BPStack.m
//  BPDataStructuresTests
//
//  Created by Brian Prescott on 9/23/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BPStack.h"

@interface Test_BPStack : XCTestCase

@property (nonatomic, strong) BPStack *stack;

@end

@implementation Test_BPStack

- (void)setUp {
    [super setUp];
    
    self.stack = [[BPStack alloc] init];
    
    [_stack push:@"1"];
    [_stack push:@"22"];
    [_stack push:@"333"];
}

- (void)tearDown {
}

- (void)testQueue_general {
    XCTAssert(_stack != nil);
    XCTAssert([_stack count] == 3);
}

- (void)testStack_push {
    [_stack push:@"4444"];
    XCTAssert([_stack count] == 4);
}

- (void)testStack_pop {
    NSObject *object = [_stack pop];
    XCTAssert([@"333" isEqualToString:(NSString *)object]);
    XCTAssert([_stack count] == 2);
}

- (void)testStack_peek {
    NSObject *object = [_stack peek];
    XCTAssert([@"333" isEqualToString:(NSString *)object]);
    XCTAssert([_stack count] == 3);
}

- (void)testStack_clear {
    [_stack clear];
    XCTAssert([_stack count] == 0);
}

@end
