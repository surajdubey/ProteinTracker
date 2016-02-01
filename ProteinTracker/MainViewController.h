//
//  ViewController.h
//  ProteinTracker
//
//  Created by ServesyOfficial on 01/02/16.
//  Copyright © 2016 servesy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UILabel *goalLabel;

@property (strong, nonatomic) IBOutlet UITextField *amountTF;

- (IBAction)addButton:(id)sender;

-(IBAction)unwindToMain:(UIStoryboardSegue  *)segue;
@property int totalAmount;
@end

