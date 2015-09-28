//
//  MyViewController.m
//  MyApplication
//
//  Created by Gao on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "MyViewController.h"
#import "MyUIScrollView.h"
#import "MyUITableView.h"
#import "Utils.h"
#import "PaperViewController.h"
#import "KCStatusViewController.h"
#import "KCMainTableViewController.h"
#import "NavigationBarDemo.h"

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
    //每次出栈都会销毁相应的子控制器
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);
    
    //在子视图中可以通过navigationController属性访问导航控制器，
    //同时对于当前子视图来说其父控制器就是其导航控制器
    NSLog(@"%i",self.navigationController==self.parentViewController); // 1
    
    self.navigationController.title  = @"111";
     //在子视图中（或者根视图）有一个navigationItem用于访问其导航信息
//    self.navigationItem.title = @"222"; //或者直接设置控制器title（例如[self setTitle:@"Friends"]）
    
    //设置导航栏左侧按钮
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonSystemItemAdd target:nil action:nil];
    //设置导航栏右侧按钮
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"pic1.jpg"] style:UIBarButtonItemStyleDone target:self action:@selector(addFriends)];
    
    float width = [UIScreen mainScreen].bounds.size.width-15*2;
    
    UIButton *btn_weibo = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, width,50 )];
    [btn_weibo setTitle:@"跳转到仿微博页面" forState:UIControlStateNormal];
    [btn_weibo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn_weibo.backgroundColor = [UIColor blackColor];
    btn_weibo.tag = 1;
    [btn_weibo addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_weibo];
    
    UIButton *btn_tableView = [[UIButton alloc] initWithFrame:CGRectMake(10, [Utils getViewMarginTop:btn_weibo], width,50 )];
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

    UIButton *btn_contacts = [[UIButton alloc] initWithFrame:CGRectMake(10, [Utils getViewMarginTop:btn_scrollerView], width,50 )];
    [btn_contacts setTitle:@"跳转到仿联系人页面" forState:UIControlStateNormal];
    [btn_contacts setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn_contacts.backgroundColor = [UIColor blackColor];
    btn_contacts.tag = 4;
    [btn_contacts addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_contacts];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(10, [Utils getViewMarginTop:btn_contacts], width,50 )];
    [btn5 setTitle:@"跳转到NavigationBar人页面" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn5.backgroundColor = [UIColor blackColor];
    btn5.tag = 5;
    [btn5 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
}

-(void)addFriends{
    //通过push导航到另外一个子视图
    KCStatusViewController *qqContactController=[[KCStatusViewController alloc]init];
    [self.navigationController pushViewController:qqContactController animated:YES];
}

-(void)onClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    NSInteger tag = btn.tag;
    NSLog(@"点击的tag是==%d",tag);
    switch (tag) {
        case 1:
        {
            NSLog(@"跳转到仿微博页面");
            KCStatusViewController *view = [[KCStatusViewController alloc] init];
//            [self presentViewController:view animated:YES completion:nil];
            [self.navigationController pushViewController:view animated:YES];
        }
            break;
        case 2:
        {
            NSLog(@"跳转到TableView页面");
//            MyUITableView *tableView = [[MyUITableView alloc] init];
//            [self presentViewController:tableView animated:YES completion:nil];
            PaperViewController *view = [[PaperViewController alloc] init];
//            [self presentViewController:view animated:YES completion:nil];
            [self.navigationController pushViewController:view animated:YES];
        }
            break;
        case 3:
        {
            NSLog(@"跳转到ScrollerVie页面");
            MyUIScrollView *scrollView = [[MyUIScrollView alloc] init];
//            [self presentViewController:scrollView animated:YES completion:nil];
            [self.navigationController pushViewController:scrollView animated:YES];
        }
            break;
        case 4:
        {
            NSLog(@"跳转到联系人页面");
            KCMainTableViewController *scrollView = [[KCMainTableViewController alloc] init];
//            [self presentViewController:scrollView animated:YES completion:nil];
            [self.navigationController pushViewController:scrollView animated:YES];
        }
            break;
        case 5:
        {
            NSLog(@"跳转到联系人页面");
            NavigationBarDemo *scrollView = [[NavigationBarDemo alloc] init];
//            [self presentViewController:scrollView animated:YES completion:nil];
            [self.navigationController pushViewController:scrollView animated:YES];
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
