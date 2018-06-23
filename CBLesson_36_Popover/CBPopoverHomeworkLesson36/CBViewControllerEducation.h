//
//  CBViewControllerEducation.h
//  CBPopoverHomeworkLesson36
//
//  Created by Alina on 03.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APEducationViewControllerDelegate;

@interface CBViewControllerEducation : UIViewController
                                      <UITableViewDelegate,UITableViewDataSource>
- (IBAction)actionFixedEducation:(UIButton *)sender;

@property (weak, nonatomic) id<APEducationViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableOfChoiseEducation;
@property (strong,nonatomic) NSArray* arrayOfEducation;
@property (strong,nonatomic) NSString* levelOfEducation;




@end

@protocol APEducationViewControllerDelegate <NSObject>

-(void)dataFromEducationPickerController:(NSString*)educationString;

@end
