//
//  AppDelegate.m
//  CBBitwiseOperationHomework
//
//  Created by Alina on 03.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "AppDelegate.h"
#import "CBStudents.h"

@interface AppDelegate ()

@property (strong,nonatomic) NSMutableArray* arrayOfStudents;
@property (strong,nonatomic) NSMutableArray* arrayHumanitiesAndTechies;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    self.arrayOfStudents = [NSMutableArray array];
    self.arrayHumanitiesAndTechies = [NSMutableArray array];


    CBStudents* student = [[CBStudents alloc]init];
    
    [_arrayOfStudents addObject:student];
    
    int studyDevelopment = 0;
    
    
    for (int createStudent = 1; createStudent < 10 ; createStudent ++){
        student.subjectType =  student.subjectType & 0;
        student.name = [NSString stringWithFormat:@"student # %d",createStudent];
        for (CBStudents* students in _arrayOfStudents) {
            for (int i = 0; i < 7; i ++) {
                if (arc4random()%2) {
                    student.subjectType = student.subjectType | 1<<i;
                }
            }
            //                        STUDENT
            if (student.subjectType & CBStudentsSubjectsForStudyDevelopment){
                studyDevelopment = studyDevelopment + 1;
            }
            
            if (student.subjectType & CBStudentsSubjectsForStudyMath &&
                student.subjectType & CBStudentsSubjectsForStudyEngineering &&
                student.subjectType & CBStudentsSubjectsForStudyDevelopment)
            {
                [_arrayHumanitiesAndTechies addObject:[NSString stringWithFormat:@"%@ is techies",student.name]];
            }
            else
                [_arrayHumanitiesAndTechies addObject:[NSString stringWithFormat:@"%@ is humanities",student.name]];
            
            
                        //                         MASTER
            if (student.subjectType & CBStudentsSubjectsForStudyBiology){
                student.subjectType = student.subjectType ^ CBStudentsSubjectsForStudyBiology;
                NSLog(@"\n"
                      "The teacher of biology is sick, have a rest.we will haven't the lesson");
            }
             NSLog(@"%@",student);
        }

    }
    NSLog(@"%d students study Development!",studyDevelopment);
    NSLog(@"%@",_arrayHumanitiesAndTechies);
    
    
   //                              SUPERMAN
    
    
    NSInteger supermanNumber = arc4random()%INT32_MAX;
    
    NSLog(@"%ld",(long)supermanNumber);
    
    NSMutableString* bitOfNumber = [[NSMutableString alloc]init];
    
    for (int numberOfBit = 31; numberOfBit >= 0 ; numberOfBit--) {
        
        NSInteger compareBit = 1 << numberOfBit;
        
        if (supermanNumber & compareBit) {
            [bitOfNumber appendString:@"1"];
        }
        else  [bitOfNumber appendString:@"0"];
    }
    NSLog(@"%@",bitOfNumber);
    
    NSInteger maxNumber = INT32_MAX;
    NSLog(@"%ld",(long)maxNumber);
    
    
    
    
 
    
    
    
    
    
    
    
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
