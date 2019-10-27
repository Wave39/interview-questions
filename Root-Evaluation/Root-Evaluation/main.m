//
//  main.m
//  Root-Evaluation
//
//  Created by Brian Prescott on 10/27/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DriverHistory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSLog(@"Current directory: %@", [[NSFileManager defaultManager] currentDirectoryPath]);
     
        if (argc != 2)
        {
            NSLog(@"No file name specified");
            return 1;
        }
        
        NSString *filename = [NSString stringWithUTF8String:argv[1]];
        
        DriverHistory *driverHistory = [DriverHistory parseFromFile:filename];
        if (driverHistory == nil)
        {
            return 2;
        }
        
        [driverHistory outputSortedList];
    }
    return 0;
}
