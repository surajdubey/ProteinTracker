//
//  HistoryViewController.m
//  ProteinTracker
//
//  Created by ServesyOfficial on 01/02/16.
//  Copyright © 2016 servesy. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableString *historyString = [[NSMutableString alloc] init];
    
    NSLog(@"View Loaded");
    for(NSNumber *number in history)
    {
        NSLog([number stringValue]);
        [historyString appendFormat:@"%@\n", number];
    }
    
    self.historyLabel.text = historyString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setHistory:(NSMutableArray *)h {
    //assign result from previous page
    history = h;
    
}
@end
