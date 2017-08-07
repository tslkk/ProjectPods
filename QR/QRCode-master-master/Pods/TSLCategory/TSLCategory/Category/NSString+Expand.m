//
//  NSString+Expand.m
//  DHCommonSource
//
//  Created by ADMIN on 7/8/16.
//  Copyright © 2016 ADMIN. All rights reserved.
//

#import "NSString+Expand.h"

@implementation NSString (Expand)

- (NSString *)expandStringSafe {
    return (nil == self || [self isKindOfClass:[NSNull class]])?@"":self;
}

- (NSString *)expandStringNoSpace {
    if (!self) {
        return @"";
    }
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)expandStringTrimSpace {
    
    if (!self) {
        return @"";
    }
    return [self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


#pragma mark -- 判断字符中是否存在表情
- (BOOL)stringContainsEmoji
{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}


#pragma mark -- 判断是否为整形
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


#pragma mark --  判断是否为float
- (BOOL)isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}


#pragma mark -- 判断是否包含非法字符
- (BOOL)isNotLegal
{
    NSString *nicknameRegex = @".*[-`=\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?]+.*";
    NSPredicate *nicknamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nicknameRegex];
    return [nicknamePredicate evaluateWithObject:self];
}


@end
