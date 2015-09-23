//
//  Utils.m
//  MyApplication
//
//  Created by Gao on 15/9/23.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import "Utils.h"
#import "Defines.h"

@implementation Utils

static NSDateFormatter *dateFormatter;

#pragma mark - 时间
+(NSDateFormatter*)getDateFormatter_mm{
    NSDateFormatter *dateFormatter_time = [[NSDateFormatter alloc] init];
    [dateFormatter_time setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter_time setDateFormat : @"yyyy-MM-dd-hh-mm"];
    
    return dateFormatter_time;
}

+(NSDateFormatter*)getDateFormatter{
    if(dateFormatter == nil ){
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormatter setDateFormat : @"yyyy-MM-dd"];
    }
    return dateFormatter;
}

+(NSDate *)string2date:(NSString *)date{
    return  [[self getDateFormatter] dateFromString:date];
}

+(NSString *)date2string:(NSDate *)date{
    return [[self getDateFormatter] stringFromDate:date];
}

+(NSString *)date2string_mm:(NSDate *)date{
    return [[self getDateFormatter_mm] stringFromDate:date];
}

//获取时间戳
+ (NSInteger)stampFromDateString:(NSString *)dateString
{
    NSDate *date = [self dateFromFomate:dateString formate:@"yyyy-MM-dd"];
    return date.timeIntervalSince1970;
}

+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}

#pragma mark - 屏幕大小、距离

+(CGFloat)getViewBottom:(UIView *)view {
    return view.frame.origin.y + view.frame.size.height;
}

+(CGFloat)getViewRight:(UIView *)view {
    return view.frame.origin.x + view.frame.size.width;
}

//获取屏幕尺寸大小
+ (CGFloat)applicationSreenInch{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    if (height == 736) {
        return 5.5;
    }else if (height == 667) {
        return 4.7;
    }else if (height == 568) {
        return 4;
    }else {
        return 3.5;
    }
}

#pragma mark - 系统信息

//获取整型版本号字符串
+ (NSString *)appVersion {
    return [NSString stringWithFormat:@"%ld", (long)[Current_Build integerValue]];
}

#pragma mark - 当前活动Controller

//获取当前活动Controller
+ (UIViewController *)getCurrentViewController {
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    if ([result isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbar = (UITabBarController *)result;
        UINavigationController *nav = tabbar.viewControllers[tabbar.selectedIndex];
        if ([nav isKindOfClass:[UINavigationController class]]) {
            UIViewController *controller = nav.viewControllers[nav.viewControllers.count - 1];
            return controller;
        }
    }
    
    return result;
}



@end
