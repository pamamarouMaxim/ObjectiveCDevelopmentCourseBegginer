//
//  CBTableViewController.m
//  CBUITableViewStaticCallsHomeworkLesson29
//
//  Created by Alina on 18.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBTableViewController.h"

@interface CBTableViewController ()

@end

static NSString* kSattingLogin        = @"Login";
static NSString* kSattingPassword     = @"Password";
static NSString* kSattingLevel        = @"Level";
static NSString* kSattingShadow       = @"Shadow";
static NSString* kSattingDetalization = @"Detalization";
static NSString* kSattingSound        = @"Sound";
static NSString* kSattingMusic        = @"Music";

@implementation CBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.loginField.delegate = self;
    self.passwordField.delegate = self;
    [self loadSetting];
    
}

#pragma mark SaveAndLoad

-(void) saveSatting{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    [userDefaults setObject:self.loginField.text forKey:kSattingLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSattingPassword];
    [userDefaults setInteger:self.levelSecmentControl.selectedSegmentIndex forKey:kSattingLevel];
    
    [userDefaults setBool:self.shadowSwitch.isOn forKey:kSattingShadow];
    [userDefaults setInteger:self.detalizationSegmentControl.selectedSegmentIndex forKey:kSattingDetalization];
    [userDefaults setDouble:self.soundSlider.value forKey:kSattingSound];
    [userDefaults setDouble:self.musicSlider.value forKey:kSattingMusic ];
    
    [userDefaults synchronize];

}
-(void) loadSetting{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text =    [userDefaults objectForKey:kSattingLogin];
    self.passwordField.text = [userDefaults objectForKey:kSattingPassword];
    
    self.levelSecmentControl.selectedSegmentIndex = [userDefaults integerForKey:kSattingLevel];
    
    self.shadowSwitch.on = [userDefaults boolForKey:kSattingShadow];
     self.detalizationSegmentControl.selectedSegmentIndex = [userDefaults integerForKey:kSattingDetalization];
    
    self.soundSlider.value = [userDefaults doubleForKey:kSattingSound];
    self.musicSlider.value = [userDefaults doubleForKey:kSattingMusic];
    
    
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
   
    if ([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    }
    else [self.passwordField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)passwordLoginAction:(UITextField *)sender {
    [self saveSatting];
}

- (IBAction)valueChangeAction:(id)sender {
    
    [self saveSatting];
}
@end
