//
//  CBStudents.h
//  CBNSDateHomework
//
//  Created by Alina on 07.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBStudents : NSObject


@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSString* soName;
@property (strong,nonatomic) NSDate* dateOfBirth;


-(NSString*) studentsName ;

-(NSString*) studentsSoName;

-(NSDate*) createDateOfBirth;





@end
