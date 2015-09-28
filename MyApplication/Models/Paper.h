//
//  Paper.h
//  MyApplication
//
//  Created by Gao on 15/9/25.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Paper : NSObject

@property(nonatomic,assign) NSUInteger paperId;
@property(nonatomic,strong) NSString *paperYear;
@property(nonatomic,strong) NSString *paperProvince;
@property(nonatomic,strong) NSString *paperTitle;

-(instancetype)initWithPaperId:(NSUInteger*)paperId PaperYear:(NSString*)paperYear PaperProvince:(NSString*)paperProvince PaperTitle:(NSString*)paperTitle;

@end
