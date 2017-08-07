//
//  UIButton+Factory.h
//  New5iWork
//
//  Created by Tang Shilei on 15/10/13.
//  Copyright (c) 2015年 5iWork. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)();

@interface UIButton (Factory)

#pragma mark ---UIButton 类方法
+(UIButton*)buttonWithType:(UIButtonType)type andFrame:(CGRect)frame andTitle:(NSString *)title andBackgroundImage:(NSString *)imageName;

//UIButton 点击事件 block回调
+(UIButton*)buttonWithType:(UIButtonType)type andFrame:(CGRect)frame andTitle:(NSString *)title andBackgroundImage:(NSString *)imageName andHandleEvent:(UIControlEvents)event andCompletionBlcok:(ActionBlock)block;


//图片处理方法
+(UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title image:(NSString*)bgName  selectImage:(NSString*)selectName handleControlEvent:(UIControlEvents)event completionBlock:(ActionBlock)block;
/**
 *  box
 *
 *  @param type
 *  @param imageName
 *  @param selectImageName
 *
 *  @return
 */
+(UIButton*)buttonWithType:(UIButtonType)type imageName:(NSString*)imageName selectImage:(NSString *)selectImageName;

/**
 *  纯色按钮
 *
 *  @param type            类型
 *  @param title           标题
 *  @param titleColor      标题颜色
 *  @param backgroundColor 背景
 *  @param titleFont       标题字体
 *
 *  @return 返回纯色带标题按钮
 */


+ (UIButton *)buttonWithType:(UIButtonType)type
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                   titleFont:(UIFont *)titleFont andCompletionBlcok:(ActionBlock)block;

+ (UIButton *)buttonWithType:(UIButtonType)type
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                   titleFont:(UIFont *)titleFont;

//创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame imageName:(NSString*)imageName bgImageName:(NSString*)bgImageName title:(NSString*)title SEL:(SEL)sel target:(id)target;

+(UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title  handleControlEvent:(UIControlEvents)event completionBlock:(ActionBlock)block;


/**
 *  文字图片上下 居中
 *
 *  @param type      <#type description#>
 *  @param frame     <#frame description#>
 *  @param title     <#title description#>
 *  @param imageName <#imageName description#>
 *  @param fontSize  <#fontSize description#>
 *  @param color     <#color description#>
 *  @param block     <#block description#>
 *
 *  @return <#return value description#>
 */
+(UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title image:(NSString*)imageName font:(CGFloat)fontSize background:(UIColor*)color completionBlock:(ActionBlock)block;

@end
