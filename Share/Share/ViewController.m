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
@property (weak, nonatomic) IBOutlet UIDatePicker *TimeSelector;
@property NSInteger alarmHour;
@property NSInteger alarmMinute;
@property NSInteger sysHour;
@property NSInteger sysMinute;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.TimeSelector addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate: [self.TimeSelector date]];
    self.sysHour = [components hour];
    self.sysMinute = [components minute];
    NSLog(@"system time is: %ld", self.sysHour);

    
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
}

- (IBAction)saveButton:(id)sender {
    int hours = [self.noOfHours.text intValue];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate: [self.TimeSelector date]];
    self.alarmHour = [components hour];
    self.alarmMinute = [components minute];
    NSLog(@"chosenTime: %ld", self.alarmHour);
    if((self.alarmHour *60 + self.alarmMinute)==(self.sysHour*60 + self.sysMinute)|| ((self.sysHour+hours)%24>(self.alarmHour*60 + self.alarmMinute)))
    {
        //generate local notifications
    }
    NSLog(@"Hours is: %d", hours);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
