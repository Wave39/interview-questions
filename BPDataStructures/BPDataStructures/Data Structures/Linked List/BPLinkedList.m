//
//  BPLinkedList.m
//  BPDataStructures
//
//  Created by Brian Prescott on 5/12/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import "BPLinkedList.h"

#import "BPLinkedListNode.h"

@interface BPLinkedList ()

@property (nonatomic, strong) BPLinkedListNode *firstNode;

@end

@implementation BPLinkedList

- (NSString *)description
{
    NSMutableString *descriptionString = [NSMutableString string];
    
    BPLinkedListNode *node = self.firstNode;
    do
    {
        [descriptionString appendFormat:@"%@", node.nodeContents];
        if (node.nextNode != nil)
        {
            [descriptionString appendString:@" -> "];
        }
        
        node = node.nextNode;
    } while (node != nil);
    
    return descriptionString;
}

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

- (void)addObjectsFromLinkedList:(BPLinkedList *)linkedList
{
    BPLinkedListNode *node = linkedList.firstNode;
    while (node != nil)
    {
        [self add:node.nodeContents];
        node = node.nextNode;
    }
}

- (id)firstObject
{
    return _firstNode.nodeContents;
}

- (id)lastObject
{
    BPLinkedListNode *node = self.firstNode;
    while (node.nextNode != nil)
    {
        node = node.nextNode;
    }
    
    return node.nodeContents;
}

- (void)insertObject:(id)object atIndex:(NSInteger)idx
{
    BPLinkedListNode *newNode = [BPLinkedListNode new];
    newNode.nodeContents = object;
    
    if (idx == 0)
    {
        newNode.nextNode = self.firstNode;
        self.firstNode = newNode;
        return;
    }
    
    BPLinkedListNode *node = self.firstNode;
    NSInteger counter = 0;
    while (counter < (idx - 1))
    {
        node = node.nextNode;
        counter++;
    }
    
    newNode.nextNode = node.nextNode;
    node.nextNode = newNode;
}

- (NSInteger)indexOfObject:(id)object
{
    BPLinkedListNode *node = self.firstNode;
    NSInteger counter = 0;
    while (node != nil)
    {
        if ([node.nodeContents isEqualTo:object])
        {
            return counter;
        }
        
        counter++;
        node = node.nextNode;
    }
    
    return NSNotFound;
}

- (BOOL)removeObject:(id)object
{
    NSInteger idx = [self indexOfObject:object];
    if (idx == NSNotFound)
    {
        return NO;
    }
    
    [self removeObjectAtIndex:idx];
    return YES;
}

@end
