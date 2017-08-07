//
//  UITextField+Factory.m
//  zhihuimendian
//
//  Created by Tang Shilei on 16/3/24.
//  Copyright © 2016年 赵越. All rights reserved.
//



#import "UITextField+Factory.h"

@implementation UITextField (Factory)

+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftView:(UIView*)left_View rightView:(UIView*)rgView  Font:(UIFont*)font textColor:(UIColor*)textColor placeHolderColor:(UIColor*)placeHolderColor placeHolderFont:(UIFont*)placeHolderFont{
    UITextField*textField=[[UITextField alloc] initWithFrame:frame];
    
    textField.placeholder=placeholder;
    //文字对齐方式
    textField.textAlignment=NSTextAlignmentLeft;
    textField.secureTextEntry=YESorNO;
    //边框
    textField.borderStyle=UITextBorderStyleNone;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
        //键盘类型
    //textField.keyboardType=UIKeyboardTypeEmailAddress;
    //关闭首字母大写
    textField.autocapitalizationType=NO;
    //清除按钮
//    textField.clearButtonMode=YES;
    //左图片
    textField.leftView=left_View;
    
    textField.leftViewMode = UITextFieldViewModeAlways;
    //右图片
    textField.rightView=rgView;
    //编辑状态下一直存在
    //textField.rightViewMode=UITextFieldViewModeWhileEditing;
    //自定义键盘
    //textField.inputView
    //字体
    textField.font=font;
    //字体颜色
    textField.textColor=textColor;
//    [textField setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
//    [textField setValue:placeHolderFont forKeyPath:@"_placeholderLabel.font"];
    
    textField.tintColor =textColor;
    
    if(placeHolderColor&&placeHolderFont&&placeholder){
      NSMutableParagraphStyle *style = [textField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
      style.minimumLineHeight = textField.font.lineHeight - (textField.font.lineHeight - placeHolderFont.lineHeight) / 2.0;
      textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder
                                                                            attributes:@{
                                                                                         NSForegroundColorAttributeName: placeHolderColor,
                                                                                         NSFontAttributeName : placeHolderFont,
                                                                                         NSParagraphStyleAttributeName : style
                                                                                         }
                                             ];
    }
    
    
    
    return textField;
}


#pragma  mark 适配器方法
+(UITextField*)createTextFieldWithFrame:(CGRect)frame
                            placeholder:(NSString*)placeholder
                               passWord:(BOOL)YESorNO
                          leftImageView:(UIImageView*)imageView
                         rightImageView:(UIImageView*)rightImageView
                                   Font:(float)font
                    backgRoundImageName:(NSString*)imageName{
    UITextField*text= [self createTextFieldWithFrame:frame
                                         placeholder:placeholder
                                            passWord:YESorNO
                                       leftImageView:imageView
                                      rightImageView:rightImageView
                                                Font:font
                                 backgRoundImageName:imageName];
    text.background=[UIImage imageNamed:imageName];
    
    return  text;
}

+ (UITextField *)createTextFieldWithTextFont:(CGFloat)fontSize
                                textFontName:(NSString *)fontName
                                   textColor:(UIColor *)textColor
                                  fieldStyle:(UITextBorderStyle)fieldStyle
                          fieldReturnKeyType:(UIReturnKeyType)returnKeyType
                          fieldTextAlignment:(NSInteger)alignment{
    UITextField *textField = [[UITextField alloc] init];
    textField.font = [UIFont fontWithName:fontName size:fontSize];
    
    textField.borderStyle = fieldStyle;
    textField.returnKeyType = returnKeyType;
    textField.textAlignment = alignment;
    
    return textField;
}


+ (UITextField *)textFieldBaseBorderStyle:(UITextBorderStyle)borderStyle andFont:(UIFont *)textFont andTextColor:(UIColor *)textColor andPlaceHolder:(NSString *)placeHolder andKeyborderStyle:(UIKeyboardType)keyBorderType andIsSecure:(BOOL)isSecure {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.font = textFont;
    textField.textColor = textColor;
    textField.borderStyle = borderStyle;
    textField.placeholder = placeHolder;
    textField.keyboardType = keyBorderType;
    textField.secureTextEntry = isSecure;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}


@end
