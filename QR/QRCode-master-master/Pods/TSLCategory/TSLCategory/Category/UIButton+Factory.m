//
//  UIButton+Factory.m
//  New5iWork
//
//  Created by Tang Shilei on 15/10/13.
//  Copyright (c) 2015年 5iWork. All rights reserved.
//

#import "UIButton+Factory.h"
#import <objc/runtime.h>

static char overviewKey;
@implementation UIButton (Factory)

//使用工厂模式来进行创建
+(UIButton*)createButtonWithFrame:(CGRect)frame imageName:(NSString*)imageName bgImageName:(NSString*)bgImageName title:(NSString*)title SEL:(SEL)sel target:(id)target{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (bgImageName) {
        [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        //并且设置字体颜色为黑色
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    //添加点击事件
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    //设置button的点击时候的高亮
    button.showsTouchWhenHighlighted=YES;
    return button;
}



+ (UIButton *)buttonWithType:(UIButtonType)type
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                   titleFont:(UIFont *)titleFont andCompletionBlcok:(ActionBlock)block{
    UIButton *btn=[UIButton buttonWithType:type];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = titleFont;
    if(backgroundColor){
        btn.backgroundColor = backgroundColor;
        
    }
    
    [btn handleControlEvent:UIControlEventTouchUpInside withMyBlock:block];
    
    return btn;
    
    
}

+(UIButton*)buttonWithType:(UIButtonType)type imageName:(NSString*)imageName selectImage:(NSString *)selectImageName
{
    UIButton *btn=[UIButton buttonWithType:type];
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (selectImageName) {
        [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    }
    
    return btn;
}

+ (UIButton *)buttonWithType:(UIButtonType)type
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                   titleFont:(UIFont *)titleFont 
{
    UIButton *btn=[UIButton buttonWithType:type];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateSelected];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = titleFont;
    if(backgroundColor){
       btn.backgroundColor = backgroundColor;
    
    }
    return btn;
}

//工厂方法创建button
+(UIButton*)buttonWithType:(UIButtonType)type andFrame:(CGRect)frame andTitle:(NSString *)title andBackgroundImage:(NSString *)imageName
{
    UIButton *btn=[UIButton buttonWithType:type];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    //[btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return btn;
}

//block 回调点击事件
+(UIButton*)buttonWithType:(UIButtonType)type andFrame:(CGRect)frame andTitle:(NSString *)title andBackgroundImage:(NSString *)imageName andHandleEvent:(UIControlEvents)event andCompletionBlcok:(ActionBlock)block
{
    UIButton *btn=[UIButton buttonWithType:type];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [btn handleControlEvent:event withMyBlock:block];
    return btn;
}


+(UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title image:(NSString*)imageName font:(CGFloat)fontSize background:(UIColor*)color completionBlock:(ActionBlock)block{
    UIButton *btn=[UIButton buttonWithType:type];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:fontSize];
    btn.backgroundColor =color;
    
    
//    //设置图片文字上下居中
//    CGRect titleBounds = btn.titleLabel.bounds;
//    CGRect imgBounds = btn.imageView.bounds;
//    
//    UIEdgeInsets imgInsets = UIEdgeInsetsZero;
//    UIEdgeInsets titleInsets = UIEdgeInsetsZero;
//    
//    imgInsets.bottom = btn.frame.size.height / 2 - 4;
//    imgInsets.right = - titleBounds.size.width;
//    
//    titleInsets.top = btn.frame.size.height / 2 - 4;
//    titleInsets.left = - imgBounds.size.width;
//    
//    [btn setImageEdgeInsets:imgInsets];
//    [btn setTitleEdgeInsets:titleInsets];
    
    
    [btn handleControlEvent:UIControlEventTouchUpInside withMyBlock:block];
    return btn;
    
    
}

+(UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title  handleControlEvent:(UIControlEvents)event completionBlock:(ActionBlock)block
{
    UIButton *btn=[UIButton buttonWithType:type];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn handleControlEvent:event withMyBlock:block];
    return btn;
}


//
+(UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title image:(NSString*)bgName  selectImage:(NSString*)selectName handleControlEvent:(UIControlEvents)event completionBlock:(ActionBlock)block{
    UIButton *btn=[UIButton buttonWithType:type];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    if(bgName){
        [btn setImage:[UIImage imageNamed:bgName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:bgName] forState:UIControlStateHighlighted];
    }
    if(selectName){
      [btn setImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];
    }
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)]; //图片和文字保持一定 距离
    [btn handleControlEvent:event withMyBlock:block];
    return btn;
}
//处理事件
- (void)handleControlEvent:(UIControlEvents)event withMyBlock:(ActionBlock)block
{
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionMyBlock:) forControlEvents:event];
}

-(void)callActionMyBlock:(id)sender
{
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}

@end
