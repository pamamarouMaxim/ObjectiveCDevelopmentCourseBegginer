//
//  CBStudents.h
//  CBhomeWorkDictionary
//
//  Created by Alina on 07.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBStudents : NSObject

@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSString* soName;
@property (assign,nonatomic) NSInteger age;

-(NSString*) sayHello;



@end
