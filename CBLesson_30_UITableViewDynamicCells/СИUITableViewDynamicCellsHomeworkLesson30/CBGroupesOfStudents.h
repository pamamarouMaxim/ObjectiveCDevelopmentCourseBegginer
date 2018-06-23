//
//  CBGroupesOfStudents.h
//  СИUITableViewDynamicCellsHomeworkLesson30
//
//  Created by Alina on 20.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBGroupesOfStudents : NSObject

@property (strong,nonatomic) NSString* nameOfGroup;

@property (strong,nonatomic) NSArray* arrayGroupOfStudents;

+(CBGroupesOfStudents*) createGroupesOfStudents;

@end
