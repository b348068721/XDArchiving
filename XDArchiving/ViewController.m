//
//  ViewController.m
//  XDArchiving
//
//  Created by winter on 2017/6/22.
//  Copyright © 2017年 winter. All rights reserved.
//

#import "ViewController.h"
#import "XDArchiving.h"
#import "XDEvent.h"
#import "XDArchivieByDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, assign) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.count = 0;
}
- (IBAction)storePressed:(id)sender {
    self.count++;
    NSString *str = [NSString stringWithFormat:@"%ld",self.count];
    [[XDArchiving singleton] saveEventWithRandomValue:str timesTampEvent:str networkStatus:str userIDClass:str userID:str category:str action:str label:str value:0 customParams:@[str]];
}
- (IBAction)readPressed:(id)sender {
    [[XDArchivieByDelegate singleton]startWithUrlString:[[XDArchiving singleton]filePath]];
    NSArray * arr = [[XDArchiving singleton]searchEvent];
    NSString *str = @"0";
    for (XDEvent * event in arr) {
        str = [NSString stringWithFormat:@"%@,%@",str,event.category];
    }
    self.textView.text = str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
