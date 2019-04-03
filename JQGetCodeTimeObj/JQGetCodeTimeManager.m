//
//  JQGetCodeTimeManager.m
//  JQGetCodeTimeObjDemo
//
//  Created by administrator on 15-6-24.
//  Copyright (c) 2018年 administrator. All rights reserved.
//

#import "JQGetCodeTimeManager.h"

#define GETCODE_LIMIT_TIME 30

@interface JQGetCodeTimeManager ()
{
    NSInteger _startTime;
}
@end

@implementation JQGetCodeTimeManager

+ (JQGetCodeTimeManager *)shareInstance
{
    static JQGetCodeTimeManager *__getcodeTimeManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __getcodeTimeManager = [[JQGetCodeTimeManager alloc] init];
    });
    return __getcodeTimeManager;
}

- (id)init
{
    if (self = [super init]) {
        _startTime = 0;
    }
    return self;
}

- (NSInteger)getStartTime
{
    if (_startTime) {
        return _startTime;
    } else {
        return GETCODE_LIMIT_TIME;
    }
}

- (void)setStartTime:(NSInteger)time
{
    _startTime = time;
}

@end
