//
//  Test_BPTree.m
//  BPDataStructures
//
//  Created by Brian Prescott on 5/17/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BPTree.h"
#import "BPTreeNode.h"

@interface Test_BPTree : XCTestCase

@property (nonatomic, strong) BPTree *tree;

@end

@implementation Test_BPTree

- (void)setUp {
    [super setUp];

    self.tree = [[BPTree alloc] init];
    
    BPTreeNode *node2a = [[BPTreeNode alloc] initWithNodeContents:@"2a"];
    BPTreeNode *node2b = [[BPTreeNode alloc] initWithNodeContents:@"2b"];
    
    BPTreeNode *node1 = [[BPTreeNode alloc] initWithNodeContents:@"1" andBranches:@ [ node2a, node2b ]];
    [_tree setRootNode:node1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDummy {
    XCTAssert([_tree rootNode] != nil);
    XCTAssert([_tree.rootNode.nodeContents isEqualTo:@"1"]);
    XCTAssert(_tree.rootNode.branches.count == 2);
}

@end
