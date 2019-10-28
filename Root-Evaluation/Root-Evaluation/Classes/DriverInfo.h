//
//  DriverInfo.h
//  Root-Evaluation
//
//  Created by Mr. Frank Zappa on 10/27/19.
//  Copyright © 2019 Mr. Frank Zappa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DriverInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger minutesDriven;
@property (nonatomic) CGFloat milesDriven;

- (instancetype)initWithName:(NSString *)driverName;
- (instancetype)initWithName:(NSString *)driverName minutes:(NSInteger)minutes miles:(CGFloat)miles;
- (NSString *)consoleOutput;

@end

NS_ASSUME_NONNULL_END
