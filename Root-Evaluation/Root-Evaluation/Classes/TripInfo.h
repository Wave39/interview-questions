//
//  TripInfo.h
//  Root-Evaluation
//
//  Created by Brian Prescott on 10/27/19.
//  Copyright © 2019 Brian Prescott. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TripInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger minutesDriven;
@property (nonatomic) CGFloat milesDriven;

- (instancetype)initWithName:(NSString *)driverName minutes:(NSInteger)minutes miles:(CGFloat)miles;
- (instancetype)initByParsingData:(NSString *)line;

@end

NS_ASSUME_NONNULL_END
