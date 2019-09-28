//
//  main.m
//  MergesortObjectiveC
//
//  Created by Brian Prescott on 9/28/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Mergesort.h"

void PerformSort(NSArray *numbers)
{
    NSLog(@"Input: %@", numbers);
    NSLog(@"Sort results: %@", [Mergesort mergesort:numbers]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PerformSort(@[ @1, @3, @2, @6 ]);
        PerformSort(@[ @5, @1, @3, @2, @6 ]);
        PerformSort(@[ @7 ]);
        PerformSort(@[ ]);
        PerformSort(@[ @6, @5, @3, @1, @8, @7, @2, @4 ]);
        PerformSort(@[ @6, @5, @9, @3, @1, @8, @7, @2, @4 ]);
    }
    
    NSLog(@"Strike the Enter key to finish...");
    [[NSFileHandle fileHandleWithStandardInput] availableData];
    
    return 0;
}
