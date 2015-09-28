//
//  SplashViewController.m
//  MyApplication
//
//  Created by Gao on 15/9/23.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "SplashViewController.h"
#import "GuideViewController.h"
#import "MyViewController.h"
#import "Utils.h"

@interface SplashViewController ()
{
    UILabel *label;
    UIButton *btn_next;
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
//    self.view.backgroundColor = [UIColor redColor];
//    [self.navigationController.navigationBar setTranslucent:NO]; //设置navigationbar的半透明
    self.title = @"navigationcontroller";//设置navigationbar上显示的标题
    
    float width = [UIScreen mainScreen].bounds.size.width-15*2;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, width, 50)];
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
    
    [self.view addSubview:label];
    
    
    btn_next = [[UIButton alloc] initWithFrame:CGRectMake(10, [Utils getViewMarginTop:label], width,50 )];
    [btn_next setTitle:@"跳转到引导页面" forState:UIControlStateNormal];
    [btn_next setTitle:@"高亮" forState:UIControlStateHighlighted];
    [btn_next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_next setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    btn_next.backgroundColor = [UIColor blackColor];
    btn_next.tag = 1;
    
    [btn_next addTarget:self action:@selector(pushNext:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn_next];
    
    UIButton *btn_tableView = [[UIButton alloc] initWithFrame:CGRectMake(10, [Utils getViewMarginTop:btn_next], width,50 )];
    [btn_tableView setTitle:@"跳转到控件学习页面" forState:UIControlStateNormal];
    [btn_tableView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn_tableView.backgroundColor = [UIColor blackColor];
    btn_tableView.tag = 2;
    [btn_tableView addTarget:self action:@selector(pushNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_tableView];
}

-(void)pushNext:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    NSInteger tag = btn.tag;
    NSLog(@"点击的tag是==%ld",tag);
    switch (tag) {
        case 1:
            {
                NSLog(@"跳转到引导页面");
                GuideViewController *guide = [[GuideViewController alloc] initGuideInfo:@"11111"];
//                [self.navigationController pushViewController:guide animated:YES];
//                [self presentViewController:guide animated:YES completion:nil];
                [self.navigationController pushViewController:guide animated:YES];
            }
            break;
        case 2:
            {
                NSLog(@"跳转到控件学习页面");
                MyViewController *tableView = [[MyViewController alloc] init];
//                [self presentViewController:tableView animated:YES completion:nil];
                [self.navigationController pushViewController:tableView animated:YES];
            }
            break;
        default:
            break;
    }
    
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
