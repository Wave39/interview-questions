//
//  BPTreeNode.h
//  BPDataStructures
//
//  Created by Brian Prescott on 5/17/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPTreeNode : NSObject

@property (nonatomic, copy) id nodeContents;
@property (nonatomic, strong) NSMutableArray *branches;

- (instancetype)initWithNodeContents:(id)contents;
- (instancetype)initWithNodeContents:(id)contents andBranches:(NSArray <BPTreeNode *> *)branches;

@end
