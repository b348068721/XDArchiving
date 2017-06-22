//
//  Event.h
//
//  Created by winter on 16/7/18.
//  Copyright © 2016年 winter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XDEvent : NSObject

@property (nonatomic, copy) NSString *randomValue;//随机值
@property (nonatomic, copy) NSString *timesTampEvent;//事件时间（初始化时置为当前时间）
@property (nonatomic, copy) NSString *networkStatus;//网络状态
@property (nonatomic, copy) NSString *userIDClass;//用户ID类型
@property (nonatomic, copy) NSString *userID;//用户ID
@property (nonatomic, copy) NSString *category;//事件类别
@property (nonatomic, copy) NSString *action;//事件行为
@property (nonatomic, copy) NSString *label;//事件标签
@property (nonatomic, assign) NSInteger value;// AnalyticsTracker::trackEvent2()参数中传入的value值
@property (nonatomic, strong) NSMutableArray *mutArray;//自定义参数（key-value）


@end
