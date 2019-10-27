//
//  DriverHistory.m
//  Root-Evaluation
//
//  Created by Brian Prescott on 10/27/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import "DriverHistory.h"

#import "DriverInfo.h"
#import "TripInfo.h"

@implementation DriverHistory

- (instancetype)init
{
    self = [super init];
    self.driverDictionary = [NSMutableDictionary dictionary];
    return self;
}

+ (DriverHistory *)parseFromFile:(NSString *)filename
{
    DriverHistory *driverHistory = [[DriverHistory alloc] init];
    
    NSError *error;
    NSString *fileString = [NSString stringWithContentsOfFile:[filename stringByExpandingTildeInPath] encoding:NSUTF8StringEncoding error:&error];

    if (error)
    {
        NSLog(@"Error: %@", error.localizedDescription);
        return nil;
    }
    
    NSArray *lineArray = [fileString componentsSeparatedByString:@"\n"];
    NSInteger lineNumber = 0;
    for (NSString *line in lineArray) {
        lineNumber++;
        NSString *trimmedLine = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimmedLine length] > 0)
        {
            NSArray *fieldArray = [trimmedLine componentsSeparatedByString:@" "];
            NSInteger fieldCount = [fieldArray count];
            if (fieldCount != 2 && fieldCount != 5)
            {
                NSLog(@"Invalid line at line number %@: %@", @(lineNumber), line);
            }
            else
            {
                NSString *command = fieldArray[0];
                NSString *driverName = fieldArray[1];
                if ([command isEqualToString:@"Driver"])
                {
                    if (driverHistory.driverDictionary[driverName] == nil)
                    {
                        driverHistory.driverDictionary[driverName] = [[DriverInfo alloc] initWithName:driverName];
                    }
                }
                else if ([command isEqualToString:@"Trip"])
                {
                    TripInfo *tripInfo = [[TripInfo alloc] initByParsingData:line];
                    if (tripInfo != nil)
                    {
                        DriverInfo *driver = driverHistory.driverDictionary[driverName];
                        if (driver == nil)
                        {
                            NSLog(@"A driver was used in a Trip command before they had a Driver command at line number %@: %@", @(lineNumber), line);
                        }
                        else
                        {
                            driver.minutesDriven += tripInfo.minutesDriven;
                            driver.milesDriven += tripInfo.milesDriven;
                        }
                    }
                }
                else
                {
                    NSLog(@"Invalid command at line number %@: %@", @(lineNumber), line);
                }
            }
        }

    }
    
    return driverHistory;
}

- (void)outputSortedList
{
    NSArray *driverArray = [[self.driverDictionary allValues] sortedArrayUsingComparator:^NSComparisonResult(DriverInfo *a, DriverInfo *b) {
        return a.milesDriven < b.milesDriven;
    }];
    
    for (DriverInfo *driver in driverArray) {
        NSLog(@"%@", [driver consoleOutput]);
    }
}

@end
