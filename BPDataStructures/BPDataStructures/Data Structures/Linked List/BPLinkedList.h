//
//  BPLinkedList.h
//  BPDataStructures
//
//  Created by Brian Prescott on 5/12/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPLinkedList : NSObject

- (NSInteger)length;
- (void)add:(id)objectToAdd;
- (void)clear;
- (id)objectAtIndex:(NSInteger)idx;
- (void)removeObjectAtIndex:(NSInteger)idx;
- (void)addObjectsFromLinkedList:(BPLinkedList *)linkedList;
- (id)firstObject;
- (id)lastObject;
- (void)insertObject:(id)object atIndex:(NSInteger)idx;
- (NSInteger)indexOfObject:(id)object;
- (BOOL)removeObject:(id)object;

@end
