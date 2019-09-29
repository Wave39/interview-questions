//
//  BPBinaryTreeNode.m
//  BPDataStructures
//
//  Created by Brian Prescott on 9/29/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import "BPBinaryTreeNode.h"

@implementation BPBinaryTreeNode

- (instancetype)initWithNodeContents:(id)contents
{
    return [self initWithNodeContents:contents leftNode:nil rightNode:nil];
}

- (instancetype)initWithNodeContents:(id)contents leftNode:(BPBinaryTreeNode *)left
{
    return [self initWithNodeContents:contents leftNode:left rightNode:nil];
}

- (instancetype)initWithNodeContents:(id)contents rightNode:(BPBinaryTreeNode *)right
{
    return [self initWithNodeContents:contents leftNode:nil rightNode:right];
}

- (instancetype)initWithNodeContents:(id)contents leftNode:(BPBinaryTreeNode *)left rightNode: (BPBinaryTreeNode *)right
{
    self = [super init];
    if (self)
    {
        self.nodeContents = contents;
        self.leftNode = left;
        self.rightNode = right;
    }
    
    return self;
}

@end
