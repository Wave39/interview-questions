//
//  Test_BPLinkedList.m
//  BPDataStructures
//
//  Created by Brian Prescott on 5/12/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BPLinkedList.h"
#import "BPLinkedListNode.h"

@interface Test_BPLinkedList : XCTestCase

@property (nonatomic, strong) BPLinkedList *linkedList;

@end

@implementation Test_BPLinkedList

- (void)setUp {
    [super setUp];
    
    self.linkedList = [[BPLinkedList alloc] init];
    [_linkedList add:@"1"];
    [_linkedList add:@"22"];
    [_linkedList add:@"333"];
    [_linkedList add:@"4444"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddClearAndLength {
    [_linkedList clear];
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
    XCTAssert([[_linkedList objectAtIndex:0] isEqualTo:@"1"]);
    XCTAssert([[_linkedList objectAtIndex:1] isEqualTo:@"22"]);
    XCTAssert([[_linkedList objectAtIndex:2] isEqualTo:@"333"]);
    XCTAssert([[_linkedList objectAtIndex:3] isEqualTo:@"4444"]);
}

- (void)testRemoveObjectAtIndex {
    [_linkedList add:@"55555"];
    
    [_linkedList removeObjectAtIndex:2];
    XCTAssert([[_linkedList objectAtIndex:3] isEqualTo:@"55555"]);
    
    [_linkedList removeObjectAtIndex:0];
    XCTAssert([[_linkedList objectAtIndex:0] isEqualTo:@"22"]);

    [_linkedList removeObjectAtIndex:2];
    XCTAssert([_linkedList length] == 2);
}

- (void)testAddObjectsFromLinkedList {
    [_linkedList addObjectsFromLinkedList:nil];
    XCTAssert([_linkedList length] == 4);
    
    BPLinkedList *newList = [BPLinkedList new];
    [_linkedList addObjectsFromLinkedList:newList];
    XCTAssert([_linkedList length] == 4);
    
    [newList add:@"1"];
    [newList add:@"22"];
    [_linkedList addObjectsFromLinkedList:newList];
    XCTAssert([_linkedList length] == 6);
}

- (void)testFirstAndLastObject {
    XCTAssert([[_linkedList firstObject] isEqualTo:@"1"]);
    XCTAssert([[_linkedList lastObject] isEqualTo:@"4444"]);

}

- (void)testInsertObjectAtIndex {
    [_linkedList insertObject:@"0" atIndex:0];
    XCTAssert([_linkedList length] == 5);
    
    [_linkedList insertObject:@"1.5" atIndex:2];
    XCTAssert([_linkedList length] == 6);
}

- (void)testIndexOfObject {
    XCTAssert([_linkedList indexOfObject:@"1"] == 0);
    XCTAssert([_linkedList indexOfObject:@"4444"] == 3);
    XCTAssert([_linkedList indexOfObject:@"foo"] == NSNotFound);
}

- (void)testRemoveObject {
    [_linkedList removeObject:@"333"];
    XCTAssert([_linkedList length] == 3);
    
    [_linkedList removeObject:@"foo"];
    XCTAssert([_linkedList length] == 3);
}

@end
