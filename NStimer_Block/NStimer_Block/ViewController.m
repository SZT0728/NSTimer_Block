//
//  ViewController.m
//  NStimer_Block
//
//  Created by SZT on 16/3/9.
//  Copyright © 2016年 SZT. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+TimerBlock.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


    /**
     *  定时器触发时间为1秒，重复触发，
     */
//    NSTimer *timer = [NSTimer timerActionWithSecond:1 isRepeat:YES Action:^{
//        NSLog(@"定时器重复触发");
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];


    /**
     *  定时器触发时间为1秒，触发次数为4次
     */
//    NSTimer *timer1 = [NSTimer timerActionWithSecond:1 count:4 Action:^{
//        NSLog(@"定时器有限次数触发");
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSRunLoopCommonModes];

    
    
   /************补充（block重定义）*************/
    typedef void  (^myBlock)();
    myBlock block1 = ^()
    {
        NSLog(@"这是一个没有返回参数，没有输入参数的block");
    };
    //调用定义好的block1
    block1();
    
    
    typedef int(^myBlock2)(NSString *);
    myBlock2 block2 = ^(NSString *str1){
        NSLog(@"这是一个返回值为int类型,输入参数值为%@的block",str1);
        return 0;
    };
    //调用定义好的block2
    block2(@"happy");
    
    
    typedef NSInteger (^myBlock3)(NSString *str1,NSString *str2);
    myBlock3 block3 = ^(NSString *str1,NSString *str2){
        NSLog(@"这是一个返回值为NSInteger类型的，输入参数1为%@,输入参数2为 %@",str1,str2);
        return [str1 compare:str2];
    };
    //调用定义好的block3
    block3(@"happy",@"sad");
    
    
}



@end
