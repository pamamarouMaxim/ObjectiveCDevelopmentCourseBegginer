//
//  CBGroup.h
//  CBTableViewEditingPart2homeworlLesson2
//
//  Created by Alina on 23.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBGroup : NSObject

@property (strong,nonatomic) NSString* nameOfGroup;
@property (strong,nonatomic) NSArray* arrayOfSportsmen;

+(CBGroup*) createGroup;

@end
