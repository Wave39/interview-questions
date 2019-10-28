//
//  TripInfo.h
//  Root-Evaluation
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TripInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger minutesDriven;
@property (nonatomic) CGFloat milesDriven;

- (instancetype)initWithName:(NSString *)driverName minutes:(NSInteger)minutes miles:(CGFloat)miles;
- (instancetype)initByParsingData:(NSString *)line;
+ (BOOL)validTime:(NSString * _Nullable)timeString;
+ (NSInteger)timeToMinutes:(NSString *)timeString;

@end

NS_ASSUME_NONNULL_END
