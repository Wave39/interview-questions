//
//  BPLinkedList.m
//  BPDataStructures
//
//  Created by Brian Prescott on 5/12/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import "BPLinkedList.h"

#import "BPLinkedListNode.h"

@implementation BPLinkedList

- (NSInteger)length
{
    if (_firstNode == nil)
    {
        return 0;
    }
    
    BPLinkedListNode *nodeToCheck = _firstNode;
    NSInteger counter = 1;
    while (nodeToCheck.nextNode != nil)
    {
        nodeToCheck = nodeToCheck.nextNode;
        counter++;
    }
    
    return counter;
}

- (BPLinkedListNode *)lastNode
{
    BPLinkedListNode *nodeToCheck = _firstNode;
    while (nodeToCheck.nextNode != nil)
    {
        nodeToCheck = nodeToCheck.nextNode;
    }
    
    return nodeToCheck;
}

- (void)add:(id)objectToAdd
{
    BPLinkedListNode *newNode = [[BPLinkedListNode alloc] init];
    newNode.nodeContents = objectToAdd;
    
    if (_firstNode == nil)
    {
        self.firstNode = newNode;
        return;
    }
    
    BPLinkedListNode *lastNode = [self lastNode];
    lastNode.nextNode = newNode;    
}

- (void)clear
{
    self.firstNode = nil;
}

- (id)objectAtIndex:(NSInteger)idx
{
    if (_firstNode == nil)
    {
        return nil;
    }
    
    BPLinkedListNode *node = _firstNode;
    NSInteger counter = 0;
    while (counter < idx)
    {
        node = node.nextNode;
        counter++;
    }
    
    return node.nodeContents;
}

- (void)removeObjectAtIndex:(NSInteger)idx
{
    if (idx == 0)
    {
        _firstNode = _firstNode.nextNode;
        return;
    }
    
    BPLinkedListNode *node = _firstNode;
    NSInteger counter = 0;
    while (counter < idx - 1)
    {
        node = node.nextNode;
        counter++;
    }
    
    node.nextNode = node.nextNode.nextNode;
}

// TODO: potential methods to add...
// add all nodes of another linked list
// insert at a specified index
// get first/last object
// get index of specified object
// remove object by contents

@end
