//
//  BPStack.h
//  BPDataStructures
//
//  Created by Brian Prescott on 9/23/19.
//  Copyright © 2019 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPStack : NSObject

- (void)push:(NSObject *)obj;
- (NSObject *)pop;
- (NSObject *)peek;
- (void)clear;
- (NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
