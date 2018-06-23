//
//  AppDelegate.m
//  CBNSDateHomework
//
//  Created by Alina on 07.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "AppDelegate.h"
#import "CBStudents.h"

@interface AppDelegate ()

@property (strong,nonatomic) NSMutableArray* arrayOfStudentsBirth;
@property (strong,nonatomic) NSMutableDictionary* dictionaryOfStudents;
@property (strong,nonatomic) NSDate* date;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //                          STUDY AND STUDENT
    
    /*
    
    self.arrayOfStudentsBirth = [NSMutableArray array];
    
    self.dictionaryOfStudents = [NSMutableDictionary dictionary];
  
    [self arrayOfStudents:20];
    
    [self arrayCompare:_arrayOfStudentsBirth];
    
    for (CBStudents* student in _arrayOfStudentsBirth) {
        NSLog(@"%@",student);
    }
     
     */
    //                                     MASTER

    /*
    NSLog(@"%@",[self lastBirth:[_arrayOfStudentsBirth lastObject] firstBirth:[_arrayOfStudentsBirth firstObject]]);
    
    NSDate* date = [NSDate date];
    self.date = date;
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(happyBirthday:) userInfo:_dictionaryOfStudents repeats:YES];
    */
    //                                        SUPERMAN
   
    //SUPERMAN.13
    /*
    
    NSDateFormatter * dateFormtter = [[NSDateFormatter alloc]init];
    NSCalendar* calendar =[NSCalendar currentCalendar];

    for (int numberOfMonth = 1; numberOfMonth <= 12; numberOfMonth++) {
        [dateFormtter setDateFormat:@"yyyy/MM/dd HH:mm"];
        NSString* date = [NSString stringWithFormat:@"2017/%d/01 15:00",numberOfMonth];
        NSDate* todayDate = [dateFormtter dateFromString:date];
        [dateFormtter setDateFormat:@"yyyy/MM/dd EEEE"];
       NSDateComponents* components =[calendar components: NSCalendarUnitWeekday   fromDate:todayDate];
        NSLog(@"%@  weekday = %ld",[dateFormtter stringFromDate:todayDate],[components weekday]);
    }
    
    */
    //SUPERMAN.14
    /*
    NSCalendar* calendar =[NSCalendar currentCalendar];
    NSDateComponents* components = [[NSDateComponents alloc]init];
    NSDateFormatter * dateFormtter = [[NSDateFormatter alloc]init];
    [dateFormtter setDateStyle:NSDateFormatterFullStyle];

    [components setCalendar:calendar];
    [components setYear:2017];
    [components setWeekday:1];
    [components setWeekdayOrdinal:1];
    
    NSInteger countOfSunday = 1;
    
    NSDate* date = [calendar dateFromComponents:components];
   
    while ( [calendar component:NSCalendarUnitYear fromDate:date] == 2017) {
       NSLog(@"%@", [dateFormtter stringFromDate:date]);
       [components setWeekdayOrdinal:++countOfSunday];
        date = [calendar dateFromComponents:components];
        NSLog(@"%ld",countOfSunday);
        
    }
  
    
   */
    
      //SUPERMAN.15
    
    NSCalendar* calendar =[NSCalendar currentCalendar];
    NSDateComponents* components = [[NSDateComponents alloc]init];
    NSDateFormatter * dateFormtter = [[NSDateFormatter alloc]init];
    [dateFormtter setDateStyle:NSDateFormatterFullStyle];
    
    [components setCalendar:calendar];
    [components setYear:2017];
    [components setMonth:1];
    [components setDay:1];
    
    NSDate* date = [calendar dateFromComponents:components];

    
    /*                 сколько дней в месяце
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSUInteger numberOfDaysInMonth = range.length;
    NSLog(@"%ld",numberOfDaysInMonth);
    */
    
    for (int numberOfMonth = 1; numberOfMonth <= 12; numberOfMonth++) {
        int numberOfDay = 1;
        NSInteger weekDays = 0;
        [components setMonth:numberOfMonth];
        while ([calendar component:NSCalendarUnitMonth fromDate:date]==numberOfMonth) {
            NSDateComponents *dateComponents = [calendar components:NSCalendarUnitWeekday fromDate:date];
            [components setDay:++numberOfDay];
            date = [calendar dateFromComponents:components];
            if (!([calendar component:NSCalendarUnitMonth fromDate:date]==numberOfMonth)){
                break;
            }
            if (dateComponents.weekday ==7 |  dateComponents.weekday == 1) {
                weekDays = weekDays + 1;
            }
        }
    
        [dateFormtter setDateFormat:@"MMMM"];
        
        NSDateComponents* componentsForMonth = [[NSDateComponents alloc]init];
       
        [componentsForMonth setMonth:numberOfMonth];
         NSDate* dateOfMonth = [calendar dateFromComponents:componentsForMonth];
        
        

        NSInteger daysInMonth = numberOfDay - 1;
        NSLog(@"%ld days in %@. Work days is %ld",(long)daysInMonth,[dateFormtter stringFromDate:dateOfMonth],(daysInMonth-weekDays));
        
    }

    
    
  
    
    
    
    
    
 
    
    

   
    
    
    return YES;
}

-(void) happyBirthday:(NSTimer*) timerOfBirth {
    
    NSInteger secondsPerDay = 24*60*60;
    
    self.date = [self.date dateByAddingTimeInterval:+secondsPerDay];
    
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components =[calendar components: NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay  fromDate:self.date ];
   
    NSString* dateOfCalendar = [NSString stringWithFormat:@"%ld %ld",(NSInteger)[components month],(long)[components day]];
    NSLog(@"%@",dateOfCalendar);
    NSDateFormatter * dateFormtter = [[NSDateFormatter alloc]init];
    
    [dateFormtter setDateStyle:NSDateFormatterMediumStyle];
    
    if ( [_dictionaryOfStudents objectForKey:dateOfCalendar]){
       
        NSLog(@" \n""%@  HAPPY BIRTHDAY !!! %@",[dateFormtter stringFromDate:self.date],[_dictionaryOfStudents objectForKey:dateOfCalendar]);
    }
    
    
}

-(void) arrayOfStudents:(NSInteger) numberOfStudents{
    
    for (int  i = 0; i < numberOfStudents;  i ++) {
        CBStudents* students = [[CBStudents alloc]init];
        [_arrayOfStudentsBirth addObject:students];
        [self dictionaryOfStodents:students];
    }
}

-(void) dictionaryOfStodents:(CBStudents*) student  {
    NSString* space = @" ";
    NSString* nameAndSpace = [student.name stringByAppendingString:space];
    NSString* nameSoName = [nameAndSpace stringByAppendingString:student.soName];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components =[calendar components: NSCalendarUnitMonth |NSCalendarUnitDay  fromDate:student.dateOfBirth ];
    NSString* dateOfBirh = [NSString stringWithFormat:@"%ld %ld",(long)[components month],(long)[components day]];
    [_dictionaryOfStudents setObject:nameSoName forKey:dateOfBirh];
}

-(void) arrayCompare : (NSMutableArray*) array{
    [_arrayOfStudentsBirth sortUsingComparator:^NSComparisonResult(id obj1, id  obj2) {
        return [[obj2 dateOfBirth] compare:[obj1 dateOfBirth]];
    }];
}

-(NSString*) lastBirth:(CBStudents*) manLastBirth firstBirth:(CBStudents*) manFirstBirth{
    NSDate* firsBirth = manFirstBirth.dateOfBirth;
    NSDate* lastBirth = manLastBirth.dateOfBirth;

    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components =[calendar components:NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute fromDate:lastBirth toDate:firsBirth options:0];
    NSString* difference =[NSString stringWithFormat:@"the difference is growing %@ %@ and %@ %@ is %ld years %ld months %ld days %ld hours %ld minuts ",manLastBirth.name,manLastBirth.soName,manFirstBirth.name,manFirstBirth.soName,(long)[components year],(long)[components month],(long)[components day],(long)[components hour],(long)[components minute]];
    return difference;
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
