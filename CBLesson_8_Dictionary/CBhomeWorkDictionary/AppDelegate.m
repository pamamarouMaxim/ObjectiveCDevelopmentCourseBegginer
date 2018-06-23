//
//  AppDelegate.m
//  CBhomeWorkDictionary
//
//  Created by Alina on 07.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "AppDelegate.h"
#import "CBStudents.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
     CBStudents* student1 = [[CBStudents alloc]init];
     CBStudents* student2 = [[CBStudents alloc]init];
     CBStudents* student3 = [[CBStudents alloc]init];
     CBStudents* student4 = [[CBStudents alloc]init];
     CBStudents* student5 = [[CBStudents alloc]init];
    
    student1.name= @"student1 name ";
    student1.soName= @"student1 soname";
    
    student2.name= @"student2 name ";
    student2.soName= @"student2 soname";
    
    student3.name= @"student3 name ";
    student3.soName= @"student3 soname";
    
    student4.name= @"student4 name ";
    student4.soName= @"student4 soname";
    
    student5.name= @"student5 name ";
    student5.soName= @"student5 soname";
    
  
    
    
    
    NSString* nameSoName1 = ([[student1 name] stringByAppendingString:[student1 soName]]);
    NSString* nameSoName2 = ([[student2 name] stringByAppendingString:[student2 soName]]);
    NSString* nameSoName3 = ([[student3 name] stringByAppendingString:[student3 soName]]);
    NSString* nameSoName4 = ([[student4 name] stringByAppendingString:[student4 soName]]);
    NSString* nameSoName5 = ([[student5 name] stringByAppendingString:[student5 soName]]);
   
    
    
    NSDictionary* students = [[NSDictionary alloc] initWithObjectsAndKeys:
                              student1,nameSoName1,
                              student2,nameSoName2,
                              student3,nameSoName3,
                              student4,nameSoName4,
                              student5,nameSoName5,nil];
    //NSLog(@"%@", students.description);
    for (NSString* key in [students allKeys]){
        CBStudents* student = [students objectForKey:key];
        NSLog(@"%@ hi %@",key,[student sayHello] );
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
