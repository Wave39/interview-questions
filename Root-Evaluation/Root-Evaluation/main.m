//
//  main.m
//  Root-Evaluation
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
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
            NSLog(@"Driver history was empty");
            return 2;
        }
        
        [driverHistory outputSortedList];
    }
    return 0;
}
