//
//  ZQReminderView.m
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/12.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import "ZQReminderView.h"

@implementation ZQReminderView

- (instancetype)init {
    return [self initWithFrame:[UIScreen mainScreen].bounds];
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)showWithTip:(NSString *)tip {
    UILabel *lbl = [[UILabel alloc] init];
    lbl.numberOfLines = 0;
    lbl.font = [UIFont systemFontOfSize:16];
    NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{NSFontAttributeName : lbl.font};
    CGRect rect = [tip boundingRectWithSize:CGSizeMake(self.frame.size.width-32, 999) options:option attributes:attributes context:nil];
    CGFloat height = ceil(rect.size.height);
    lbl.frame = CGRectMake(16, (self.frame.size.height - height)/2, rect.size.width, height);
    lbl.text = tip;
    
    lbl.textColor = [UIColor blackColor];
    [self addSubview:lbl];
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:self];
}
- (void)dismiss {
    [self removeFromSuperview];
}


@end
