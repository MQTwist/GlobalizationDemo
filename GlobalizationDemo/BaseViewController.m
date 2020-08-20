//
//  BaseViewController.m
//  GlobalizationDemo
//
//  Created by ma qi on 2020/8/20.
//  Copyright © 2020 ma qi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)loadView {
    [super loadView];
    NSLog(@">>>%@ loadView", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    NSLog(@">>>%@ viewDidLoad", NSStringFromClass([self class]));
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@">>>%@ viewWillAppear", NSStringFromClass([self class]));
}


@end
