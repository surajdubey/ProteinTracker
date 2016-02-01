//
//  HistoryViewController.h
//  ProteinTracker
//
//  Created by ServesyOfficial on 01/02/16.
//  Copyright © 2016 servesy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController {
    NSMutableArray *history;
}

@property (strong, nonatomic) IBOutlet UILabel *historyLabel;

-(void) setHistory:(NSMutableArray *)h;

@end
