//
//  BPTreeNode.m
//  BPDataStructures
//
//  Created by Brian Prescott on 5/17/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import "BPTreeNode.h"

@implementation BPTreeNode

- (instancetype)initWithNodeContents:(id)contents
{
    return [self initWithNodeContents:contents andBranches:nil];
}

- (instancetype)initWithNodeContents:(id)contents andBranches:(NSArray <BPTreeNode *> *)branches
{
    self = [super init];
    if (self)
    {
        self.nodeContents = contents;
        if (branches != nil)
        {
            self.branches = [NSMutableArray arrayWithArray:branches];
        }
    }
    
    return self;
}

@end
