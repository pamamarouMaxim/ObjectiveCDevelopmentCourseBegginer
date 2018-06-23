//
//  CBSportsman.h
//  CBTableViewEditingPart2homeworlLesson2
//
//  Created by Alina on 23.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBSportsman : NSObject

@property (strong,nonatomic) NSString* firstName;
@property (strong,nonatomic) NSString* lastName;
@property (assign,nonatomic) NSInteger age;

+(CBSportsman*) createSportsmen;

@end
