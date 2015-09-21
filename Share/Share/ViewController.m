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
@property NSInteger userHours;
@property NSDate *pickerDate;
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
    NSLog(@"system time is: %ld%@%ld", self.sysHour, @":", self.sysMinute);
    self.userHours = 0;


    
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
}

- (IBAction)saveButton:(id)sender {
    self.userHours = [self.noOfHours.text intValue];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate: [self.TimeSelector date]];
    self.alarmHour = [components hour];
    self.alarmMinute = [components minute];
    self.pickerDate =[self.TimeSelector date];
    NSLog(@"chosenTime: %ld%s%ld", self.alarmHour, ":", self.alarmMinute);
    if((self.alarmHour *60 + self.alarmMinute)==(self.sysHour*60 + self.sysMinute)|| ((self.sysHour+self.userHours)%24>(self.alarmHour*60 + self.alarmMinute)))
    {
        NSLog(@"it's time to wake up");
    }
}

- (void)scheduleNotificationForDate:(NSDate*)pickerDate
{
    // Here we cancel all previously scheduled notifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = self.pickerDate;
    NSLog(@"Notification will be shown on: %@",localNotification.fireDate);
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = [NSString stringWithFormat:@"Your notification message"];
    localNotification.alertAction = NSLocalizedString(@"View details", nil);
    
    /* Here we set notification sound and badge on the app's icon "-1"
     means that number indicator on the badge will be decreased by one
     - so there will be no badge on the icon */
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = -1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
