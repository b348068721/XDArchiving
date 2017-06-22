//
//  Archiving.h
//
//  Created by winter on 16/7/21.
//  Copyright © 2016年 winter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDArchiving : NSObject

+ (instancetype)singleton;

- (void)saveEventWithRandomValue:(NSString *)randomValue timesTampEvent:(NSString *)timesTampEvent networkStatus:(NSString *)networkStatus userIDClass:(NSString *)userIDClass userID:(NSString *)userID category:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSInteger)value customParams:(NSArray *)array;

- (NSArray *)searchEvent;

- (void)removeEvent:(NSArray *)array withlimitCount:(NSInteger)count;

- (void)removeCustomEvent:(NSArray *)array;
@end
