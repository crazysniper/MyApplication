//
//  MyUITableView.m
//  MyApplication
//
//  Created by Xiaofeng.Ge on 15/9/24.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "MyUITableView.h"

@interface MyUITableView ()

@end

@implementation MyUITableView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    return  cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  11;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) initViews
{
    UIButton *btn_back = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    [btn_back setTitle:@"点击返回" forState:UIControlStateNormal];
    btn_back.backgroundColor = [UIColor blackColor];
    btn_back.tag = 1;
    [btn_back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:btn_back];
    
    
   NSArray *list = [NSArray arrayWithObjects:@"武汉",@"上海",@"北京",@"深圳",@"广州",@"重庆",@"香港",@"台海",@"天津", nil];
   
    
//    for (int index=0; index<20; index++) {
//        [list addObject:[NSString stringWithFormat:@"%d",index]];
//    }
     self.dataList = list;
    
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;

    
    UITableView *tableView1 = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView1.dataSource = self;
    tableView1.delegate = self;
    self.tableView =tableView1;
    
    
    [self.view addSubview:tableView1];
    
    
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
