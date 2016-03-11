# NSTimer_Block
将定时器的target－Action封装成block回调，为定时器添加Block回调版本，方便代码的管理与维护
## 前言
定时器NSTimer虽然简单易用，但是目标响应机制（target－action）这种方式很容易在代码中出现代码臃肿的情况，特别是在一个文件中有大量的代码，多个定时器的时候不方便调试，因此将NSTimer封装成block回调能够有助于工作中的开发与调试.

