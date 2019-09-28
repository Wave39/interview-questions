//
//  Quicksort.m
//  QuicksortObjectiveC
//
//  Created by Brian Prescott on 9/28/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import "Quicksort.h"

@implementation Quicksort

+ (NSArray *)quicksort:(NSArray *)numbersToSort
{
    if ([numbersToSort count] < 2)
    {
        return numbersToSort;
    }
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:numbersToSort];
    NSInteger pivot = [[arr lastObject] intValue];
    [arr removeLastObject];
    
    NSMutableArray *lessThan = [NSMutableArray array];
    NSMutableArray *greaterThan = [NSMutableArray array];
    for (NSNumber *n in arr)
    {
        if ([n intValue] < pivot)
        {
            [lessThan addObject:n];
        }
        else
        {
            [greaterThan addObject:n];
        }
    }
    
    NSArray *sortedLessThan = [Quicksort quicksort:lessThan];
    NSArray *sortedGreaterThan = [Quicksort quicksort:greaterThan];
    NSMutableArray *results = [NSMutableArray arrayWithArray:sortedLessThan];
    [results addObject:@(pivot)];
    [results addObjectsFromArray:sortedGreaterThan];
    
    return results;
}

@end
