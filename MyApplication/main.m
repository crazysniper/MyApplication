//
//  main.m
//  MyApplication
//
//  Created by Gao on 15/9/23.
//  Copyright (c) 2015年 Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/*
 这个默认的iOS程序就是从main函数开始执行的，但是在main函数中我们其实只能看到一个方法，这个方法内部是一个消息循环（相当于一个死循环），因此运行到这个方法UIApplicationMain之后程序不会自动退出，而只有当用户手动关闭程序这个循环才结束
 
 */
int main(int argc, char * argv[]) {
    @autoreleasepool {

        /*
         第一个参数和第二个参数其实就是main函数的参数，分别代表：参数个数、参数内容；
         第三个参数代表UIApplication类（或子类）字符串，这个参数默认为nil则代表默认为UIApplication类，用户可以自定义一个类继承于这个类；如果为nil则等价于NSStringFromClass([UIApplication class])，大家可以自己试验，效果完全一样；UIApplication是单例模式，一个应用程序只有一个UIApplication对象或子对象；
         第四个参数是UIApplication的代理类字符串，默认生成的是AppDelegate类，这个类主要用于监听整个应用程序生命周期的各个事件（其实类似于之前我们文章中提到的事件监听代理），当UIApplication运行过程中引发了某个事件之后会调用代理中对应的方法；
         */
        
        /*
         也就是说当执行UIApplicationMain方法后这个方法会根据第三个参数创建对应的UIApplication对象，这个对象会根据第四个参数AppDelegate创建并指定此对象为UIApplication的代理；同时UIApplication会开启一个消息循环不断监听应用程序的各个活动，当应用程序生命周期发生改变UIApplication就会调用代理对应的方法。
         
         */
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
