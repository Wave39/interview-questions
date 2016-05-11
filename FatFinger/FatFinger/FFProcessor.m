//
//  FFProcessor.m
//  FatFinger
//
//  Created by Brian Prescott on 5/10/16.
//  Copyright © 2016 Wave 39 LLC. All rights reserved.
//

#import "FFProcessor.h"

@interface FFProcessor ()

@property (nonatomic, strong) NSString *originalString;
@property (nonatomic, strong) NSMutableArray *wordArray;

@end

@implementation FFProcessor

- (NSArray *)validSubstitutions:(NSString *)originalCharacter
{
    if ([originalCharacter isEqualToString:@"g"])
    {
        return @ [ @"g", @"h", @"f" ];
    }
    else if ([originalCharacter isEqualToString:@"i"])
    {
        return @ [ @"i", @"o", @"k" ];
    }
    
    return nil;
}

- (BOOL)isValidWord:(NSString *)theWord
{
    return ([theWord isEqualToString:@"go"] || [theWord isEqualToString:@"hi"]);
}

- (NSArray *)validWords:(NSString *)originalString
{
    self.originalString = originalString;
    self.wordArray = [NSMutableArray array];
    
    [self processCharacter:0 stringSoFar:@""];
    
    NSMutableArray *validWords = [NSMutableArray array];
    for (NSString *w in _wordArray)
    {
        if ([self isValidWord:w])
        {
            [validWords addObject:w];
        }
    }
    
    return validWords;
}

- (void)processCharacter:(NSInteger)idx stringSoFar:(NSString *)stringSoFar
{
    if (idx >= [_originalString length])
    {
        NSLog(@"Finished word: %@", stringSoFar);
        [_wordArray addObject:stringSoFar];
        return;
    }
    
    NSString *theChar = [_originalString substringWithRange:NSMakeRange(idx, 1)];
    NSArray *alternatives = [self validSubstitutions:theChar];
    for (NSString *c in alternatives)
    {
        NSString *newString = [NSString stringWithFormat:@"%@%@", stringSoFar, c];
        [self processCharacter:(idx + 1) stringSoFar:newString];
    }
}

@end
