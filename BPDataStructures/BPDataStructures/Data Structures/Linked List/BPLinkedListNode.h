//
//  BPLinkedListNode.h
//  BPDataStructures
//
//  Created by Brian Prescott on 5/12/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPLinkedListNode : NSObject

@property (nonatomic, copy) id nodeContents;
@property (nonatomic, strong) BPLinkedListNode *nextNode;

@end
