//
//  NSTimer+TimerBlock.h
//  NStimer_Block
//
//  Created by SZT on 16/3/9.
//  Copyright © 2016年 SZT. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSTimer (TimerBlock)

/**
 *  重定义定时器回调的block
 */
typedef void (^myTimerBlock)(void);


/**
 *  定时器timer重复触发的简单使用
 *
 *  @param second      定时器每次触发的时间
 *  @param YesOrNo     是否重复
 *  @param actionblock 回调的block
 *
 *  @return 返回定时器
 */
+ (NSTimer *)timerActionWithSecond:(NSTimeInterval)second isRepeat:(BOOL)YesOrNo Action:(myTimerBlock)actionblock;


/**
 *  定时器有限触发次数的简单使用
 *
 *  @param second      定时器触发的时间
 *  @param count       触发次数
 *  @param actionblock 回调block
 *
 *  @return 返回定时器
 */
+ (NSTimer *)timerActionWithSecond:(NSTimeInterval)second count:(NSInteger)count Action:(myTimerBlock)actionblock;



@end
