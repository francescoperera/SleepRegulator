//
//  ViewController.m
//  Share
//
//  Created by Claire Opila on 9/18/15.
//  Copyright © 2015 Claire Opila. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *noOfHours;
@property (assign, nonatomic) int hours;
@property (weak, nonatomic) IBOutlet UIDatePicker *TimeSelector;
@property (weak, nonatomic) IBOutlet UIDatePicker *MyDatePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    // Do any additional setup after loading the view, typically from a nib.
    [self.MyDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.TimeSelector = strDate;
    NSLog(@"strDate: %@", strDate);
}
- (IBAction)setTime:(id)sender {
    NSDate *chosen = [self.TimeSelector date];
    NSLog(@"time is: %@", chosen);
}

- (IBAction)saveButton:(id)sender {
    self.hours = [self.noOfHours.text intValue];
    NSLog(@"Hours is: %d", self.hours);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
