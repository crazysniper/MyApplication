//
//  Utils.h
//  MyApplication
//
//  Created by Gao on 15/9/23.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  工具类
 */
@interface Utils : NSObject


+(NSDateFormatter*)getDateFormatter_mm;
+(NSDateFormatter*)getDateFormatter;
+(NSDate *)string2date:(NSString *)date;
+(NSString *)date2string:(NSDate *)date;
+(NSString *)date2string_mm:(NSDate *)date;
/**
 *  获取时间戳
 *
 *  @param dateString NSString
 *
 *  @return NSInteger
 */
+ (NSInteger)stampFromDateString:(NSString *)dateString;

+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate;
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;
+(CGFloat)getViewBottom:(UIView *)view;
+(CGFloat)getViewRight:(UIView *)view;
/**
 *  获取屏幕尺寸大小
 *
 *  @return CGFloat
 */
+ (CGFloat)applicationSreenInch;
/**
 *  获取整型版本号字符串
 *
 *  @return NSString
 */
+ (NSString *)appVersion;


/**
 *  获取当前活动Controller
 *
 *  @return UIViewController
 */
+ (UIViewController *)getCurrentViewController;

/**
 *  设置view的上面所在的y轴坐标
 *
 *  @param view <#view description#>
 *
 *  @return <#return value description#>
 */
+ (CGFloat) getViewMarginTop:(UIView*)view;



@end
