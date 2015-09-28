//
//  PaperCell.h
//  MyApplication
//
//  Created by Gao on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Paper.h"
#import "Defines.h"

@interface PaperCell : UITableViewCell

@property(nonatomic,strong)  UILabel *year;
@property(nonatomic,strong)  UILabel *province;
@property(nonatomic,strong)  UILabel *title;

-(void) setPaperCellData:(Paper*)paper;

@end
