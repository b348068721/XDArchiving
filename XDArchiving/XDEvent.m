//
//  Event.m
//
//  Created by winter on 16/7/18.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "XDEvent.h"
#import <objc/runtime.h>

@implementation XDEvent

- (void)encodeWithCoder:(NSCoder *)aCoder //将属性进行编码
{
//传统方法
//    [aCoder encodeObject:self.randomValue forKey:@"randomValue"];
//    [aCoder encodeObject:self.timesTampEvent forKey:@"timesTampEvent"];
//    [aCoder encodeObject:self.networkStatus forKey:@"networkStatus"];
//    [aCoder encodeObject:self.userIDClass forKey:@"userIDClass"];
//    [aCoder encodeObject:self.userID forKey:@"userID"];
//    [aCoder encodeObject:self.category forKey:@"category"];
//    [aCoder encodeObject:self.action forKey:@"action"];
//    [aCoder encodeObject:self.label forKey:@"label"];
//    [aCoder encodeInteger:self.value forKey:@"value"];
//    [aCoder encodeObject:self.mutArray forKey:@"customArray"];
//runtime
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [aCoder encodeObject:[self valueForKey:name] forKey:name];
    }
    
}
- (id)initWithCoder:(NSCoder *)aDecoder //将属性进行解码
{
    if (self = [super init]) {
//传统方法
//        self.randomValue = [aDecoder decodeObjectForKey:@"randomValue"];
//        self.timesTampEvent = [aDecoder decodeObjectForKey:@"timesTampEvent"];
//        self.networkStatus = [aDecoder decodeObjectForKey:@"networkStatus"];
//        self.userIDClass = [aDecoder decodeObjectForKey:@"userIDClass"];
//        self.userID = [aDecoder decodeObjectForKey:@"userID"];
//        self.category = [aDecoder decodeObjectForKey:@"category"];
//        self.action = [aDecoder decodeObjectForKey:@"action"];
//        self.label = [aDecoder decodeObjectForKey:@"label"];
//        self.value = [aDecoder decodeIntegerForKey:@"value"];
//        self.mutArray = [aDecoder decodeObjectForKey:@"customArray"];
//runtime
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivarList[i];
            NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
            [self setValue:[aDecoder decodeObjectForKey:name] forKey:name];
        }
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}
- (NSString *)randomValue {
    if (_randomValue == nil) {
        int value = (int)((arc4random() % 2147483647));
        _randomValue = [NSString stringWithFormat:@"%d",value];
    }
    return _randomValue;
}

- (NSString *)timesTampEvent {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] * 1000;
    NSInteger times = interval;
    NSString *str = [NSString stringWithFormat:@"%ld",(long)times];
    return str;
}

- (NSString *)networkStatus {
    if (_networkStatus == nil) {
        _networkStatus = @"1";
    }
    return _networkStatus;
}

- (NSString *)userID {
    if (_userID == nil) {
        _userID = @"";
    }
    return _userID;
}

- (NSString *)userIDClass {
    if (_userIDClass == nil) {
        _userIDClass = @"";
    }
    return _userIDClass;
}

- (NSString *)category {
    if (_category == nil) {
        _category = @"";
    }
    return _category;
}

- (NSString *)action {
    if (_action == nil) {
        _action = @"";
    }
    return _action;
}

- (NSString *)label {
    if (_label == nil) {
        _label = @"";
    }
    return _label;
}

- (NSMutableArray *)mutArray {
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray array];
    }
    return _mutArray;
}


@end
