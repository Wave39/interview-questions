//
//  BPLinkedList.h
//  BPDataStructures
//
//  Created by Brian Prescott on 5/12/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BPLinkedListNode;

@interface BPLinkedList : NSObject

@property (nonatomic, strong) BPLinkedListNode *firstNode;

- (NSInteger)length;
- (void)add:(id)objectToAdd;
- (void)clear;
- (id)objectAtIndex:(NSInteger)idx;
- (void)removeObjectAtIndex:(NSInteger)idx;

@end
