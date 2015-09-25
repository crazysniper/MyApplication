//
//  GuideViewController.m
//  MyApplication
//
//  Created by Gao on 15/9/23.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()
{
    NSString *_info;
}
@end

@implementation GuideViewController

-(instancetype) initGuideInfo:(NSString*)sendInfo
{
    self = [super init];
    if (self) {
        _info = sendInfo;
        NSLog(@"获取到的内容是===%@",sendInfo);
    }
    return self;
}

+(void) add
{
    NSLog(@"add方法");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initViews
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    label.text = [NSString stringWithFormat:@"传递的内容是：%@",_info];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:label];
    
    UIButton *btn_back = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    [btn_back setTitle:@"点击返回" forState:UIControlStateNormal];
    btn_back.backgroundColor = [UIColor blackColor];
    btn_back.tag = 1;
    [btn_back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn_back];
    
}

-(void)onClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 1:
            [self dismissViewControllerAnimated:YES completion:nil];
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
