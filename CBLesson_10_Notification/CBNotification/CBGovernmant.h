//
//  CBGovernmant.h
//  CBNotification
//
//  Created by Alina on 16.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const CBGovernmentTaxLevelDidChangeNotification;
extern NSString* const CBGovernmentPensionLevelDidChangeNotification;
extern NSString* const CBGovernmentSalaryDoctorLevelDidChangeNotification;
extern NSString* const CBGovernmentProductNameLevelDidChangeNotification;

extern NSString* const CBGovernmentTaxLevelDidChangeUserInfoKey;
extern NSString* const CBGovernmentPensionLevelDidChangeUserInfoKey;
extern NSString* const CBGovernmentSalaryDoctorLevelDidChangeUserInfoKey;
extern NSString* const CBGovernmentProductNameLevelDidChangeUserInfoKey;



@interface CBGovernmant : NSObject

@property (assign,nonatomic) float tax;
@property (assign,nonatomic) float pension;
@property (assign,nonatomic) float salaryDoctor;
@property (assign,nonatomic) float productPrice;


@end
