//
//  DriverInfo.m
//  Root-Evaluation
//
//  Created by Brian Prescott on 10/27/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import "DriverInfo.h"

@implementation DriverInfo

- (instancetype)initWithName:(NSString *)driverName
{
    self = [super init];
    self.name = driverName;
    return self;
}

- (instancetype)initWithName:(NSString *)driverName minutes:(NSInteger)minutes miles:(CGFloat)miles
{
    self = [self initWithName:driverName];
    self.minutesDriven = minutes;
    self.milesDriven = miles;
    return self;
}

- (NSString *)consoleOutput
{
    NSInteger miles = roundf(self.milesDriven);
    if (self.milesDriven == 0)
    {
        return [NSString stringWithFormat:@"%@: 0 miles", self.name];
    }
    else
    {
        NSInteger milesPerHour = roundf(self.milesDriven / (self.minutesDriven / 60.0));
        return [NSString stringWithFormat:@"%@: %@ mile%@ @ %@ mph", self.name, @(miles), (miles == 1 ? @"": @"s"), @(milesPerHour)];
    }
}

@end
