//
//  Test_BPQueue.m
//  BPDataStructuresTests
//
//  Created by Brian Prescott on 9/23/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BPQueue.h"

@interface Test_BPQueue : XCTestCase

@property (nonatomic, strong) BPQueue *queue;

@end

@implementation Test_BPQueue

- (void)setUp {
    [super setUp];
    
    self.queue = [[BPQueue alloc] init];
    
    [_queue enqueue:@"1"];
    [_queue enqueue:@"22"];
    [_queue enqueue:@"333"];
}

- (void)tearDown {
}

- (void)testQueue_general {
    XCTAssert(_queue != nil);
    XCTAssert([_queue count] == 3);
}

- (void)testQueue_enqueue {
    [_queue enqueue:@"4444"];
    XCTAssert([_queue count] == 4);
}

- (void)testQueue_dequeue {
    NSObject *object = [_queue dequeue];
    XCTAssert([@"1" isEqualToString:(NSString *)object]);
    XCTAssert([_queue count] == 2);
}

- (void)testQueue_peek {
    NSObject *object = [_queue peek];
    XCTAssert([@"1" isEqualToString:(NSString *)object]);
    XCTAssert([_queue count] == 3);
}

- (void)testQueue_clear {
    [_queue clear];
    XCTAssert([_queue count] == 0);
}

@end
