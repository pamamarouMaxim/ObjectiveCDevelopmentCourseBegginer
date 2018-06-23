//
//  CBTableViewController.m
//  CBPopoverHomeworkLesson36
//
//  Created by Alina on 02.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBTableViewController.h"
#import "CBViewControllerEducation.h"
#import "CBViewControllerDateOfBirth.h"

@interface CBTableViewController ()

@property(strong,nonatomic) UIPopoverPresentationController* popover;

@end

@implementation CBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark  UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:self.textfieldFirstName]) {
        [self.textfieldLastName becomeFirstResponder];
    }
    else [self.textfieldLastName resignFirstResponder];
    
    return YES;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    
    return YES;
}


- (void)choiseDateOfBirth:(UITextField *)sender {
    
    [sender resignFirstResponder];
    
    CBViewControllerDateOfBirth* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CBViewControllerDateOfBirth"];
    controller.delegate = self;
    controller.modalPresentationStyle = UIModalPresentationPopover;
    
    [self presentViewController:controller animated:YES completion:nil];
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
   
    popController.sourceView = sender;
    popController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    popController.sourceView = sender;
    popController.sourceRect = CGRectMake(0,0,0,0);
    self.popover = popController;
    self.popover.delegate = self;

}


- (void)choiseEducation:(UITextField *)sender {
    
    [sender resignFirstResponder];
    
    CBViewControllerEducation* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CBViewControllerEducation"];
    
    
    controller.modalPresentationStyle = UIModalPresentationPopover;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.sourceView = sender;
    popController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    popController.sourceView = sender;
    popController.sourceRect = CGRectMake(0,0,0,0);
    self.popover = popController;
    self.popover.delegate = self; // also done in storyboard
    
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.textfieldEducation]) {
        
        [self choiseEducation:textField];
        
        return NO;
    }
    else if ([textField isEqual:self.textfieldDateOfBirth]) {
        
        [self choiseDateOfBirth:textField];
        
        return NO;
    }

     return YES;
    
}

-(void) currentDateOfBirthForTextfield:(NSString*) currentDateOfBirth{
    
    self.textfieldDateOfBirth.text = currentDateOfBirth;
    
}


-(void)dataFromEducationPickerController:(NSString*)educationString{
    
    self.textfieldEducation.text = educationString;
    
}

-(void)dealloc{
    NSLog(@"APTableViewController.h dealloc");
}
@end
