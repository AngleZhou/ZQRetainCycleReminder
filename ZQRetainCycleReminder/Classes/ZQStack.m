//
//  ZQStack.m
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/11.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import "ZQStack.h"
#import "Aspects.h"
#import "ZQObjectTracker.h"

@interface ZQStack ()
@property (nonatomic, strong) NSMutableArray *stack;
@property (nonatomic, strong) id retainedObject;

@end
@implementation ZQStack

+ (instancetype)sharedInstance {
    static ZQStack *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}


- (void)ZQStackPushObject:(id)object {
    ZQObjectTracker *tracker = [[ZQObjectTracker alloc] init];
    tracker.className = NSStringFromClass([object class]);
    tracker.memoryAddr = [NSString stringWithFormat:@"%p", object];
    tracker.status = ZQTrackerStatusInStack;
    [self.stack addObject:tracker];
     NSLog(@"%@", [self.stack description]);
}
- (void)ZQStackPopObject:(id)object {
    ZQObjectTracker *tracker = [self getTrackerFromObject:object];
    if (tracker) {
        tracker.status = ZQTrackerStatusPoped;
    }
    NSLog(@"%@", [self.stack description]);
}
- (void)ZQStackRemoveObject:(id)object {
    ZQObjectTracker *tracker = [self getTrackerFromObject:object];
    if (tracker && tracker.status == ZQTrackerStatusPoped) {
        [self.stack removeObject:tracker];
    }
}

- (ZQObjectTracker *)getTrackerFromObject:(id)object {
    NSString *addr = [NSString stringWithFormat:@"%p", object];
    NSPredicate *predi = [NSPredicate predicateWithFormat:@"SELF.memoryAddr == %@", addr];
    NSArray *filtered = [self.stack filteredArrayUsingPredicate:predi];
    if (filtered.count > 0) {
        ZQObjectTracker *tracker = [filtered firstObject];
        return tracker;
    }
    return nil;
}


#pragma mark - Setter and Getter

- (NSMutableArray *)stack {
    if (!_stack) {
        _stack = [[NSMutableArray alloc] init];
    }
    return _stack;
}

- (NSString *)preObjectAddr {
    __block NSString *preObj = nil;
    for (NSInteger i=self.stack.count-1; i>=1; i--) {
        ZQObjectTracker *current = self.stack[i];
        ZQObjectTracker *pre = self.stack[i-1];
        if (current.status == ZQTrackerStatusPoped && pre.status == ZQTrackerStatusInStack) {
            preObj = pre.memoryAddr;
            self.retainedObject = current;
        }
    }

    return preObj;
}

- (NSString *)getRetainedObjectInfo {
    NSString *info = [((ZQObjectTracker *)self.retainedObject) description];
    return [NSString stringWithFormat:@"%@ 没有被释放，存在循环引用！！！", info];
}
@end
