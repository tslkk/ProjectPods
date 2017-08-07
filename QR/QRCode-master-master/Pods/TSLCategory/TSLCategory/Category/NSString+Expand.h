//
//  NSString+Expand.h
//  DHCommonSource
//
//  Created by ADMIN on 7/8/16.
//  Copyright © 2016 ADMIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Expand)

/** 字符串安全 判断字符串是否为空 */
- (NSString *)expandStringSafe;

/** 字符串无空格 通常用于url去除空格 */
- (NSString *)expandStringNoSpace;

/** 去除字符串首尾空格 */
- (NSString *)expandStringTrimSpace;

- (BOOL)stringContainsEmoji;
- (BOOL)isPureInt;
- (BOOL)isPureFloat;
- (BOOL)isNotLegal;

@end
