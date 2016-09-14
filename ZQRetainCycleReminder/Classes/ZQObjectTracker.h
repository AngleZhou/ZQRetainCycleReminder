//
//  ZQObjectTracker.h
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/12.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZQTrackerStatus) {
    ZQTrackerStatusInStack,
    ZQTrackerStatusPoped,
    ZQTrackerStatusOutofStack
};

@interface ZQObjectTracker : NSObject
@property (nonatomic, strong) NSString *memoryAddr;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, assign) ZQTrackerStatus status;
@end
