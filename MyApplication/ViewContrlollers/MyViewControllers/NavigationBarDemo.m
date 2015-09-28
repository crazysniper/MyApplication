//
//  NavigationBarDemo.m
//  MyApplication
//
//  Created by Gao on 15/9/28.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "NavigationBarDemo.h"

/*
 
UINavigationBar 只是界面上的一个控件，也只是多个UINavigationItem的容器，
UINavigationController  使用栈的形式管理多个UIViewController(每个控制器对应一个界面) 
UINavigationController 不仅封装了UINavigationBar ，而且会自动为每个接受它管理的 UIViewController添加UINavigationBar，接受UINavigationController 管理的UIViewController对应的UI控件实际上位于UIViewController的Navigation view容器中。除此之外，UIViewController 底部还可以设置一个（UIToolBar对象）。
 
 
 
 */

@interface NavigationBarDemo ()
{
    NSInteger _count;
    UINavigationBar *bar;
    UINavigationController *controller;
}

@end

@implementation NavigationBarDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 1;
    // 创建一个导航条
    bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44)];
    // 把导航条添加到视图中
    [self.view addSubview:bar];
    // 调用push方法添加一个UINavigationItem
    [self push];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

-(void)push
{
    // 把导航条集合添加到导航条中，设置动画打开
    [bar pushNavigationItem:[self makeNavItem] animated:YES];
    _count++;
}

-(void)pop
{
    if(_count > 2){
        _count--;
        // 弹出最顶层的UINavigationItem
        [bar popNavigationItemAnimated:YES];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"只剩最后一个导航，再出栈就没有了" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

-(UINavigationItem*)makeNavItem
{
    // 创建一个导航项
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:nil ];
    // 创建一个左边按钮
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(push)];
    // 创建一个右边按钮
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(pop)];
    
    // 设置导航条内容
    item.title = [NSString stringWithFormat:@"第%d个导航条",_count];
    
    // 把左右2个按钮添加到导航项集合中
    [item setLeftBarButtonItem:left];
    [item setRightBarButtonItem:right];
    return  item;
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
