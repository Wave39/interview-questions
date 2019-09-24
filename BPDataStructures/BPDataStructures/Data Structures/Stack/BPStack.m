//
//  BPStack.m
//  BPDataStructures
//
//  Created by Brian Prescott on 9/23/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import "BPStack.h"

@interface BPStack ()

@property (nonatomic, strong) NSMutableArray *stackArray;

@end

@implementation BPStack

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.stackArray = [NSMutableArray array];
    }
    
    return self;
}

- (void)push:(NSObject *)obj
{
    [_stackArray addObject:obj];
}

- (NSObject *)pop
{
    NSObject *retval = [_stackArray lastObject];
    [_stackArray removeLastObject];
    return retval;
}

- (NSObject *)peek
{
    return [_stackArray lastObject];
}

- (void)clear
{
    self.stackArray = [NSMutableArray array];
}

- (NSUInteger)count
{
    return [_stackArray count];
}
@end
