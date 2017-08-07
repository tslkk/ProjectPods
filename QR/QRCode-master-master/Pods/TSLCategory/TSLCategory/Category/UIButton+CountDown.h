//
//  UIButton+CountDown.h
//  MengJieSteward
//
//  Created by admin on 16/4/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

- (void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

@end
