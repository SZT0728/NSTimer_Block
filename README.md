# NSTimer_Block
将定时器的target－Action封装成block回调，能够更方便的管理定时器触发的代码
## 前言
定时器NSTimer虽然简单易用，但是目标响应机制（target－action）这种方式很容易在代码中出现代码臃肿的情况，特别是在一个文件中有大量的代码，多个定时器的时候不方便调试，因此将NSTimer封装成block回调能够有助于工作中的开发与调试.

>  **1,定时器timer重复触发的简单使用**
>
    + (NSTimer *)timerActionWithSecond:(NSTimeInterval)second isRepeat:(BOOL)YesOrNo Action:(myTimerBlock)actionblock;
