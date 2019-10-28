//
//  DriverHistory.m
//  Root-Evaluation
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
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

- (void)addTripInfo:(TripInfo *)tripInfo
{
    DriverInfo *driver = self.driverDictionary[tripInfo.name];
    if (driver != nil)
    {
        driver.minutesDriven += tripInfo.minutesDriven;
        driver.milesDriven += tripInfo.milesDriven;
    }
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
                        [driverHistory addTripInfo:tripInfo];
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

- (NSArray *)arraySortedByMilesDriven
{
    return [[self.driverDictionary allValues] sortedArrayUsingComparator:^NSComparisonResult(DriverInfo *a, DriverInfo *b) {
        return a.milesDriven < b.milesDriven;
    }];
}

- (void)outputSortedList
{
    NSArray *driverArray = [self arraySortedByMilesDriven];
    for (DriverInfo *driver in driverArray) {
        NSLog(@"%@", [driver consoleOutput]);
    }
}

@end
