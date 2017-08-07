//
//  UITextField+Factory.h
//  zhihuimendian
//
//  Created by Tang Shilei on 16/3/24.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Factory)

#pragma mark --创建UITextField
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftView:(UIView*)left_View rightView:(UIView*)rgView  Font:(UIFont*)font textColor:(UIColor*)textColor placeHolderColor:(UIColor*)placeHolderColor placeHolderFont:(UIFont*)placeHolderFont;

//适配器的方法  扩展性方法
//现有方法，已经在工程里面存在，如果修改工程内所有方法，工作量巨大，就需要使用适配器的方法
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName;

/**
 *  常规文字输入框（无图片，无背景）
 *
 *  @param fontSize      字体大小
 *  @param fontName      文字字体
 *  @param textColor     文字颜色
 *  @param fieldStyle
 *  @param returnKeyType
 *  @param alignment     字体对齐方式
 *
 *  @return 常规输入框
 */
+ (UITextField *)createTextFieldWithTextFont:(CGFloat)fontSize
                                textFontName:(NSString *)fontName
                                   textColor:(UIColor *)textColor
                                  fieldStyle:(UITextBorderStyle)fieldStyle
                          fieldReturnKeyType:(UIReturnKeyType)returnKeyType
                          fieldTextAlignment:(NSInteger)alignment;


+ (UITextField *)textFieldBaseBorderStyle:(UITextBorderStyle)borderStyle andFont:(UIFont *)textFont andTextColor:(UIColor *)textColor andPlaceHolder:(NSString *)placeHolder andKeyborderStyle:(UIKeyboardType)keyBorderType andIsSecure:(BOOL)isSecure;

@end
