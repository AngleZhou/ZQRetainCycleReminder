//
//  ZQStack.h
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/11.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQStack : NSObject
@property (nonatomic, strong) NSString *preObjectAddr;

+ (instancetype)sharedInstance;
- (void)ZQStackPushObject:(id)object;
- (void)ZQStackPopObject:(id)object;
- (void)ZQStackRemoveObject:(id)object;
- (NSString *)getRetainedObjectInfo;




@end
