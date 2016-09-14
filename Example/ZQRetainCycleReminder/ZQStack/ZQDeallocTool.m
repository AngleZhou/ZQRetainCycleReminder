//
//  ZQDeallocTool.m
//  ZQDeallocTool
//
//  Created by ZhouQian on 16/8/28.
//  Copyright © 2016年 ZhouQian. All rights reserved.
//

#import "ZQDeallocTool.h"
#import "objc/runtime.h"
#import "Aspects.h"
#import "ZQStack.h"



@implementation ZQDeallocTool

+ (void)addDeallocLog {
//        NSArray *arrWhilteList = [whiteList componentsSeparatedByString:@","];
    
        Class *classes = NULL;
        int numClasses = objc_getClassList(NULL, 0);
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);

        numClasses = objc_getClassList(classes, numClasses);
        for (NSInteger classIndex = 0; classIndex < numClasses; ++classIndex) {
            Class class = classes[classIndex];
            NSString *className = NSStringFromClass(class);
            
        
                if ([ZQDeallocTool isNSObject:class]) {
                    if ([class isSubclassOfClass:[UIViewController class]]) {
                            [class aspect_hookSelector:NSSelectorFromString(@"dealloc") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo){
                                NSLog(@"hooked dealloc");
                                id obj = [aspectInfo instance];
                                [[ZQStack sharedInstance] ZQStackRemoveObject:obj];
                                NSLog(@"%@ dealloc", className);
                            } error:NULL];
                        
                    }
                }
            
            
            
            
//            for (NSString *prefix in arrWhilteList) {
//                if ([[className substringToIndex:3] isEqualToString:prefix]) {
                    //do swizzling
//                    [class aspect_hookSelector:NSSelectorFromString(@"dealloc") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo){
//                        id obj = [aspectInfo instance];
//                        
//                        NSLog(@"%@ dealloc!!!", className);
//                    } error:NULL];
//                }
//            }
            
            
            
        }
}

+ (BOOL)isNSObject:(Class)class {
    Class parent = class_getSuperclass(class);
    Class temp;
    while (parent) {
        temp = parent;
        parent = class_getSuperclass(parent);
        
    }
    return class_conformsToProtocol(temp, @protocol(NSObject));
}
@end
