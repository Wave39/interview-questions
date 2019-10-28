//
//  TripInfo.m
//  Root-Evaluation
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
//

#import "TripInfo.h"

@implementation TripInfo

- (instancetype)initWithName:(NSString *)driverName minutes:(NSInteger)minutes miles:(CGFloat)miles
{
    self = [super init];
    self.name = driverName;
    self.minutesDriven = minutes;
    self.milesDriven = miles;
    return self;
}

+ (BOOL)validTime:(NSString * _Nullable)timeString
{
    if (timeString == nil)
    {
        return false;
    }
    
    NSString *timePattern = @"^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:timePattern options:0 error:nil];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:timeString options:0 range:NSMakeRange(0, [timeString length])];
    return (numberOfMatches == 1);
}

+ (NSInteger)timeToMinutes:(NSString *)timeString
{
    return [[timeString substringToIndex:2] integerValue] * 60 + [[timeString substringFromIndex:3] integerValue];
}

+ (NSInteger)drivingTime:(NSString *)startTime end:(NSString *)endTime
{
    NSInteger startTimeMinutes = [TripInfo timeToMinutes:startTime];
    NSInteger endTimeMinutes = [TripInfo timeToMinutes:endTime];
    return endTimeMinutes - startTimeMinutes;
}

- (instancetype)initByParsingData:(NSString *)line
{
    self = [super init];
    
    NSArray *fieldArray = [line componentsSeparatedByString:@" "];
    if ([fieldArray count] != 5 || ![fieldArray[0] isEqualToString:@"Trip"])
    {
        NSLog(@"Invalid line passed to TripInfo: %@", line);
        return nil;
    }
    
    self.name = fieldArray[1];
    
    NSString *startTime = fieldArray[2];
    if (![TripInfo validTime:startTime]) {
        NSLog(@"Invalid start time: %@", line);
        return nil;
    }
    
    NSString *endTime = fieldArray[3];
    if (![TripInfo validTime:endTime]) {
        NSLog(@"Invalid end time: %@", line);
        return nil;
    }
    
    self.minutesDriven = [TripInfo drivingTime:startTime end:endTime];
    
    self.milesDriven = [fieldArray[4] floatValue];
    
    CGFloat milesPerHour = self.milesDriven / (self.minutesDriven / 60.0);
    if (milesPerHour < 5.0 || milesPerHour > 100.0)
    {
        NSLog(@"Trip is too slow or too fast: %@", line);
        return nil;
    }
    
    return self;
}

@end
