//
//  UILabel+Factory.m
//  ctoffice
//
//  Created by TangShiLei on 13-9-25.
//  Copyright (c) 2013年 xugang. All rights reserved.
//

#import "UILabel+Factory.h"


@implementation UILabel (Factory)

@dynamic stFontSize;

- (void)setStFontSize:(NSNumber *)stFontSize{
    self.font = [UIFont fontWithName:@"STHeitiSC-Light" size:[stFontSize floatValue]];
}
+(UILabel*)labelWithFrame:(CGRect)frame withText:(NSString *)text withFont:(UIFont *)font withTextColor:(UIColor *)color withBackgroundColor:(UIColor *)bgColor{
    
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.font=font;
    label.textColor=color;
    label.backgroundColor=bgColor;
    return label;
}

+ (UILabel*)labelWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font  textColor:(UIColor*)color{
    
    UILabel *label=[[UILabel alloc] init];
    label.frame = frame;
    label.text = title;
    if(font){
        label.font = font;
    }
    if(color){
        label.textColor =color;
        
    }
    return label;

    
}
+(UILabel*)labelWithText:(NSString *)text fontWithName:(NSString *)fontName withFont:(CGFloat)font withTextColor:(UIColor *)color textAlignment:(NSInteger)alignment{
    
    UILabel *label=[[UILabel alloc]init];
    label.text=text;
    label.textAlignment = alignment;
    if (!fontName) {
        label.font = [UIFont systemFontOfSize:font];
    }else {
        label.font = [UIFont fontWithName:fontName size:font];
    }
    label.textColor=color;
    return label;
}
#pragma -mark UILabel
+ (UILabel*)labelWithFrame:(CGRect)frame title:(NSString*)title font:(UIFont*)font  background:(UIColor*)color{
    UILabel *label=[[UILabel alloc] init];
    label.frame = frame;
    label.text = title;
    if(font){
      label.font = font;
    }

    label.backgroundColor =[UIColor clearColor];
    return label;
}
+ (UILabel*)labelWithFrame:(CGRect)frame title:(NSString*)title fontSize:(CGFloat)size background:(UIColor*)color;{
    UILabel *label=[[UILabel alloc] init];
    label.frame = frame;
    label.text = title;
    label.font = [UIFont systemFontOfSize:size];
    label.backgroundColor = color;
    
    return label;
}

+(UILabel*)labelWithFrame:(CGRect)frame title:(NSString *)title fontSize:(CGFloat)size background:(UIColor *)color lineBreakMode:(NSLineBreakMode)lineBreakMode{
    UILabel *label=[[UILabel alloc] init];
    label.frame = frame;
    label.text = title;
    label.font=[UIFont systemFontOfSize:size];
    label.lineBreakMode=lineBreakMode;
    label.backgroundColor = color;
    label.numberOfLines=0;
    
    return label;
}

+(UILabel*)label{
    return [[UILabel alloc] init];
}

- (UILabel* (^)(CGRect frame))labelFrame{
    return ^UILabel * (CGRect frame){
        
        self.frame=frame;
       
        return self;
    };
}
- (UILabel* (^)(NSString* title))labelTitle{
    return ^UILabel * (NSString* title){
        self.text=title;
        return self;
    };
}
- (UILabel*(^)(UIFont *font))labelFont{
    return ^UILabel * (UIFont* font){
        self.font =font;
        return self;
    };
}
- (UILabel* (^)(UIColor *color))titleColor{
    
    return ^UILabel * (UIColor* color){
        self.textColor =color;
        return self;
    };
}


@end
