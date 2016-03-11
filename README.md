# NSTimer_Block
将定时器的target－Action封装成block回调，能够更方便的管理定时器触发的代码
## 前言
定时器NSTimer虽然简单易用，但是目标响应机制（target－action）这种方式很容易在代码中出现代码臃肿的情况，特别是在一个文件中有大量的代码，多个定时器的时候不方便调试，因此将NSTimer封装成block回调能够有助于工作中的开发与调试.

>  **1,定时器timer重复触发的简单使用**
>
    *  @param second      定时器每次触发的时间
		 *  @param YesOrNo     定时器是否重复
		 *  @param actionblock 回调的block
		 *
		 *  @return 返回定时器
    + (NSTimer *)timerActionWithSecond:(NSTimeInterval)second isRepeat:(BOOL)YesOrNo Action:(myTimerBlock)actionblock;
    
>  **2,定时器timer有限触发次数使用**
> 
		 *
		 *  @param second      定时器触发的时间
		 *  @param count       定时器触发次数
		 *  @param actionblock 回调block
		 *
		 *  @return 返回定时器
		+ (NSTimer *)timerActionWithSecond:(NSTimeInterval)second count:(NSInteger)count Action:(myTimerBlock)actionblock;
##如何封装实现详解

下面将详细的叙述如何封装NStimer，使得NStimer响应的时候处理block回调：

>  **1,定时器timer重复触发的简单使用**
> 

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
		

>  **2,定时器timer有限触发次数使用**
> 

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
		    }
		}

封装最主要的就是如何调用你操作的block，这里是将block作为附带要传递的参数userInfo

