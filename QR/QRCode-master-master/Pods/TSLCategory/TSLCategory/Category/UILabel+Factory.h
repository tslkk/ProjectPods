//
//  UILabel+Factory.h
//  ctoffice
//
//  Created by TangShiLei on 13-9-25.
//  Copyright (c) 2013年 xugang. All rights reserved.
//

#import <UIKit/UIKit.h>


//UILabel 工厂方法
@interface UILabel (Factory)

@property (nonatomic,retain) NSNumber *stFontSize;

//字体
+ (UILabel*)labelWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font  background:(UIColor*)color;

/**
 *  可修改字体Label
 *
 *  @param text     内容
 *  @param fontName 字体名称
 *  @param font     字体大小
 *  @param color    文字颜色
 *
 *  @return Label
 */



+ (UILabel*)labelWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font  textColor:(UIColor*)color;


+(UILabel*)labelWithText:(NSString *)text fontWithName:(NSString *)fontName withFont:(CGFloat)font withTextColor:(UIColor *)color textAlignment:(NSInteger)alignment;

+(UILabel*)labelWithFrame:(CGRect)frame withText:(NSString*)text withFont:(UIFont*)font withTextColor:(UIColor*)color withBackgroundColor:(UIColor*)bgColor;

+(UILabel*)labelWithFrame:(CGRect)frame title:(NSString*)title fontSize:(CGFloat)size background:(UIColor*)color;

+(UILabel*)labelWithFrame:(CGRect)frame title:(NSString*)title fontSize:(CGFloat)size background:(UIColor*)color lineBreakMode:(NSLineBreakMode)lineBreakMode;

//链式
+ (UILabel*)label;
- (UILabel* (^)(CGRect frame))labelFrame;
- (UILabel* (^)(NSString* title))labelTitle;
- (UILabel*(^)(UIFont *font))labelFont;
- (UILabel* (^)(UIColor *color))titleColor;

@end
