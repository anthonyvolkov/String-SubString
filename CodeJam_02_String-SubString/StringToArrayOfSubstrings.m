//
//  StringToArrayOfSubStrings.m
//  CodeJam_02_String-SubString
//
//  Created by anthony volkov on 4/22/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import "StringToArrayOfSubstrings.h"

@implementation StringToArrayOfSubstrings

+ (NSMutableArray *)arrayOfSubstringsInBrackets:(NSString *) string {
    
    ////union all arrays of substrings
    NSMutableArray *arrayOfAllSubstrings = [[@[] mutableCopy] autorelease];
    [arrayOfAllSubstrings addObjectsFromArray:arrayWithSubstringsInRoundBrackets(string)];
    [arrayOfAllSubstrings addObjectsFromArray:arrayWithSubstringsInAngleBrackets(string)];
    [arrayOfAllSubstrings addObjectsFromArray:arrayWithSubstringsInSquareBrackets(string)];
    
    
//    NSLog(@"%@", arrayOfAllSubstrings);   // comment this
    
    return arrayOfAllSubstrings;
}


#pragma mark - getting substrings in round brackets
BlockType arrayWithSubstringsInRoundBrackets = ^NSMutableArray *(NSString *string) {
    
    ////create dictionary with all round brackets and his indexs in string
    NSMutableDictionary *roundBrackets = [@{}.mutableCopy autorelease];
    
    for (int q = 0; q < [string length]; q++) {
        if ([string characterAtIndex:q] == '(' || [string characterAtIndex:q] == ')') {
            [roundBrackets setObject:[NSString stringWithFormat:@"%C",[string characterAtIndex:q]]
                              forKey:[NSNumber numberWithInt:q]];
        }
    }
    
    //    NSLog(@"%@", roundBrackets);   // comment this
    
    NSArray *allKeysOfRoundBrackets = [roundBrackets allKeys];
    NSMutableArray *sortedAllKeysOfRoundBrackets = [[[allKeysOfRoundBrackets sortedArrayUsingSelector:@selector(compare:)] mutableCopy] autorelease];
    
    //    NSLog(@"%@", sortedAllKeysOfRoundBrackets);   // comment this
    
    NSMutableArray *sortedAllObjectsOfRoundBracketsByKeys = [[@[] mutableCopy] autorelease];
    
    for (int q = 0; q < [roundBrackets count]; q++) {
        [sortedAllObjectsOfRoundBracketsByKeys addObject:[roundBrackets objectForKey:[sortedAllKeysOfRoundBrackets objectAtIndex:q]]];
    }
    
    //    NSLog(@"%@", sortedAllObjectsOfRoundBracketsByKeys);   // comment this
    
    
    
    ////checking inner brackets and put to dictionary by pairs
    NSMutableDictionary *rangesOfRoundBracketsForOutputSubstrings = [@{}.mutableCopy autorelease];
    
    while ([sortedAllObjectsOfRoundBracketsByKeys count] != 0) {
        for (int q = 0; q < [sortedAllObjectsOfRoundBracketsByKeys count]; q++) {
            if ([[sortedAllObjectsOfRoundBracketsByKeys objectAtIndex:q] isEqualToString:@"("]
                && [[sortedAllObjectsOfRoundBracketsByKeys objectAtIndex:q + 1] isEqualToString:@")"]) {
                
                [rangesOfRoundBracketsForOutputSubstrings setObject:[sortedAllKeysOfRoundBrackets objectAtIndex:q + 1]
                                                             forKey:[sortedAllKeysOfRoundBrackets objectAtIndex:q]];
                
                [sortedAllObjectsOfRoundBracketsByKeys removeObjectAtIndex:q + 1];
                [sortedAllObjectsOfRoundBracketsByKeys removeObjectAtIndex:q];
                
                [sortedAllKeysOfRoundBrackets removeObjectAtIndex:q + 1];
                [sortedAllKeysOfRoundBrackets removeObjectAtIndex:q];
                
                break;
            }
        }
    }
    
    //    NSLog(@"%@", rangesOfRoundBracketsForOutputSubstrings);   // comment this
    
    
    
    ////create array for output substrings in angle brackets and initialized it
    NSArray *allKeysRangesOfRoundBracketsForOutputSubstrings = [rangesOfRoundBracketsForOutputSubstrings allKeys];
    
    NSMutableArray *arrayWithSubstringsInRoundBrackets = [[@[] mutableCopy] autorelease];
    
    for (int q = 0; q < [allKeysRangesOfRoundBracketsForOutputSubstrings count]; q++) {
        NSString *str = [string substringWithRange:NSMakeRange([[allKeysRangesOfRoundBracketsForOutputSubstrings objectAtIndex:q] integerValue] + 1,
                                                               [[rangesOfRoundBracketsForOutputSubstrings objectForKey:[allKeysRangesOfRoundBracketsForOutputSubstrings objectAtIndex:q]] integerValue] - [[allKeysRangesOfRoundBracketsForOutputSubstrings objectAtIndex:q] integerValue] - 1) ];
        [arrayWithSubstringsInRoundBrackets addObject:str];
    }
    
    //    NSLog(@"%@", arrayWithSubstringsInRoundBrackets);   // comment this

    
    return arrayWithSubstringsInRoundBrackets;
};



#pragma mark - getting substrings in angle brackets
BlockType arrayWithSubstringsInAngleBrackets = ^NSMutableArray *(NSString *string) {
    
    ////create dictionary with all angle brackets and his indexs in string
    NSMutableDictionary *angleBrackets = [@{}.mutableCopy autorelease];
    
    for (int q = 0; q < [string length]; q++) {
        if ([string characterAtIndex:q] == '<' || [string characterAtIndex:q] == '>') {
            [angleBrackets setObject:[NSString stringWithFormat:@"%C",[string characterAtIndex:q]]
                              forKey:[NSNumber numberWithInt:q]];
        }
    }
    
    //    NSLog(@"%@", angleBrackets);   // comment this
    
    NSArray *allKeysOfAngleBrackets = [angleBrackets allKeys];
    NSMutableArray *sortedAllKeysOfAngleBrackets = [[[allKeysOfAngleBrackets sortedArrayUsingSelector:@selector(compare:)] mutableCopy] autorelease];
    
    //    NSLog(@"%@", sortedAllKeysOfAngleBrackets);   // comment this
    
    NSMutableArray *sortedAllObjectsOfAngleBracketsByKeys = [[@[] mutableCopy] autorelease];
    
    for (int q = 0; q < [angleBrackets count]; q++) {
        [sortedAllObjectsOfAngleBracketsByKeys addObject:[angleBrackets objectForKey:[sortedAllKeysOfAngleBrackets objectAtIndex:q]]];
    }
    
    //    NSLog(@"%@", sortedAllObjectsOfAngleBracketsByKeys);   // comment this
    
    
    
    ////checking inner brackets and put to dictionary by pairs
    NSMutableDictionary *rangesOfAngleBracketsForOutputSubstrings = [@{}.mutableCopy autorelease];
    
    while ([sortedAllObjectsOfAngleBracketsByKeys count] != 0) {
        for (int q = 0; q < [sortedAllObjectsOfAngleBracketsByKeys count]; q++) {
            if ([[sortedAllObjectsOfAngleBracketsByKeys objectAtIndex:q] isEqualToString:@"<"]
                && [[sortedAllObjectsOfAngleBracketsByKeys objectAtIndex:q + 1] isEqualToString:@">"]) {
                
                [rangesOfAngleBracketsForOutputSubstrings setObject:[sortedAllKeysOfAngleBrackets objectAtIndex:q + 1]
                                                             forKey:[sortedAllKeysOfAngleBrackets objectAtIndex:q]];
                
                [sortedAllObjectsOfAngleBracketsByKeys removeObjectAtIndex:q + 1];
                [sortedAllObjectsOfAngleBracketsByKeys removeObjectAtIndex:q];
                
                [sortedAllKeysOfAngleBrackets removeObjectAtIndex:q + 1];
                [sortedAllKeysOfAngleBrackets removeObjectAtIndex:q];
                
                break;
            }
        }
    }
    
    //    NSLog(@"%@", rangesOfAngleBracketsForOutputSubstrings);   // comment this
    
    
    
    ////create array for output substrings in angle brackets and initialized it
    NSArray *allKeysRangesOfAngleBracketsForOutputSubstrings = [rangesOfAngleBracketsForOutputSubstrings allKeys];
    
    NSMutableArray *arrayWithSubstringsInAngleBrackets = [[@[] mutableCopy] autorelease];
    
    for (int q = 0; q < [allKeysRangesOfAngleBracketsForOutputSubstrings count]; q++) {
        NSString *str = [string substringWithRange:NSMakeRange([[allKeysRangesOfAngleBracketsForOutputSubstrings objectAtIndex:q] integerValue] + 1,
                                                               [[rangesOfAngleBracketsForOutputSubstrings objectForKey:[allKeysRangesOfAngleBracketsForOutputSubstrings objectAtIndex:q]] integerValue] - [[allKeysRangesOfAngleBracketsForOutputSubstrings objectAtIndex:q] integerValue] - 1) ];
        [arrayWithSubstringsInAngleBrackets addObject:str];
    }
    
    //    NSLog(@"%@", arrayWithSubstringsInAngleBrackets);   // comment this

    
    return arrayWithSubstringsInAngleBrackets;
};



#pragma mark - getting substrings in square brackets
BlockType arrayWithSubstringsInSquareBrackets = ^NSMutableArray *(NSString *string) {
    
    ////create dictionary with all square brackets and his indexs in string
    NSMutableDictionary *squareBrackets = [@{}.mutableCopy autorelease];
    
    for (int q = 0; q < [string length]; q++) {
        if ([string characterAtIndex:q] == '[' || [string characterAtIndex:q] == ']') {
            [squareBrackets setObject:[NSString stringWithFormat:@"%C",[string characterAtIndex:q]]
                               forKey:[NSNumber numberWithInt:q]];
        }
    }
    
    //    NSLog(@"%@", squareBrackets);   // comment this
    
    NSArray *allKeysOfSquareBrackets = [squareBrackets allKeys];
    NSMutableArray *sortedAllKeysOfSquareBrackets = [[[allKeysOfSquareBrackets sortedArrayUsingSelector:@selector(compare:)] mutableCopy] autorelease];
    
    //    NSLog(@"sorted all keys - %@", sortedAllKeysOfSquareBrackets);   // comment this
    
    NSMutableArray *sortedAllObjectsOfSquareBracketsByKeys = [[@[] mutableCopy] autorelease];
    
    for (int q = 0; q < [squareBrackets count]; q++) {
        [sortedAllObjectsOfSquareBracketsByKeys addObject:[squareBrackets objectForKey:[sortedAllKeysOfSquareBrackets objectAtIndex:q]]];
    }
    
    //     NSLog(@"%@", sortedAllObjectsOfSquareBracketsByKeys);   // comment this
    
    
    
    ////checking inner brackets and put to dictionary by pairs
    NSMutableDictionary *rangesOfSquareBracketsForOutputSubstrings = [@{}.mutableCopy autorelease];
    
    while ([sortedAllObjectsOfSquareBracketsByKeys count] != 0) {
        for (int q = 0; q < [sortedAllObjectsOfSquareBracketsByKeys count]; q++) {
            if ([[sortedAllObjectsOfSquareBracketsByKeys objectAtIndex:q] isEqualToString:@"["]
                && [[sortedAllObjectsOfSquareBracketsByKeys objectAtIndex:q + 1] isEqualToString:@"]"]) {
                
                [rangesOfSquareBracketsForOutputSubstrings setObject:[sortedAllKeysOfSquareBrackets objectAtIndex:q + 1]
                                                              forKey:[sortedAllKeysOfSquareBrackets objectAtIndex:q]];
                
                [sortedAllObjectsOfSquareBracketsByKeys removeObjectAtIndex:q + 1];
                [sortedAllObjectsOfSquareBracketsByKeys removeObjectAtIndex:q];
                
                [sortedAllKeysOfSquareBrackets removeObjectAtIndex:q + 1];
                [sortedAllKeysOfSquareBrackets removeObjectAtIndex:q];
                
                break;
            }
        }
    }
    
    //    NSLog(@"%@", rangesOfSquareBracketsForOutputSubstrings);   // comment this
    
    
    
    ////create array for output substrings in angle brackets and initialized it
    NSArray *allKeysRangesOfSquareBracketsForOutputSubstrings = [rangesOfSquareBracketsForOutputSubstrings allKeys];
    
    NSMutableArray *arrayWithSubstringsInSquareBrackets = [[@[] mutableCopy] autorelease];
    
    for (int q = 0; q < [allKeysRangesOfSquareBracketsForOutputSubstrings count]; q++) {
        NSString *str = [string substringWithRange:NSMakeRange([[allKeysRangesOfSquareBracketsForOutputSubstrings objectAtIndex:q] integerValue] + 1,
                                                               [[rangesOfSquareBracketsForOutputSubstrings objectForKey:[allKeysRangesOfSquareBracketsForOutputSubstrings objectAtIndex:q]] integerValue] - [[allKeysRangesOfSquareBracketsForOutputSubstrings objectAtIndex:q] integerValue] - 1) ];
        [arrayWithSubstringsInSquareBrackets addObject:str];
    }
    
    //    NSLog(@"%@", arrayWithSubstringsInSquareBrackets);   // comment this
    
    
    return arrayWithSubstringsInSquareBrackets;
};



@end
