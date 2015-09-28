//
//  PaperViewController.h
//  MyApplication
//
//  Created by Gao on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface PaperViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataList;

@end
