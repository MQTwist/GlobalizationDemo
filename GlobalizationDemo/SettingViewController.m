//
//  SettingViewController.m
//  GlobalizationDemo
//
//  Created by ma qi on 2020/8/20.
//  Copyright © 2020 ma qi. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingModel.h"
#import "MQLanguageConfig.h"
#import "NSBundle+Language.h"
#import "MQTabbarController.h"

@interface SettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

static NSString *const cellId = @"cellId";

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"设置", nil);
    if (MQLanguageConfig.userLanguage.length > 0) {
        NSString *str = [NSBundle currentLanguage];
        for (NSInteger i = 0; i < self.dataArr.count; i++) {
            SettingModel *model = self.dataArr[i];
            model.select = [model.language isEqualToString:str];
        }
    }
    CGFloat navHeight = [UIApplication sharedApplication].statusBarFrame.size.height + 44;
    self.tableView.frame = CGRectMake(0, navHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - navHeight);
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark - delegate ---> tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    SettingModel *model = self.dataArr[indexPath.row];
    cell.textLabel.text = model.title;
    cell.accessoryType = (model.select) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingModel *model = self.dataArr[indexPath.row];
    if (model.select) {
        return;
    }
    for (SettingModel *model in self.dataArr) {
        model.select = NO;
    }
    model.select = !model.select;
    [tableView reloadData];
    
    MQLanguageConfig.userLanguage = model.language;
    
    //创建新的UITabbarController
    MQTabbarController *tabbar = [MQTabbarController new];
    
    //找到对应的nav
    tabbar.selectedIndex = 2;
    UINavigationController *nav = tabbar.selectedViewController;
    NSMutableArray *navVCs = nav.viewControllers.mutableCopy;
    
    //添加指定vc到nav栈中
    SettingViewController *vc = [SettingViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [navVCs addObject:vc];
    
    //主线程刷新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].delegate.window.rootViewController = tabbar;
        nav.viewControllers = navVCs;
        NSLog(@"当前语言 %@", [NSBundle currentLanguage]);
    });
}

#pragma mark -
#pragma mark - getter ---> data

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        {
            SettingModel *model = [SettingModel new];
            model.title = NSLocalizedString(@"跟随系统", nil);
            model.language = nil;
            model.select = YES;
            [_dataArr addObject:model];
        }
        {
            SettingModel *model = [SettingModel new];
            model.title = NSLocalizedString(@"简体中文", nil);
            model.language = @"zh-Hans";
            [_dataArr addObject:model];
        }
        {
            SettingModel *model = [SettingModel new];
            model.title = NSLocalizedString(@"English", nil);
            model.language = @"en";
            [_dataArr addObject:model];
        }
    }
    return _dataArr;
}

#pragma mark -
#pragma mark - getter ---> view

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _tableView;
}

@end
