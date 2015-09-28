//
//  KCCell.m
//  MyTableViewDemo
//
//  Created by Gao on 15/9/28.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "KCCell.h"

@implementation KCCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self getView];
    }
    return self;
}

-(void) getView
{
    
}

/**
 *  awakeFromNib是一个只有在GUI对象被成功加载才调用的方法，而init方法是在GUI被创建前就已经调用了。
 */
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
