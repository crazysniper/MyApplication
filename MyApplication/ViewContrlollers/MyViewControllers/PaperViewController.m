//
//  PaperViewController.m
//  MyApplication
//
//  Created by Gao on 15/9/25.
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
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    self.tableView.bounces = NO;
    

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds ].size.width, 20)];
    headerView.backgroundColor = [UIColor blackColor];
    
    
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds ].size.width, 20)];
    footerView.backgroundColor = [UIColor redColor];
    
    [self.tableView setTableHeaderView:headerView];
    [self.tableView setTableFooterView:footerView];
    

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 去除间隔线
//    [self.tableView setTableHeaderView:[[UIView alloc] initWithFrame:CGRectZero ]];
//    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero ]];
    
    NSMutableArray *datas = [NSMutableArray array];
    for (int index = 0; index < 20; index ++) {
        NSArray *item = @[[NSString stringWithFormat:@"%d",index],[NSString stringWithFormat:@"第%d",index],[NSString stringWithFormat:@"内容是%d",index]];
        [datas addObject:item];
    }
    

//    NSArray *datas = @[@[@"2011", @"北京", @"2012-2013学年北京市石景山区初一下学期期末考试数学试卷（带解析）"],
//                                   @[@"2012", @"江苏", @"2012-2013学年江苏苏州市景范中学初二第二学期期末考试数学试卷（带解析）"],
//                                   @[@"2013", @"湖北", @"2013年湖北省恩施州初中数学评价《实数与代数式》单元试卷（一）（带解析）"],
//                                   @[@"2014", @"全国", @"2013人教版初中数学七年级上册第一章有理数练习卷（带解析）"],
//                                   @[@"2015", @"湖北", @"2013年初中毕业升学考试（湖北十堰卷）数学（带解析）"]];
    
    NSUInteger length = [datas count];

    for(NSUInteger index = 0 ;index < length; index++)
    {
        Paper *paper = [[Paper alloc] initWithPaperId:index
                             PaperYear:datas[index][0]
                            PaperProvince:datas[index][1]
                            PaperTitle:datas[index][2]];
        
        [_dataList addObject:paper];
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.view =  self.tableView;
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
//    return 40;
}

/*

一般实现自定义UITableViewCell需要分为两步：
 第一初始化控件；
 第二设置数据，重新设置控件frame。
 原因就是自定义Cell一般无法固定高度，很多时候高度需要随着内容改变。此外由于在单元格内部是无法控制单元格高度的，因此一般会定义一个高度属性用于在UITableView的代理事件中设置每个单元格高度。
 
 */

// 4、返回指定的 row 的 cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"CustomCellIdentifer";
//    indexPath row
//    NSUInteger row = [indexPath row];
    
    Paper *paper = [_dataList objectAtIndex:[indexPath row]];
    
     // 1.缓存中取
    PaperCell *cell = (PaperCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if(!cell) // 2.创建
    {
        cell = [[PaperCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        
//        cell.province.text = paper.paperProvince;
//        cell.year.text = paper.paperYear;
//        cell.title.text = paper.paperTitle;
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
