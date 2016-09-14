//
//  ZQObjectTracker.m
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/12.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import "ZQObjectTracker.h"

@implementation ZQObjectTracker

- (NSString *)description {
    if (self.status == ZQTrackerStatusPoped) {
        return [NSString stringWithFormat:@"%@<%@>::retained", self.className, self.memoryAddr];
    }
    else {
        return [NSString stringWithFormat:@"%@<%@>", self.className, self.memoryAddr];
    }
    
}
@end
