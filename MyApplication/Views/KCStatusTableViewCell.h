//
//  KCStatusTableViewCell.h
//  Weibo
//
//  Created by Gao on 15/9/28.
//
//

#import <UIKit/UIKit.h>
@class KCStatus;

@interface KCStatusTableViewCell : UITableViewCell


#pragma mark 微博对象
@property (nonatomic,strong) KCStatus *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;

@end
