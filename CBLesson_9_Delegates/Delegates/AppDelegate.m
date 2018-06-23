//
//  AppDelegate.m
//  Delegates
//
//  Created by Alina on 12.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "AppDelegate.h"
#import "CBPatient.h"
#import "CBDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
      CBPatient*patient1 = [[CBPatient alloc]init];
      CBPatient*patient2 = [[CBPatient alloc]init];
      CBPatient*patient3 = [[CBPatient alloc]init];
      CBPatient*patient4 = [[CBPatient alloc]init];
    
    CBDoctor* doctor= [[CBDoctor alloc]init];
    
    
    
    patient1.name = @"patient 1";
    patient2.name = @"patient 2";
    patient3.name = @"patient 3";
    patient4.name = @"patient 4";
    
    CGFloat min= 36.6f;
    CGFloat max = 41.f;
    
    CGFloat temperatureOfPatient1 = (((float)arc4random()/0x100000000)*(max-min)+min);
    CGFloat temperatureOfPatient2 = (((float)arc4random()/0x100000000)*(max-min)+min);
    CGFloat temperatureOfPatient3 = (((float)arc4random()/0x100000000)*(max-min)+min);
    CGFloat temperatureOfPatient4 = (((float)arc4random()/0x100000000)*(max-min)+min);
    
    NSNumber* temperatureOfPatient1Object =
    [NSNumber numberWithFloat:temperatureOfPatient1];
    
    NSNumber* temperatureOfPatient2Object  =
    [NSNumber numberWithFloat:temperatureOfPatient2];
    
    NSNumber* temperatureOfPatient3Object  =
    [NSNumber numberWithFloat:temperatureOfPatient3];
    
    NSNumber* temperatureOfPatient4Object  =
    [NSNumber numberWithFloat:temperatureOfPatient4];
    
    patient1.temperature = temperatureOfPatient1;
    patient2.temperature = temperatureOfPatient2;
    patient3.temperature = temperatureOfPatient3;
    patient4.temperature = temperatureOfPatient4;
    
    patient1.headPain = arc4random() % 2 ;
    patient2.headPain = arc4random() % 2 ;
    patient3.headPain = arc4random() % 2 ;
    patient4.headPain = arc4random() % 2 ;
    
   
    NSArray* temperature = [NSArray arrayWithObjects:
                            temperatureOfPatient1Object,
                            temperatureOfPatient2Object,
                            temperatureOfPatient3Object,
                            temperatureOfPatient4Object,nil];
    for (id obj in temperature){
        NSLog(@"%@",obj);}
    
    NSLog(@"%@", temperature);
    
    NSArray* patient = [NSArray arrayWithObjects:patient1,patient2,patient3,patient4,nil];
    
    


    patient1.delegate= doctor;
    patient2.delegate= doctor;
    patient3.delegate= doctor;
    patient4.delegate= doctor;
    
    
    

    
    
    
    
    
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
