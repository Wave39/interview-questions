//
//  Mergesort.m
//  MergesortObjectiveC
//
//  Created by Brian Prescott on 9/28/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import "Mergesort.h"

@implementation Mergesort

+ (NSArray *)mergesort:(NSArray *)numbersToSort
{
    if ([numbersToSort count] < 2)
    {
        return numbersToSort;
    }
    
    NSUInteger ctr = [numbersToSort count];
    NSUInteger idx = ctr / 2;
    NSArray *arrayLeft = [numbersToSort subarrayWithRange:NSMakeRange(0, idx)];
    NSArray *arrayRight = [numbersToSort subarrayWithRange:NSMakeRange(idx, ctr - idx)];
    arrayLeft = [Mergesort mergesort:arrayLeft];
    arrayRight = [Mergesort mergesort:arrayRight];
    
    return [Mergesort mergeArrays:arrayLeft with:arrayRight];
}

+ (NSArray *)mergeArrays:(NSArray *)leftArray with:(NSArray *)rightArray
{
    NSMutableArray *results = [NSMutableArray array];
    NSMutableArray *left = [NSMutableArray arrayWithArray:leftArray];
    NSMutableArray *right = [NSMutableArray arrayWithArray:rightArray];
    while ([left count] > 0 || [right count] > 0) {
        if ([left count] == 0)
        {
            [results addObject:[right firstObject]];
            [right removeObjectAtIndex:0];
        }
        else if ([right count] == 0)
        {
            [results addObject:[left firstObject]];
            [left removeObjectAtIndex:0];
        }
        else
        {
            if ([[left firstObject] intValue] < [[right firstObject] intValue])
            {
                [results addObject:[left firstObject]];
                [left removeObjectAtIndex:0];
            }
            else
            {
                [results addObject:[right firstObject]];
                [right removeObjectAtIndex:0];
            }
        }
    }
    
    return results;
}

@end
