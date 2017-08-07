//
//  UIViewController+WX.h
//  WXArchitecture
//
//  Created by tangshilei on 16/8/8.
//  Copyright (c) 2016年 WXArchitecture. All rights reserved.
//

#import "UIViewController+WX.h"
#import <objc/runtime.h>

#undef	UIViewController_key_parameters
#define UIViewController_key_parameters	"UIViewController.parameters"
#define  UIViewController_block_parameters "UIViewController.blockParameters"

@implementation UIViewController (WX)

-(id)parameters{
    id object =objc_getAssociatedObject(self, UIViewController_key_parameters);
     return object;
}

- (void)setParameters:(id)anObject{
    [self willChangeValueForKey:@"parameters"];
    objc_setAssociatedObject(self, UIViewController_key_parameters, anObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"parameters"];
}

- (UIViewController_block_returnParameters)returnParamsBlock{
    UIViewController_block_returnParameters block =objc_getAssociatedObject(self,UIViewController_block_parameters);
    return block;
}
- (void)setReturnParamsBlock:(UIViewController_block_returnParameters)returnParamsBlock{
    objc_setAssociatedObject(self, UIViewController_block_parameters, returnParamsBlock, OBJC_ASSOCIATION_COPY);
}

- (void)pushVC:(NSString *)vcName{
    [self pushVC:vcName object:nil];
}
- (void)pushVC:(NSString *)vcName object:(id)object{
    Class class = NSClassFromString(vcName);
    NSAssert(class != nil, @"Class 必须存在");
    UIViewController *vc = nil;
    
    if ([class conformsToProtocol:@protocol(WXSwitchControllerProtocol)]){
        vc = [[NSClassFromString(vcName) alloc] initWithObject:object];
    }
    else{
        vc = [[NSClassFromString(vcName) alloc] init];
        vc.parameters = object;
    }
   
    vc.hidesBottomBarWhenPushed=YES;
   [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushVC:(NSString *)vcName object:(id)object completion:(UIViewController_block_returnParameters)completion{
    Class class = NSClassFromString(vcName);
    NSAssert(class != nil, @"Class 必须存在");
    UIViewController *vc = nil;
    
    if ([class conformsToProtocol:@protocol(WXSwitchControllerProtocol)]){
        vc = [[NSClassFromString(vcName) alloc] initWithObject:object];
    }
    else{
        vc = [[NSClassFromString(vcName) alloc] init];
        vc.parameters = object;
    }
    
    vc.returnParamsBlock =completion;
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)modalVC:(NSString *)vcName withNavigationVC:(NSString *)navName{
    [self modalVC:vcName withNavigationVC:navName object:nil succeed:nil];
}

- (void)modalVC:(NSString *)vcName withNavigationVC:(NSString *)nvcName object:(id)object succeed:(UIViewController_block_void)block{
    Class class = NSClassFromString(vcName);
    NSAssert(class != nil, @"Class 必须存在");
    
    UIViewController *vc = nil;
    
    if ([class conformsToProtocol:@protocol(WXSwitchControllerProtocol)]){
        vc = [[NSClassFromString(vcName) alloc] initWithObject:object];
    }
    else{
        vc = [[NSClassFromString(vcName) alloc] init];
        vc.parameters = object;
    }
    
    UINavigationController *nvc = nil;
    if (nvcName){
        nvc = [[NSClassFromString(nvcName) alloc] initWithRootViewController:vc];
        [self presentViewController:nvc animated:YES completion:block];
        return;
    }
    [self presentViewController:vc animated:YES completion:block];
}
- (void)dismissModalVC{
    [self dismissModalVCWithSucceed:nil];
}
- (void)dismissModalVCWithSucceed:(UIViewController_block_void)block{
    [self dismissViewControllerAnimated:YES completion:block];
}





@end
