//
//  KCContactGroup.h
//  MyTableViewDemo
//
//  Created by Gao on 15/9/24.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContactGroup : NSObject

#pragma mark 组名
@property(nonatomic,copy) NSString *name;

#pragma mark 分组联系人
@property(nonatomic,copy) NSString *detail;

#pragma mark 联系人
@property(nonatomic,strong) NSMutableArray *contacts;

-(KCContactGroup*)initWithName:(NSString*)name AndDetail:(NSString*)detail AndContacts:(NSMutableArray*)contact;

+(KCContactGroup*)initWithName:(NSString*)name AndDetail:(NSString*)detail AndContacts:(NSMutableArray*)contact;

@end
