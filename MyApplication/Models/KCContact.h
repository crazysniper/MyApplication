//
//  KCContact.h
//  MyTableViewDemo
//
//  Created by Gao on 15/9/24.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContact : NSObject


#pragma mark 姓
@property(nonatomic,copy) NSString *firstName;
#pragma mark 名
@property(nonatomic,copy) NSString *lastName;
#pragma mark 手机号码
@property(nonatomic,copy) NSString *phoneNum;


-(KCContact *)initWithFirstName:(NSString*)firstName AndLastName:(NSString*)lastName AndPhoneNumber:(NSString*)phoneNumber;
#pragma mark 取得姓名
-(NSString*) getName;

+(KCContact *)initWithFirstName:(NSString*)firstName AndLastName:(NSString*)lastName AndPhoneNumber:(NSString*)phoneNumber;


@end
