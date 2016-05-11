//
//  main.m
//  FatFinger
//
//  Created by Brian Prescott on 5/10/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FFProcessor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FFProcessor *ffProcessor = [[FFProcessor alloc] init];
        NSArray *arr = [ffProcessor validWords:@"gi"];
        NSLog(@"Valid words: %@", arr);
    }

    NSLog(@"Strike the Enter key to finish...");
    [[NSFileHandle fileHandleWithStandardInput] availableData];

    return 0;
}
