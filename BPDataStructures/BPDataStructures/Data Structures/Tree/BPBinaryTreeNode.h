//
//  BPBinaryTreeNode.h
//  BPDataStructures
//
//  Created by Brian Prescott on 9/29/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPBinaryTreeNode : NSObject

@property (nonatomic, copy) id nodeContents;
@property (nonatomic, weak) BPBinaryTreeNode *leftNode;
@property (nonatomic, weak) BPBinaryTreeNode *rightNode;

- (instancetype)initWithNodeContents:(id)contents;
- (instancetype)initWithNodeContents:(id)contents leftNode:(BPBinaryTreeNode *)left;
- (instancetype)initWithNodeContents:(id)contents rightNode:(BPBinaryTreeNode *)right;
- (instancetype)initWithNodeContents:(id)contents leftNode:(BPBinaryTreeNode *)left rightNode: (BPBinaryTreeNode *)right;

@end
