//
//  CBViewControllerDateOfBirth.m
//  CBPopoverHomeworkLesson36
//
//  Created by Alina on 03.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBViewControllerDateOfBirth.h"

@interface CBViewControllerDateOfBirth ()

@end

@implementation CBViewControllerDateOfBirth

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.currentDateOfBirth setDate:[NSDate dateWithTimeIntervalSinceNow:0] animated: YES];
    
    
    self.currentDateOfBirth.datePickerMode = UIDatePickerModeDate;
    
    // Do any additional setup after loading the view.
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



- (IBAction)actionFixedDateOfBirth:(UIButton *)sender {

    NSDate * date = self.currentDateOfBirth.date;
    
    NSDateFormatter* dateformatter = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyy/MMM/dd"];
    
    NSString* dateOfBirth = [dateformatter stringFromDate:date];
    
    
    [self.delegate currentDateOfBirthForTextfield:dateOfBirth];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
