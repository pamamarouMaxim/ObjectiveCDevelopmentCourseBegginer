//
//  CBStudents.h
//  CBMultithreadHomework
//
//  Created by Alina on 29.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBStudents : NSObject

@property(strong,nonatomic) NSString* name;
@property(assign,nonatomic) double  finishTime;

-(void) guessNumber:(NSInteger*) number  guessRange: (NSMutableArray*) range;

-(void) guessNumberSt:(NSInteger*) number  guessRangeSt: (NSMutableArray*) range getBlockSt:(void(^)(void)) block;


@end
