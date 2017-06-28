//
//  XDArchivieByDelegate.m
//  XDArchiving
//
//  Created by winter on 2017/6/28.
//  Copyright © 2017年 winter. All rights reserved.
//

#import "XDArchivieByDelegate.h"


@interface XDArchivieByDelegate()<NSKeyedUnarchiverDelegate>
@property (nonatomic, strong) NSKeyedUnarchiver *unarchiver;

@end
@implementation XDArchivieByDelegate

+ (instancetype)singleton {
    static XDArchivieByDelegate *archive = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        archive = [[XDArchivieByDelegate alloc]init];
        
    });
    return archive;
}

- (void)startWithUrlString:(NSString *)string {
    NSData *data = [NSData dataWithContentsOfFile:string];
    self.unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    self.unarchiver.delegate = self;
    NSArray * arr = [self.unarchiver decodeObjectForKey:@"root"];
    for (XDEvent *event in arr) {
        NSLog(@"singleton:%@",event.category);
    }
}

- (Class)unarchiver:(NSKeyedUnarchiver *)unarchiver cannotDecodeObjectOfClassName:(NSString *)name originalClasses:(NSArray<NSString *> *)classNames {
    NSLog(@"%@",classNames);
    NSLog(@"%@",name);
    return [XDEvent class];
}

@end
