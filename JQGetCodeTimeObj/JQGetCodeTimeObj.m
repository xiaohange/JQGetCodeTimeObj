//
//  JQGetCodeTimeObj.m
//  JQGetCodeTimeObjDemo
//
//  Created by administrator on 15-6-24.
//  Copyright (c) 2018年 administrator. All rights reserved.
//

#import "JQGetCodeTimeObj.h"
#import "JQGetCodeTimeManager.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define kDefaultLimitTime 60.0f

@implementation JQGetCodeTimeObj
{
    CADisplayLink *_timer;
    NSInteger _limitTime;
}

#pragma mark -

- (void)startCountDown
{
    [self stopTimer];
    _limitTime = [[JQGetCodeTimeManager shareInstance] getStartTime];
    if (_timeOutSecs) {
        _limitTime = _timeOutSecs;
    }
    _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(startTimer:)];
    _timer.frameInterval = kDefaultLimitTime;
    [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [_timer invalidate];
    _timer = nil;
}

- (void)stopCountDown
{
    [self stopTimer];
    _limitTime = 0;
    if ([_delegate respondsToSelector:@selector(onFinishTime:)]) {
        [_delegate onFinishTime:self];
    }
    [self cacheCurTime];
}

- (void)startTimer:(CADisplayLink *)timer
{
    _limitTime --;
    if (_limitTime <= 0) {
        [self stopCountDown];
        return;
    }
    @try {
        
    if ([_delegate respondsToSelector:@selector(onGoingTime:time:)]) {
        [_delegate onGoingTime:self time:_limitTime];
    }
    } @catch (NSException *exception) {
        [self stopCountDown];
        return;
    }
}

- (void)cacheCurTime
{
    [[JQGetCodeTimeManager shareInstance] setStartTime:_limitTime];
}

@end
