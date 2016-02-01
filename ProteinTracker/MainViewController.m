//
//  ViewController.m
//  ProteinTracker
//
//  Created by ServesyOfficial on 01/02/16.
//  Copyright © 2016 servesy. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if(self) {
        amountHistory = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    int goal = [[NSUserDefaults standardUserDefaults] integerForKey:@"goal"];
    self.goalLabel.text = [NSString stringWithFormat:@"%d", goal];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(goalChanged:) name:NSUserDefaultsDidChangeNotification object:nil];
}

-(void)goalChanged:(NSNotification *)notification {
    NSUserDefaults *defaults = (NSUserDefaults *)[notification object];
    int goal = [defaults integerForKey:@"goal"];
    self.goalLabel.text = [NSString stringWithFormat:@"%d", goal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButton:(id)sender {
    //get text from Amount TextField
    NSString *amountText = self.amountTF.text;
    if([amountText isEqualToString:@""])
    {
        NSLog(@"Please Enter Some Text");
    }
    else
    {
        if([self isStringNumeric:amountText])
        {
            NSLog(@"This is proper number");
            self.totalAmount = self.totalAmount + amountText.intValue;
            
            //update the label
            self.totalLabel.text = [NSString stringWithFormat:@"%d", self.totalAmount];
            
            if(self.totalAmount> self.goalLabel.text.intValue) {
                NSLog(@"You reached your goal");
            }
            
            //clear input
            self.amountTF.text = @"";
            
            [amountHistory addObject:[NSNumber numberWithInt:amountText.intValue]];
        }
        else {
            NSLog(@"This is not number");
        }
        
    }
    
}

-(BOOL) isStringNumeric: (NSString *) str {
    //initialize formatter
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:str];
    
    if(number == nil) {
        return NO;
    }
    else {
        return YES;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

-(void)unwindToMain:(UIStoryboardSegue *)segue {

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showHistory"])
    {
        NSLog([NSString stringWithFormat:@"%d", [amountHistory count]]);
        HistoryViewController *controller = (HistoryViewController *)segue.destinationViewController;
        
        [controller setHistory:amountHistory];
    }
}
@end
