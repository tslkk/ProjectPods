//
//  UIControl+Click.h
//  zhihuimendian
//
//  Created by Tang Shilei on 16/3/27.
//  Copyright © 2016年 赵越. All rights reserved.
//

//控制UIButton的时间间隔
#import <UIKit/UIKit.h>

@interface UIControl (Click)

@property (nonatomic, assign) NSTimeInterval ts_acceptEventInterval;   // 可以用这个给重复点击加间隔

@property(nonatomic,assign)double eventTime;


@end
