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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
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
            
            //clear input
            self.amountTF.text = @"";
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
@end
