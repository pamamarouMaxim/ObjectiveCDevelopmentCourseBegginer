//
//  CBStudents.m
//  CBBitwiseOperationHomework
//
//  Created by Alina on 03.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBStudents.h"

@implementation CBStudents


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSString*) description {
    return [NSString stringWithFormat:
           @"\n%@ \n"
            "I %@ biology \n"
            "I %@ math \n"
            "I %@ anatomy \n"
            "I %@ engineering \n"
            "I %@ art \n"
            "I %@ phycology \n"
            "I %@ development \n",
            [self name],
            [self answerByType:CBStudentsSubjectsForStudyBiology],
            [self answerByType:CBStudentsSubjectsForStudyMath],
            [self answerByType:CBStudentsSubjectsForStudyAnatomy],
            [self answerByType:CBStudentsSubjectsForStudyEngineering],
            [self answerByType:CBStudentsSubjectsForStudyArt],
            [self answerByType:CBStudentsSubjectsForStudyPhycology],
            [self answerByType:CBStudentsSubjectsForStudyDevelopment]];
}


-(NSString*) answerByType: (CBStudentsSubjectsForStudy) type {
    return self.subjectType & type ? @"study" : @"don't study";
}

@end
