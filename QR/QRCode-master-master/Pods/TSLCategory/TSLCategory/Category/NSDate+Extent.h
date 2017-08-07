//
//  NSDate+Extent.h
//  WXArchitecture
//
//  Created by ADMIN on 8/22/16.
//  Copyright © 2016 mc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extent)


/**
 *  时间戳转时间字符串
 *
 *  @param interval      时间戳
 *  @param dateFormatter 时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)getTimeStrFromInterval:(NSString *)interval andFormatter:(NSString *)dateFormatter;


/**
 *  时间戳转日期
 *
 *  @param interval      时间戳
 *  @param dateFormatter 时间格式
 *
 *  @return 日期NSDate
 */
+ (NSDate *)getTimeDateFromInterval:(NSString *)interval andFormatter:(NSString *)dateFormatter;
@end
