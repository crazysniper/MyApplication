//
//  Paper.m
//  MyApplication
//
//  Created by Gao on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "Paper.h"

@implementation Paper

-(instancetype)initWithPaperId:(NSUInteger)paperId PaperYear:(NSString*)paperYear PaperProvince:(NSString*)paperProvince PaperTitle:(NSString*)paperTitle
{
    if(self=[super init])
    {
        self.paperId = paperId;
        self.paperYear = paperYear;
        self.paperProvince = paperProvince;
        self.paperTitle = paperTitle;
    }
    return self;
    
}

@end
