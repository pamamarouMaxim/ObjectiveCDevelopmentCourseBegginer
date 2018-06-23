//
//  CBViewControllerDateOfBirth.h
//  CBPopoverHomeworkLesson36
//
//  Created by Alina on 03.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBViewControllerDateOfBirthDelegate;


@interface CBViewControllerDateOfBirth : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *currentDateOfBirth;

@property(weak,nonatomic) id <CBViewControllerDateOfBirthDelegate> delegate;

- (IBAction)actionFixedDateOfBirth:(UIButton *)sender;



@end



@protocol CBViewControllerDateOfBirthDelegate 

@required

-(void) currentDateOfBirthForTextfield:(NSString*) currentDateOfBirth;

@end
