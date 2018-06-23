//
//  CBStudents.h
//  СИUITableViewDynamicCellsHomeworkLesson30
//
//  Created by Alina on 19.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBStudents : NSObject

@property (strong,nonatomic) NSString* firstName;
@property (strong,nonatomic) NSString* lastName;
@property (assign,nonatomic) NSInteger averageScore;
@property (assign,nonatomic) NSInteger numberOfGroup;

+ (CBStudents*) randomStudent;




@end
