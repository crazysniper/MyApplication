//
//  MyUITableView.h  UITableView
//  MyApplication
//
//  Created by Gao on 15/9/24.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 TableView的数据源UITableViewDataSource
 TableView的委托UITableViewDelegate
 如果当前类是继承自UIViewController，需要添加上面的代码，如果直接继承自UITableViewController则不需要添加
 
 
 */

/**
 *  UITableView 学习
 */
@interface MyUITableView : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain) NSArray *dataList;
@property(nonatomic,retain) UITableView *tableView;

@end
