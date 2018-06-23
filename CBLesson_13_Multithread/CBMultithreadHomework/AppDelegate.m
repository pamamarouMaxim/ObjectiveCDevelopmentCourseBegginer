//
//  AppDelegate.m
//  CBMultithreadHomework
//
//  Created by Alina on 29.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "AppDelegate.h"
#import "CBStudents.h"

@interface AppDelegate ()

@property(strong,nonatomic) NSMutableArray* range;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.range = [[NSMutableArray alloc]init];
   
    CBStudents* student1 = [[CBStudents alloc]init];
    CBStudents* student2 = [[CBStudents alloc]init];
    CBStudents* student3 = [[CBStudents alloc]init];
    CBStudents* student4 = [[CBStudents alloc]init];
    CBStudents* student5 = [[CBStudents alloc]init];
    
    student1.name = @"student1";
    student2.name = @"student2";
    student3.name = @"student3";
    student4.name = @"student4";
    student5.name = @"student5";

    
    NSInteger number = arc4random()%2 + 5;

    for ( int i=(long)number-3; i < (long)number+3; i++) {
        [self.range addObject:[NSNumber numberWithInteger:i]];
    }
        //         LEVEL STUDY
    NSArray* students = [NSArray arrayWithObjects:student1,student2,student3,student4,student5, nil];
  /*
    for (CBStudents* student in students) {
        [student guessNumber:(long)number guessRange:_range];
    }
    */
    //                                 LEVEL STUDENT
    
    
    for (CBStudents* student in students) {
        
        [student guessNumberSt:(long)number guessRangeSt:_range getBlockSt:^{
          dispatch_async(dispatch_get_main_queue(), ^{
              NSLog(@"%@ is finished at %f time ",student.name,student.finishTime);
          });
        }];
    }

    
    
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
