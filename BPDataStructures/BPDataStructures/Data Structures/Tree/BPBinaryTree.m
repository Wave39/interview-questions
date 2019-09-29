//
//  BPBinaryTree.m
//  BPDataStructures
//
//  Created by Brian Prescott on 9/29/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import "BPBinaryTree.h"

@interface BPBinaryTree ()

@property (nonatomic, strong) BPBinaryTreeNode *theRootNode;

@end

@implementation BPBinaryTree

- (instancetype)initWithRootNode:(BPBinaryTreeNode *)root
{
    self = [super init];
    if (self)
    {
        self.rootNode = root;
    }
    
    return self;
}

- (BPBinaryTreeNode *)rootNode
{
    return _theRootNode;
}

- (void)setRootNode:(BPBinaryTreeNode *)node
{
    _theRootNode = node;
}

- (NSString *)dfsIterate
{
    NSMutableString *s = [NSMutableString string];
    
    [s appendString:[self dfsIterateAtNode:_theRootNode]];
    
    return s;
}

- (NSString *)dfsIterateAtNode:(BPBinaryTreeNode *)node
{
    NSMutableString *s = [NSMutableString string];
    
    [s appendString:node.nodeContents];

    if (node.leftNode != nil)
    {
        [s appendString:[self dfsIterateAtNode:node.leftNode]];
    }
        
    if (node.rightNode != nil)
    {
        [s appendString:[self dfsIterateAtNode:node.rightNode]];
    }
    
    return s;
}

- (NSString *)bfsIterate
{
    NSMutableString *s = [NSMutableString string];
    
    NSArray *currentNodes;
    NSMutableArray *nextNodes = [NSMutableArray arrayWithObject:_theRootNode];
    do {
        currentNodes = [NSArray arrayWithArray:nextNodes];
        nextNodes = [NSMutableArray array];
        for (BPBinaryTreeNode *node in currentNodes) {
            [s appendString:node.nodeContents];
            if (node.leftNode != nil)
            {
                [nextNodes addObject:node.leftNode];
            }
            
            if (node.rightNode != nil)
            {
                [nextNodes addObject:node.rightNode];
            }
        }
    } while ([nextNodes count] > 0);
    
    return s;
}

@end
