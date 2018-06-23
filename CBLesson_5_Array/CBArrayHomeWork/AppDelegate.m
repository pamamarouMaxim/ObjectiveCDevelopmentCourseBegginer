//
//  AppDelegate.m
//  CBArrayHomeWork
//
//  Created by Alina on 23.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "AppDelegate.h"
#import "CBPeople.h"
#import "CBAnimals.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CBPeople* man1 =[[CBPeople alloc]init];
    CBPeople* man2 =[[CBPeople alloc]init];
    CBPeople* man3 =[[CBPeople alloc]init];
    CBPeople* man4 =[[CBPeople alloc]init];
    
    man1.name = @"Wlad";
    man2.name = @"Maxim";
    man3.name = @"Zuma";
    man4.name = @"Alina";
    
    man1.soName = @"Sudas";
    man2.soName = @"Sudas";
    man3.soName = @"Zomanov";
    man4.soName = @"Zomanov";
    
    man1.age= 14;
    man2.age = 14;
    man3.age = 17;
    [man4 setAge: 17];
    
   
    
    
    
    
    
    //                   Created array PEOPLE
    
    
    NSArray* people = [NSArray arrayWithObjects:man1,man2,man3,man4,nil ];
    /*
     
     //                       SORTED People NAME
     
    NSArray * sortedPeople = [people sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [[(CBPeople*)obj1 name] compare: [(CBPeople*)obj2 name]];
                }];
    
    NSArray* sortedPeople2 = [sortedPeople sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [[(CBPeople*)obj1 soName] compare:[(CBPeople*)obj2 soName]];
    }];
    */
    
    //                          SORTED PEOPLE ( NAME AND SONAME  )
    /*
     NSArray* sortedNameSoname = [people sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
         if ([(CBPeople*)obj1 soName] == [(CBPeople*)obj2 soName]){
             return [[(CBPeople*)obj1 name] compare: [(CBPeople*)obj2 name]];
         }
         else
             return [[(CBPeople*)obj1 soName] compare: [(CBPeople*)obj2 soName]];
    
             
                                  }];
    for (CBPeople* anyPeople in sortedNameSoname) {
        NSLog(@"name =%@  soName = %@",anyPeople.name,anyPeople.soName);
    }
    */
    
    /*           // SORTED NUMBERS INTEGER
    int a = 5;
    int b = 3;
    int c = 17;
    int d = 14;
    
    NSArray* number = [NSArray arrayWithObjects: [NSNumber numberWithInt:a],
                       [NSNumber numberWithInt:b],
                       [NSNumber numberWithInt:c],
                       [NSNumber numberWithInt:d],
                       nil ];
    
    NSArray* sortedNumber = [number sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [(NSNumber*)obj1 compare:(NSNumber*) obj2];
    }];
           NSLog(@"%@",sortedNumber);
    
    */
       //                  SORTED PEOPLE (NAME ,      AGE  )
    /*
    
    NSArray* sortedNameAge = [people sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([(CBPeople*)obj1 age] == [(CBPeople*)obj2 age]){
            return [[(CBPeople*)obj1 name] compare:[(CBPeople*)obj2 name]];
        }
        else return [[NSNumber numberWithInt:[(CBPeople*)obj1 age]] compare:[NSNumber numberWithInt:[(CBPeople*)obj2 age]]];
    }];
    
    for (CBPeople* anyPeople in sortedNameAge) {
        NSLog(@"name =%@  age = %d",anyPeople.name,anyPeople.age);
    }
    
    */

    
    
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
