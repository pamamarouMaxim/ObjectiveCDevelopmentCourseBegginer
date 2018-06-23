//
//  CBTableViewController.h
//  CBUITableViewStaticCallsHomeworkLesson29
//
//  Created by Alina on 18.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *levelSecmentControl;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;
@property (weak, nonatomic) IBOutlet UISwitch *shadowSwitch;
@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detalizationSegmentControl;

- (IBAction)passwordLoginAction:(UITextField *)sender;
- (IBAction)valueChangeAction:(id)sender;

@end
