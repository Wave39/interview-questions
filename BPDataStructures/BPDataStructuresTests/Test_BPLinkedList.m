//
//  Test_BPLinkedList.m
//  BPDataStructures
//
//  Created by Brian Prescott on 5/12/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BPLinkedList.h"

@interface Test_BPLinkedList : XCTestCase

@property (nonatomic, strong) BPLinkedList *linkedList;

@end

@implementation Test_BPLinkedList

- (void)setUp {
    [super setUp];
    
    self.linkedList = [[BPLinkedList alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddClearAndLength {
    XCTAssert([_linkedList length] == 0);
    
    [_linkedList add:@"1"];
    XCTAssert([_linkedList length] == 1);
    
    [_linkedList add:@"22"];
    XCTAssert([_linkedList length] == 2);
    
    [_linkedList clear];
    XCTAssert([_linkedList length] == 0);
    
    [_linkedList add:@"333"];
    XCTAssert([_linkedList length] == 1);
}

- (void)testObjectAtIndex {
    [_linkedList add:@"1"];
    [_linkedList add:@"22"];
    [_linkedList add:@"333"];
    [_linkedList add:@"4444"];
    
    XCTAssert([[_linkedList objectAtIndex:0] isEqualToString:@"1"]);
    XCTAssert([[_linkedList objectAtIndex:1] isEqualToString:@"22"]);
    XCTAssert([[_linkedList objectAtIndex:2] isEqualToString:@"333"]);
    XCTAssert([[_linkedList objectAtIndex:3] isEqualToString:@"4444"]);
}

@end
