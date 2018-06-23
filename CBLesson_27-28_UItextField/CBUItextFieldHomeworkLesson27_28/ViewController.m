//
//  ViewController.m
//  CBUItextFieldHomeworkLesson27_28
//
//  Created by Alina on 14.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (UITextField* textFieldInCollection in self.transitionToNextTextField) {
        
        textFieldInCollection.delegate = self;
    }
    
    
}


#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    for (UITextField* textFieldInCollection in self.transitionToNextTextField) {
        
        if ([self.transitionToNextTextField count]-1 == [self.transitionToNextTextField indexOfObject:textFieldInCollection]) {
            [textField resignFirstResponder];
            
        } else {if ([textFieldInCollection isEqual:textField]) {
            [[self.transitionToNextTextField objectAtIndex:
              [self.transitionToNextTextField indexOfObject:textFieldInCollection]+1] becomeFirstResponder];
        }}
    }
    
    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([textField isEqual:self.phoneNumber]) {
        
        return [self textFieldPhoneNumer:textField shouldChangeCharactersInRange:range replacementString:string];
    }
   

    return YES;
}

#pragma mark Methods

-(BOOL) textFieldPhoneNumer:(UITextField *)textFieldPhoneNumer
    shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* components = [string componentsSeparatedByCharactersInSet:validationSet];
    NSLog(@"components %@", components);
    
    
    if ([components count] > 1) {
        return NO;
        
    }
    
    NSString* newString = [textFieldPhoneNumer.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@" newString %@",newString);
    
    NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    
     NSLog(@"validComponents %@", validComponents);
    
    
    newString = [validComponents componentsJoinedByString:@""];
    NSLog(@"newString %@", newString);
    
    static const int localNumberMaxLength = 7;
    static const int areaCodeMaxLength = 2;
    static const int countryCodeMaxLength = 3;
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength) {
        return NO;
    }
    
    NSMutableString* resultString = [NSMutableString string];
    
    NSInteger localNumberLength = MIN([newString length], localNumberMaxLength);
    
    if (localNumberLength > 0) {
        
        NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLength];
        
        [resultString appendString:number];

    }
    
    if ([newString length] > localNumberMaxLength) {
        
        NSInteger areaCodeLength = MIN((int)[newString length] - localNumberMaxLength, areaCodeMaxLength);
        
        NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLength - areaCodeLength, areaCodeLength);
        
        NSString* area = [newString substringWithRange:areaRange];
        
        area = [NSString stringWithFormat:@"(%@) ", area];
        
        [resultString insertString:area atIndex:0];
        
    }
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength) {
        
        NSInteger countryCodeLength = MIN((int)[newString length] - localNumberMaxLength - areaCodeMaxLength, countryCodeMaxLength);
        
        NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
        
        NSString* countryCode = [newString substringWithRange:countryCodeRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        
        [resultString insertString:countryCode atIndex:0];
        
    }
    
    NSLog(@"resultString %@",resultString);
    textFieldPhoneNumer.text = resultString;
    
    return NO;
    
}

#pragma mark Action 

- (IBAction)checkInButton:(UIButton *)sender {
    
    NSLog(@"%@",NSStringFromCGRect(sender.frame));
    
    UIImageView* imageView = [[UIImageView alloc] init];
    
    UIImage* registrationCompletedImage = [UIImage imageNamed:@"image.jpg"];
    
    imageView.image = registrationCompletedImage;
    
    
    imageView.frame= CGRectMake(sender.superview.frame.origin.x+sender.frame.origin.x,
                                sender.superview.frame.origin.y+sender.frame.origin.y,
                                CGRectGetWidth(sender.bounds),
                                CGRectGetHeight(sender.bounds));
    
    NSLog(@"%@",NSStringFromCGRect(imageView.frame));
    
    imageView.alpha = 0;
    
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear   animations:^{
        imageView.alpha = 1;
    } completion:^(BOOL finished) {
    
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
