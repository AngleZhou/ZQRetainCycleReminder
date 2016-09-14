//
//  ZQViewController.m
//  ZQRetainCycleReminder
//
//  Created by Zhou Qian on 16/9/11.
//  Copyright © 2016年 Zhou Qian. All rights reserved.
//

#import "ZQViewController.h"

@interface ZQViewController ()
@property (nonatomic, copy) void(^block)(void);
@end

@implementation ZQViewController


#pragma mark - life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 50, 50)];
    btn.titleLabel.text = @"next vc";
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(gotoVC) forControlEvents:UIControlEventTouchUpInside];
    
    self.block = ^{
        [self.view addSubview:[[UIView alloc] init]];
    };
    
    
    self.block();
}


#pragma mark - Action

- (void)gotoVC {
    ZQViewController *zqvc = [[ZQViewController alloc] init];
    [self.navigationController pushViewController:zqvc animated:YES];
    
}

#pragma mark - Private Methods

#pragma mark - Delegate

#pragma mark - Setter and Getter


@end
