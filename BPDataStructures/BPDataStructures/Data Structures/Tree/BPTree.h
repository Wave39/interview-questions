//
//  BPTree.h
//  BPDataStructures
//
//  Created by Brian Prescott on 5/17/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BPTreeNode;

@interface BPTree : NSObject

- (BPTreeNode *)rootNode;
- (void)setRootNode:(BPTreeNode *)node;

@end
