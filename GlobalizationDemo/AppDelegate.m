//
//  AppDelegate.m
//  GlobalizationDemo
//
//  Created by ma qi on 2020/8/20.
//  Copyright © 2020 ma qi. All rights reserved.
//

#import "AppDelegate.h"
#import "MQTabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"\n>>>home:%@", NSHomeDirectory());
    self.window.backgroundColor = UIColor.whiteColor;
    MQTabbarController *tabbar = [[MQTabbarController alloc] init];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
