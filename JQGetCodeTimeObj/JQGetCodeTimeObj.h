//
//  JQGetCodeTimeObj.h
//  JQGetCodeTimeObjDemo
//
//  Created by administrator on 15-6-24.
//  Copyright (c) 2018年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JQGetCodeTimeObj : NSObject

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) int timeOutSecs;

- (void)startCountDown;
- (void)stopCountDown;
- (void)cacheCurTime;


@end

@protocol GetCodeTimeObjDelegate <NSObject>

- (void)onFinishTime:(JQGetCodeTimeObj *)obj;
- (void)onGoingTime:(JQGetCodeTimeObj *)obj time:(NSInteger)time;

@end
