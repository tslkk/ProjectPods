//
//  UIViewController+WX.h
//  WXArchitecture
//
//  Created by tangshilei on 16/8/8.
//  Copyright (c) 2016年 WXArchitecture. All rights reserved.
//
//解耦，controller之间的跳转，参数传递

#import <UIKit/UIKit.h>

typedef void(^UIViewController_block_void) (void);
typedef void(^UIViewController_block_view) (UIView *view);
typedef void(^UIViewController_block_returnParameters)(id obj);
@interface UIViewController (WX)

@property (nonatomic, strong) id parameters; // 参数
@property (nonatomic,copy) UIViewController_block_returnParameters returnParamsBlock;

// 导航
- (void)pushVC:(NSString *)vcName;
- (void)pushVC:(NSString *)vcName object:(id)object;
- (void)popVC;
//带回调参数
- (void)pushVC:(NSString *)vcName object:(id)object completion:(UIViewController_block_returnParameters)completion;


// 模态 带导航控制器
- (void)modalVC:(NSString *)vcName withNavigationVC:(NSString *)navName;
- (void)modalVC:(NSString *)vcName withNavigationVC:(NSString *)navName object:(id)object succeed:(UIViewController_block_void)block;
- (void)dismissModalVC;
- (void)dismissModalVCWithSucceed:(UIViewController_block_void)block;

@end

@protocol WXSwitchControllerProtocol <NSObject>

-(id)initWithObject:(id)object;

@end
