//
//  BPQueue.h
//  BPDataStructures
//
//  Created by Brian Prescott on 9/23/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPQueue : NSObject

- (void)enqueue:(NSObject *)obj;
- (NSObject *)dequeue;
- (NSUInteger)count;
- (NSObject *)peek;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
