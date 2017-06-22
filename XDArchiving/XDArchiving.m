//
//  Archiving.m
//
//  Created by winter on 16/7/21.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "XDArchiving.h"
#import "XDEvent.h"

@interface XDArchiving()
@property (nonatomic, strong) XDEvent *event;
@property (nonatomic, strong) NSMutableArray *paramasArray;
@end

@implementation XDArchiving

+ (instancetype)singleton {
    static XDArchiving *archive = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        archive = [[XDArchiving alloc]init];
    });
    return archive;
}

- (void)saveEventWithRandomValue:(NSString *)randomValue timesTampEvent:(NSString *)timesTampEvent networkStatus:(NSString *)networkStatus userIDClass:(NSString *)userIDClass userID:(NSString *)userID category:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSInteger)value customParams:(NSArray *)array {
    self.event = [[XDEvent alloc]init];
    self.event.randomValue = randomValue;
    self.event.timesTampEvent = timesTampEvent;
    self.event.networkStatus = networkStatus;
    self.event.userIDClass = userIDClass;
    self.event.userID = userID;
    self.event.category = category;
    self.event.action = action;
    self.event.label = label;
    self.event.value = value;
    self.event.mutArray = [NSMutableArray arrayWithArray:array];

    self.paramasArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    if (!self.paramasArray) {
        self.paramasArray = [NSMutableArray arrayWithObject:self.event];
    }
    else {
        [self.paramasArray addObject:self.event];
    }
    [NSKeyedArchiver archiveRootObject:self.paramasArray toFile:[self filePath]];

}

- (NSArray *)searchEvent {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
}

- (void)removeEvent:(NSArray *)array withlimitCount:(NSInteger)count{
    self.paramasArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    if (array.count < count) {
        [self.paramasArray removeAllObjects];
    }
    else {
        NSRange range = NSMakeRange(0, count);
        [self.paramasArray removeObjectsInRange:range];
    }
    [NSKeyedArchiver archiveRootObject:self.paramasArray toFile:[self filePath]];
}

- (void)removeCustomEvent:(NSArray *)array {
    self.paramasArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    for (XDEvent *ev in array) {
        if ([self.paramasArray containsObject:ev]) {
            [self.paramasArray removeObject:ev];
        }
    }
    [NSKeyedArchiver archiveRootObject:self.paramasArray toFile:[self filePath]];
}

- (NSString *)filePath
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *path = [docPath stringByAppendingPathComponent:@"ArchivingDemo"];
    return path;
}

@end
