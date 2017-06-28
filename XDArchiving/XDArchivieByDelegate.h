//
//  XDArchivieByDelegate.h
//  XDArchiving
//
//  Created by winter on 2017/6/28.
//  Copyright © 2017年 winter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XDEvent.h"

@interface XDArchivieByDelegate : NSObject
+ (instancetype)singleton;

- (void)startWithUrlString:(NSString *)string;
@end
