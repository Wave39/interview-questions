//
//  Test_BPBinaryTree.m
//  BPDataStructuresTests
//
//  Created by Brian Prescott on 9/29/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BPBinaryTree.h"
#import "BPBinaryTreeNode.h"
#import "BPTreeNode.h"

@interface Test_BPBinaryTree : XCTestCase

@property (nonatomic, strong) BPBinaryTree *binaryTree;
@property (nonatomic, strong) BPBinaryTreeNode *nodeA, *nodeB, *nodeC, *nodeD, *nodeE, *nodeF, *nodeG, *nodeH, *nodeI;

@end

@implementation Test_BPBinaryTree

- (void)setUp {
    //   a
    //   /\
    //  b  c
    //  /\  \
    // d  e  f
    //    /\
    //   g  h
    //  /
    //  i
    _nodeI = [[BPBinaryTreeNode alloc] initWithNodeContents:@"i"];
    _nodeH = [[BPBinaryTreeNode alloc] initWithNodeContents:@"h"];
    _nodeG = [[BPBinaryTreeNode alloc] initWithNodeContents:@"g" leftNode:_nodeI];
    _nodeF = [[BPBinaryTreeNode alloc] initWithNodeContents:@"f"];
    _nodeE = [[BPBinaryTreeNode alloc] initWithNodeContents:@"e" leftNode:_nodeG rightNode:_nodeH];
    _nodeD = [[BPBinaryTreeNode alloc] initWithNodeContents:@"d"];
    _nodeC = [[BPBinaryTreeNode alloc] initWithNodeContents:@"c" rightNode:_nodeF];
    _nodeB = [[BPBinaryTreeNode alloc] initWithNodeContents:@"b" leftNode:_nodeD rightNode:_nodeE];
    _nodeA = [[BPBinaryTreeNode alloc] initWithNodeContents:@"a" leftNode:_nodeB rightNode:_nodeC];
    _binaryTree = [[BPBinaryTree alloc] initWithRootNode:_nodeA];
}

- (void)tearDown {
}

- (void)testBinaryTree {
    XCTAssert(_binaryTree.rootNode != nil);
    XCTAssert([_binaryTree.rootNode.nodeContents isEqualTo:@"a"]);
    XCTAssert([_binaryTree.rootNode.leftNode.nodeContents isEqualTo:@"b"]);
}

- (void)testBinaryTree_dfsIterate {
    NSString *s = [_binaryTree dfsIterate];
    XCTAssert([s isEqualToString:@"abdegihcf"]);
}

- (void)testBinaryTree_bfsIterate {
    NSString *s = [_binaryTree bfsIterate];
    XCTAssert([s isEqualToString:@"abcdefghi"]);
}

@end
