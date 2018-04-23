//
//  StringToArrayOfSubStrings.h
//  CodeJam_02_String-SubString
//
//  Created by anthony volkov on 4/22/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringToArrayOfSubstrings : NSObject

typedef NSMutableArray *(^BlockType)(NSString *);

+ (NSMutableArray *)arrayOfSubstringsInBrackets:(NSString *) string;

@end
