//
//  MyViewController.m
//  MyApplication
//
//  Created by Xiaofeng.Ge on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "MyViewController.h"
#import "MyUIScrollView.h"
#import "MyUITableView.h"
#import "Utils.h"

@interface MyViewController ()

@end

@implementation MyViewController

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
    float width = [UIScreen mainScreen].bounds.size.width-15*2;
    
    UIButton *btn_tableView = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, width,50 )];
    [btn_tableView setTitle:@"跳转到UITableView页面" forState:UIControlStateNormal];
    [btn_tableView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn_tableView.backgroundColor = [UIColor blackColor];
    btn_tableView.tag = 2;
    [btn_tableView addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_tableView];
    
    UIButton *btn_scrollerView = [[UIButton alloc] initWithFrame:CGRectMake(10, [Utils getViewMarginTop:btn_tableView], width,50 )];
    [btn_scrollerView setTitle:@"跳转到UIScrollerView页面" forState:UIControlStateNormal];
    [btn_scrollerView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn_scrollerView.backgroundColor = [UIColor blackColor];
    btn_scrollerView.tag = 3;
    [btn_scrollerView addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_scrollerView];
}

-(void)onClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    NSInteger tag = btn.tag;
    NSLog(@"点击的tag是==%ld",tag);
    switch (tag) {
        case 2:
        {
            NSLog(@"跳转到TableView页面");
            MyUITableView *tableView = [[MyUITableView alloc] init];
            [self presentViewController:tableView animated:YES completion:nil];
        }
            break;
        case 3:
        {
            NSLog(@"跳转到ScrollerVie页面");
            MyUIScrollView *scrollView = [[MyUIScrollView alloc] init];
            [self presentViewController:scrollView animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
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
