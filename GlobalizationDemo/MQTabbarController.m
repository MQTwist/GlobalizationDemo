//
//  MQTabbarController.m
//  GlobalizationDemo
//
//  Created by ma qi on 2020/8/20.
//  Copyright © 2020 ma qi. All rights reserved.
//

#import "MQTabbarController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"

@interface MQTabbarController ()

@end

@implementation MQTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addVc:[HomeViewController new] itemTitle:NSLocalizedString(@"首页", nil)];
    [self addVc:[FindViewController new] itemTitle:NSLocalizedString(@"发现", nil)];
    [self addVc:[MeViewController new] itemTitle:NSLocalizedString(@"我的", nil)];
}

- (void)addVc:(UIViewController *)vc itemTitle:(NSString *)itemTitle {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.title = itemTitle;
    vc.title = itemTitle;
    [self addChildViewController:nav];
}


@end
