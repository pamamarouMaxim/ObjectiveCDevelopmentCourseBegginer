//
//  CBGovernmant.m
//  CBNotification
//
//  Created by Alina on 16.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBGovernmant.h"

NSString* const CBGovernmentTaxLevelDidChangeNotification =
                @"CBGovernmentTaxLevelDidChangeNotification";
NSString* const CBGovernmentPensionLevelDidChangeNotification=
                @"CBGovernmentPensionLevelDidChangeNotification";
NSString* const CBGovernmentSalaryDoctorLevelDidChangeNotification=
                @"CBGovernmentSalaryDoctorLevelDidChangeNotification";
NSString* const CBGovernmentProductNameLevelDidChangeNotification=
                @"CBGovernmentProductNameLevelDidChangeNotification";

NSString* const CBGovernmentTaxLevelDidChangeUserInfoKey=
                @"CBGovernmentTaxLevelDidChangeUserInfoKey";
NSString* const CBGovernmentPensionLevelDidChangeUserInfoKey=
                @"CBGovernmentPensionLevelDidChangeUserInfoKey";
NSString* const CBGovernmentSalaryDoctorLevelDidChangeUserInfoKey=
                @"CBGovernmentSalaryDoctorLevelDidChangeUserInfoKey";
NSString* const CBGovernmentProductNameLevelDidChangeUserInfoKey=
                @"CBGovernmentProductNameLevelDidChangeUserInfoKey";


@implementation CBGovernmant

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tax = 20.f;
        self.salaryDoctor = 300.f;
        self.pension = 150.f;
        self.productPrice = 10;
        
    }
    return self;
}



-(void) setTax:(float)tax {
    _tax=tax;
    
     NSDictionary* dictionary = [NSDictionary dictionaryWithObjects: [NSNumber numberWithFloat:tax] forKeys: CBGovernmentTaxLevelDidChangeUserInfoKey];
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:CBGovernmentTaxLevelDidChangeNotification object:nil userInfo:dictionary];
    
}
















@end
