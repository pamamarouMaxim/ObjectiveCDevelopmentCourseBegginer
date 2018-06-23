//
//  CBStudents.h
//  CBBitwiseOperationHomework
//
//  Created by Alina on 03.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
   CBStudentsSubjectsForStudyBiology         = 1 << 0,
   CBStudentsSubjectsForStudyMath            = 1 << 1,
   CBStudentsSubjectsForStudyAnatomy         = 1 << 2,
   CBStudentsSubjectsForStudyEngineering     = 1 << 3,
   CBStudentsSubjectsForStudyArt             = 1 << 4,
   CBStudentsSubjectsForStudyPhycology       = 1 << 5,
   CBStudentsSubjectsForStudyDevelopment     = 1 << 6,
   
    
} CBStudentsSubjectsForStudy;

@interface CBStudents : NSObject

@property (assign,nonatomic) CBStudentsSubjectsForStudy subjectType;

@property(strong,nonatomic) NSString* name;


@end
