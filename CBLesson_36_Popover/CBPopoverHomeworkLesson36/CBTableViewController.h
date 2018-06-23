//
//  CBTableViewController.h
//  CBPopoverHomeworkLesson36
//
//  Created by Alina on 02.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textfieldFirstName;

@property (weak, nonatomic) IBOutlet UITextField *textfieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textfieldEducation;
@property (weak, nonatomic) IBOutlet UITextField *textfieldDateOfBirth;



@end
