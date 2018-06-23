//
//  ViewController.h
//  CBUItextFieldHomeworkLesson27_28
//
//  Created by Alina on 14.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *transitionToNextTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

- (IBAction)checkInButton:(UIButton *)sender;

@end

