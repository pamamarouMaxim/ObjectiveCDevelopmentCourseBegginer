//
//  CBStudents.h
//  CBUITableViewSearchHomeworkLesson35
//
//  Created by Alina on 28.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBStudents : NSObject

@property (strong,nonatomic) NSString* firstName;
@property (strong,nonatomic) NSString* lastName;
@property (strong,nonatomic) NSDate* dateOfBirth;


+ (NSMutableArray*) createStudentWithCount : (NSInteger) countOfStudents;

- (NSInteger) getBirthDayMonth;

@end
