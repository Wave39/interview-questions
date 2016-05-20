//
//  BPTree.m
//  BPDataStructures
//
//  Created by Brian Prescott on 5/17/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import "BPTree.h"

#import "BPTreeNode.h"

@interface BPTree ()

@property (nonatomic, strong) BPTreeNode *theRootNode;

@end

@implementation BPTree

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.rootNode = nil;
    }
    
    return self;
}

- (BPTreeNode *)rootNode
{
    return _theRootNode;
}

- (void)setRootNode:(BPTreeNode *)node
{
    _theRootNode = node;
}

@end
