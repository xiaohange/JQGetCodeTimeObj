//
//  JQGetCodeTimeManager.h
//  JQGetCodeTimeObjDemo
//
//  Created by administrator on 15-6-24.
//  Copyright (c) 2018年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JQGetCodeTimeManager : NSObject

+ (JQGetCodeTimeManager *)shareInstance;
- (NSInteger)getStartTime;
- (void)setStartTime:(NSInteger)time;

@end
