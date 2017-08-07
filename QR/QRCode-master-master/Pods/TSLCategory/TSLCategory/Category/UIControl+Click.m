//
//  UIControl+Click.m
//  zhihuimendian
//
//  Created by Tang Shilei on 16/3/27.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import "UIControl+Click.h"
#import <objc/runtime.h>

static const char *UIControl_AcceptEventIntervel ="UIControl_acceptEventInterval";

static const char *UIControl_EventTime ="UIControl_EventTime";
@implementation UIControl (Click)

+ (void)load{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__uxy_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}
-(NSTimeInterval)ts_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_AcceptEventIntervel) doubleValue];
}
-(void)setTs_acceptEventInterval:(NSTimeInterval)ts_acceptEventInterval{
    
     objc_setAssociatedObject(self, UIControl_AcceptEventIntervel, @(ts_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(double)eventTime{
    
   return  [objc_getAssociatedObject(self, UIControl_EventTime) doubleValue];
    
}
-(void)setEventTime:(double)eventTime{
    objc_setAssociatedObject(self, UIControl_EventTime, @(eventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)__uxy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (NSDate.date.timeIntervalSince1970 - self.eventTime< self.ts_acceptEventInterval) return;
    
    if (self.ts_acceptEventInterval > 0){
        self.eventTime = NSDate.date.timeIntervalSince1970;
    }
    [self __uxy_sendAction:action to:target forEvent:event];
}


@end
