//
//  KCContact.m
//  MyTableViewDemo
//
//  Created by Gao on 15/9/24.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "KCContact.h"

@implementation KCContact

-(KCContact *)initWithFirstName:(NSString*)firstName AndLastName:(NSString*)lastName AndPhoneNumber:(NSString*)phoneNumber
{
    if(self = [super init])
    {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNum = phoneNumber;
    }
    return self;
}

-(NSString*) getName
{
    return [NSString stringWithFormat:@"%@ %@",self.firstName,self.lastName];
}

+(KCContact *)initWithFirstName:(NSString*)firstName AndLastName:(NSString*)lastName AndPhoneNumber:(NSString*)phoneNumber
{
    return [[KCContact alloc] initWithFirstName:firstName AndLastName:lastName AndPhoneNumber:phoneNumber];
}


@end
