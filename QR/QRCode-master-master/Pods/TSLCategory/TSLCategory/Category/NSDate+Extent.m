
//
//  NSDate+Extent.m
//  WXArchitecture
//
//  Created by ADMIN on 8/22/16.
//  Copyright © 2016 mc. All rights reserved.
//

#import "NSDate+Extent.h"

@implementation NSDate (Extent)


/**
 *  时间戳转时间字符串
 *
 *  @param interval      时间戳
 *  @param dateFormatter 时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)getTimeStrFromInterval:(NSString *)interval andFormatter:(NSString *)dateFormatter{
    
    if (nil == dateFormatter) {
        dateFormatter = @"YYYY-MM-dd";
    }
    
    NSTimeInterval timeInterval = (interval.length >= 12)?([interval doubleValue]/1000):([interval doubleValue]);
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormatter];
    NSString *timeStr = [formatter stringFromDate:timeDate];
    return timeStr;
}

/**
 *  时间戳转日期
 *
 *  @param interval      时间戳
 *  @param dateFormatter 时间格式
 *
 *  @return 日期NSDate
 */
+ (NSDate *)getTimeDateFromInterval:(NSString *)interval andFormatter:(NSString *)dateFormatter{
    
    NSTimeInterval timeInterval = (interval.length >= 12)?([interval doubleValue]/1000):([interval doubleValue]);
    
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    [fm setDateFormat:dateFormatter];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return date;
}

@end
