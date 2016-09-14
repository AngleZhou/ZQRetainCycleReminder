//
//  ZQDeallocTool.h
//  ZQDeallocTool
//
//  Created by ZhouQian on 16/8/28.
//  Copyright © 2016年 ZhouQian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//static NSString *whiteList = @"";//@"CTC";

@interface ZQDeallocTool : NSObject
@property (nonatomic, strong) NSString *whiteList;
+ (void)addDeallocLog;
@end
