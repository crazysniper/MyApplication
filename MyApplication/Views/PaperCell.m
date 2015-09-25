//
//  PaperCell.m
//  MyApplication
//
//  Created by Xiaofeng.Ge on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "PaperCell.h"

@implementation PaperCell

/**
 
 typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
 UITableViewCellStyleDefault,    // 默认风格，自带标题和一个图片视图，图片在左
 UITableViewCellStyleValue1,     // 只有标题和副标题 副标题在右边
 UITableViewCellStyleValue2,     // 只有标题和副标题，副标题在左边标题的下边
 UITableViewCellStyleSubtitle    // 自带图片视图和主副标题，主副标题都在左边，副标题在下
 };
 
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initView];
    }
    return self;
}

-(void) initView
{
    _year = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    _year.backgroundColor = [UIColor whiteColor];
    
    
    CGFloat x = APP_SCREEN_WIDTH - 30 - 9;
    _province = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, 30, 20)];
    _province.backgroundColor = [UIColor whiteColor];
    
    
    CGFloat titleWidth = APP_SCREEN_WIDTH - 6 - 9 ;
    
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleWidth, 100)];
    _title.backgroundColor = [UIColor whiteColor];
    _title.textColor = [UIColor redColor];
    _title.font = [UIFont boldSystemFontOfSize:16];
    
    
    [self.contentView addSubview:_year];
    [self.contentView addSubview:_province];
    [self.contentView addSubview:_title];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setPaperCellData:(Paper*)paper
{
    self.year.text = paper.paperYear;
    self.province.text = paper.paperProvince;
    self.title.text = paper.paperTitle;
}

@end
