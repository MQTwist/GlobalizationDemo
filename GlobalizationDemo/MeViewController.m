//
//  MeViewController.m
//  GlobalizationDemo
//
//  Created by ma qi on 2020/8/20.
//  Copyright © 2020 ma qi. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [UILabel new];
    label.text = NSLocalizedString(@"这是个文本标签", nil);
    label.font = [UIFont systemFontOfSize:20];
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
    
    [self MQ_AddBtn];
}

- (void)MQ_AddBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.center = CGPointMake(self.view.center.x, 200);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:NSLocalizedString(@"按钮", nil) forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)btnClick:(UIButton *)sender {
    SettingViewController *vc = [SettingViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
