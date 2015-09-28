//
//  KCContactGroup.m
//  MyTableViewDemo
//
//  Created by Gao on 15/9/24.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "KCContactGroup.h"

@implementation KCContactGroup

-(KCContactGroup*)initWithName:(NSString*)name AndDetail:(NSString*)detail AndContacts:(NSMutableArray*)contact
{
    if(self = [super init])
    {
        self.name = name;
        self.detail = detail;
        self.contacts = contact;
    }
    return self;
}

+(KCContactGroup*)initWithName:(NSString*)name AndDetail:(NSString*)detail AndContacts:(NSMutableArray*)contact
{
    return [[KCContactGroup alloc]initWithName:name AndDetail:detail AndContacts:contact];
    
}

@end
