//
//  UINavigationController+SwizzlePushPop.m
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/11.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import "UINavigationController+SwizzlePushPop.h"
#import "Aspects.h"
#import "ZQStack.h"


@implementation UINavigationController (SwizzlePushPop)

+ (void)load {
    [UINavigationController aspect_hookSelector:@selector(pushViewController:animated:) withOptions:(AspectPositionAfter) usingBlock:^(id<AspectInfo> info){
        UINavigationController *nav = [info instance];
        UIViewController *vc = [nav.viewControllers lastObject];
        [[ZQStack sharedInstance] ZQStackPushObject:vc];
    }error:nil];
    
    [UINavigationController aspect_hookSelector:@selector(popViewControllerAnimated:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info){
        UINavigationController *nav = [info instance];
        UIViewController *vc = [nav.viewControllers lastObject];
        [[ZQStack sharedInstance] ZQStackPopObject:vc];
    }error:nil];
    
}


@end
