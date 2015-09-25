//
//  PaperViewController.m
//  MyApplication
//
//  Created by Xiaofeng.Ge on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "PaperViewController.h"
#import "Paper.h"
#import "PaperCell.h"

@interface PaperViewController ()

@end

@implementation PaperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataList = [[NSMutableArray alloc] init];

    NSArray *datas = @[@[@"2013", @"北京", @"2012-2013学年北京市石景山区初一下学期期末考试数学试卷（带解析）"],
                                   @[@"2013", @"江苏", @"2012-2013学年江苏苏州市景范中学初二第二学期期末考试数学试卷（带解析）"],
                                   @[@"2013", @"湖北", @"2013年湖北省恩施州初中数学评价《实数与代数式》单元试卷（一）（带解析）"],
                                   @[@"2013", @"全国", @"2013人教版初中数学七年级上册第一章有理数练习卷（带解析）"],
                                   @[@"2013", @"湖北", @"2013年初中毕业升学考试（湖北十堰卷）数学（带解析）"]];
    
    NSUInteger length = [datas count];

    for(NSUInteger index = 0 ;index< length; index++)
    {
        Paper *paper = [[Paper alloc] initWithPaperId:index
                             PaperYear:datas[index][0]
                            PaperProvince:datas[index][1]
                            PaperTitle:datas[index][2]];
        
        [_dataList addObject:paper];
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

// Default is 1 if not implemented
// 默认为1，可以不用去实现这个方法。
// 1、返回 UITableView 的区段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//  2、返回 UITableView 的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

//  3、设置行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

// 4、返回指定的 row 的 cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"CustomCellIdentifer";
//    indexPath row
//    NSUInteger row = [indexPath row];
    
    Paper *paper = [_dataList objectAtIndex:[indexPath row]];
    
     // 1.缓存中取
    PaperCell *cell = (PaperCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    NSLog(@"11111111");
    if(!cell) // 2.创建
    {
        NSLog(@"222222");
        cell = [[PaperCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        
//        cell.province.text = paper.paperProvince;
//        cell.year.text = paper.paperYear;
//        cell.title.text = paper.paperTitle;
    }else
    {
        NSLog(@"33333");
    }
    [cell setPaperCellData:paper];
    return  cell;
}

//  5、点击单元格时的处理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Paper *paper = _dataList[indexPath.row];
    NSLog(@"点击的标题是===%@",[paper paperTitle]);
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%d",[paper.paperId]] message:[paper.paperTitle] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"其他", nil];
//    [alert show];
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
