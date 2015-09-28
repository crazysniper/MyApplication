//
//  AppDelegate.m
//  MyApplication
//
//  Created by Gao on 15/9/23.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "AppDelegate.h"
#import "SplashViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 程序启动之后执行，只有在第一次程序启动后才执行，以后不再执行；
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    
    SplashViewController *controller = [[SplashViewController alloc] init];
    controller.view.frame = self.window.frame;
    
//    self.window.rootViewController = controller;
    
    // 该UINavigationController 以self.viewController为视图栈 最底层控件
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    // 设置窗口以self.naviController为根视图控制器
    self.window.rootViewController = nav;
    
    // 将该UIWindow对象设为主窗口并显示出来
    [self.window makeKeyAndVisible];
    return YES;
}

// 程序将要被激活时（获得焦点）执行，程序激活用户才能操作；
- (void)applicationWillResignActive:(UIApplication *)application {
}

// 程序进入后台后执行，注意进入后台时会先失去焦点再进入后台；
- (void)applicationDidEnterBackground:(UIApplication *)application {
}

// 程序将要进入前台时执行；
- (void)applicationWillEnterForeground:(UIApplication *)application {
}

// 程序被激活（获得焦点）后执行，注意程序被激活时会先进入前台再被激活；
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

// 程序在终止时执行，包括正常终止或异常终止，例如说一个应用程序在后太运行（例如音乐播放软件、社交软件等）占用太多内存这时会意外终止调用此方法；
- (void)applicationWillTerminate:(UIApplication *)application {
}
//applicationWillTerminate

@end
