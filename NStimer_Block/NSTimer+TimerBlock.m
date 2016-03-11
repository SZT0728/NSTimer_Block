//
//  NSTimer+TimerBlock.m
//  NStimer_Block
//
//  Created by SZT on 16/3/9.
//  Copyright © 2016年 SZT. All rights reserved.
//

#import "NSTimer+TimerBlock.h"

@implementation NSTimer (TimerBlock)

+ (NSTimer *)timerActionWithSecond:(NSTimeInterval)second isRepeat:(BOOL)YesOrNo Action:(myTimerBlock)actionblock{
    
    return [NSTimer scheduledTimerWithTimeInterval:second target:self selector:@selector(timeAction:) userInfo:[actionblock copy] repeats:YesOrNo];
    
}

+ (void)timeAction:(NSTimer *)timer
{
    myTimerBlock actionBlock = timer.userInfo;
    if (actionBlock) {
        actionBlock();
    }
}

+ (NSTimer *)timerActionWithSecond:(NSTimeInterval)second count:(NSInteger)count Action:(myTimerBlock)actionblock
{
    NSDictionary *userInfoDic = [NSDictionary dictionaryWithObjectsAndKeys:[actionblock copy],@"blockAction",@(count),@"count", nil];
    return [NSTimer scheduledTimerWithTimeInterval:second target:self selector:@selector(timeActionLimit:) userInfo:userInfoDic repeats:YES];
}

+ (void)timeActionLimit:(NSTimer *)timer
{
    NSDictionary *userInfoDict = timer.userInfo;
    myTimerBlock actionBlock = userInfoDict[@"blockAction"];
    static  NSInteger flag = 0;
    if (flag < [userInfoDict[@"count"] integerValue]) {
        flag ++;
        if (actionBlock) {
            actionBlock();
        }
    }else{
        //当取消定时器的时候需要把定时器置空，不然定时器是没有释放的
//        [timer invalidate];
//        timer = nil;
        [timer setFireDate:[NSDate distantFuture]];
    }
}

@end
