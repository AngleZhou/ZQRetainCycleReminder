//
//  UIViewController+SwizzleViewDidLoad.m
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/12.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import "UIViewController+SwizzleViewDidLoad.h"
#import "Aspects.h"
#import "ZQStack.h"
#import "ZQReminderView.h"

@implementation UIViewController (SwizzleViewDidLoad)

+ (void)load {
    [UIViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>info){
        UIViewController *vc = [info instance];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSString *pre = [ZQStack sharedInstance].preObjectAddr;
            NSString *vcAddr = [NSString stringWithFormat:@"%p", vc];
            if ([pre isEqualToString:vcAddr]) {
                ZQReminderView *reminder = [[ZQReminderView alloc] init];
                [reminder showWithTip:[[ZQStack sharedInstance] getRetainedObjectInfo]];
                NSLog(@"没有释放！！！");
            }
        });
        
        
    }error:nil];
}
@end
