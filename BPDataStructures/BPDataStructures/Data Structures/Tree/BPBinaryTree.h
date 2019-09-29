//
//  BPBinaryTree.h
//  BPDataStructures
//
//  Created by Brian Prescott on 9/29/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import "BPBinaryTreeNode.h"

@interface BPBinaryTree : NSObject

- (instancetype)initWithRootNode:(BPBinaryTreeNode *)root;
- (BPBinaryTreeNode *)rootNode;
- (void)setRootNode:(BPBinaryTreeNode *)node;
- (NSString *)dfsIterate;
- (NSString *)bfsIterate;

@end
