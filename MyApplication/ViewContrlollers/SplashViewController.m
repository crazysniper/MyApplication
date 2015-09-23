//
//  SplashViewController.m
//  MyApplication
//
//  Created by Gao on 15/9/23.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()
{
    UILabel *label;
}

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initView
-(void) initView
{
    label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    label.backgroundColor = [UIColor blackColor]; // 文本背景颜色
    label.text = @"欢迎页面"; // 文本内容
    /*
     NSTextAlignmentLeft      = 0,    // Visually left aligned
     #if TARGET_OS_IPHONE
        NSTextAlignmentCenter    = 1,    // Visually centered
        NSTextAlignmentRight     = 2,    // Visually right aligned
     #else !TARGET_OS_IPHONE
        NSTextAlignmentRight     = 1,    // Visually right aligned
        NSTextAlignmentCenter    = 2,    // Visually centered
     #endif
        NSTextAlignmentJustified = 3,    // Fully-justified. The last line in a paragraph is natural-aligned.
        NSTextAlignmentNatural   = 4,    // Indicates the default alignment for script
      */
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor]; // 字体颜色
    label.font = [UIFont boldSystemFontOfSize:20];// 加粗
    
    
}

#pragma mark - updateView
-(void) updateView
{
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
