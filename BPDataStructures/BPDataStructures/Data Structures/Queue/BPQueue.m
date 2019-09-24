//
//  BPQueue.m
//  BPDataStructures
//
//  Created by Brian Prescott on 9/23/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import "BPQueue.h"

@interface BPQueue ()

@property (nonatomic, strong) NSMutableArray *queueArray;

@end

@implementation BPQueue

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.queueArray = [NSMutableArray array];
    }
    
    return self;
}

- (void)enqueue:(NSObject *)obj
{
    [_queueArray addObject:obj];
}

- (NSObject *)dequeue
{
    NSObject *retval = [_queueArray firstObject];
    [_queueArray removeObjectAtIndex:0];
    return retval;
}

- (NSObject *)peek
{
    return [_queueArray firstObject];
}

- (void)clear
{
    self.queueArray = [NSMutableArray array];
}

- (NSUInteger)count
{
    return [_queueArray count];
}

@end
