//
//  AppDelegate.m
//  CBNSStringHomeWork
//
//  Created by Alina on 31.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong,nonatomic) NSMutableArray* mutableArray;
@property (strong,nonatomic) NSMutableArray* mutableArrayForMaster;
@property (strong,nonatomic) NSMutableArray* mutableArrayForMasterNew;
@property (strong,nonatomic) NSMutableArray* mutableArrayForMasterFinish;



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //                               TASK 1
    
    
    NSString* name = @"Maxim";
    NSString* soName = @"Panamarou";
    
    //  ЗАСУНУЛИ СТРОКИ В МАССИВ И ВЫВОД ИХ НА ЭКРАН
    
    NSArray* array = [NSArray arrayWithObjects:name,soName,nil];
    for (NSString* string in array){
        NSLog(@"%@",string);
    }
    
    // ЕСЛИ СТРОКА СОДЕРЖИТ ЗАПИСЬ "Maxim" ТО ВЫВЕДИ ИНДЕКС ЭТОЙ СТРОКИ
    
    for (NSString* string in array) {
        if ([string isEqualToString:@"Maxim"]){
            NSLog(@"%lu",(unsigned long)[array indexOfObject:string]);
            NSLog(@"%@",[array objectAtIndex:[array indexOfObject:string]]);
        }
    }
    
    //                               TASK 2
    
    // ПОИСК СЛОВА В СТРОКЕ И ВЫВОД ЕГО ЛОКАЦИИ И ДЛИНЫ
    
    NSRange range  = [name rangeOfString:@"Maxim"];
    NSLog(@"range =%@",NSStringFromRange(range));
    
    // ПОИСК СЛОВ В СТРОКЕ ДАЖЕ ЕСЛИ ОНИ НАПИСАНЫ С БОЛЬШОЙ ИЛИ МАЛЕНЬКОЙ БУКВЫ+
    // ВЫВОД ЕЕ ЛОКАЦИИ И ДЛИНЫ
    
    NSRange range1 = [name rangeOfString:@"maxim" options:NSCaseInsensitiveSearch];
    NSLog(@"range =%@",NSStringFromRange(range1));
    
    
    //                                 TASK 3
    
    // ЕСЛИ СУЩЕСТВУЕТ RANGE.LOCATION РАСПЕЧАТАЙ ЛОКАЦИЮ И ДЛИНУ ИЛИ РАСПЕЧАТАЙ ЧТО ТАКОГО СЛОВА НЕ НАЙДЕНО
    
    
    NSRange range3  = [name rangeOfString:@"Vlad"];
    
    if (range3.location != NSNotFound){
        NSLog(@"range =%@",NSStringFromRange(range));
    }
    else (NSLog(@"range not found"));
    
    //                               TASK 4
    
    NSString* myHistory = @"My name is Maxim.I like my name.I have a great name in the world.Maxim is protector if transleate from greece languarige.Maxim Panamarou.";
    
    
    // ПОИСК СЛОВА МАКИМ В СТРОКЕ myHistory И ВЫВОД ЕГО ЛОКАЦИИ И ДЛИНЫ НА ЭКРАН . ПОИСК ПРОИЗВОДИТЬСЯ С НАЧАЛА СТРОКИ (С НУЛЕВОГО ЭЛЕМЕНТА (СЛЕВА НА ПРАВО))
    //                         (Answer (11,5))
    
    
    NSRange range4 = [myHistory rangeOfString:@"maxim" options:NSCaseInsensitiveSearch];
    NSLog(@" range maxim in myHistory  = %@",NSStringFromRange(range4));
    
    // ПОИСК СЛОВА МАКИМ В СТРОКЕ myHistory И ВЫВОД ЕГО ЛОКАЦИИ И ДЛИНЫ НА ЭКРАН . ПОИСК ПРОИЗВОДИТЬСЯ С КОНЦА СТРОКИ (С ПОСЛЕДНЕГО ЭЛЕМЕНТА (СПРАВА НА ЛЕВО))
    //                         (Answer (121,5))

    
    NSRange range5 = [myHistory rangeOfString:@"maxim" options:NSCaseInsensitiveSearch | NSBackwardsSearch];
    NSLog(@" range maxim in myHistory  = %@",NSStringFromRange(range5));
    
    // Lenght of string "myHistory" .Answer = 137;Lenght of string "name" .Answer = 5;

    NSLog(@"%lu",[myHistory length]);
    NSLog(@"%lu",[name length]);

    
    //                                   TASK 5
    
    //                    to cut the string "myHistory" to 10 index
    
    NSLog(@"%@",[myHistory substringToIndex:10]);
    
    //                    to cut the string "myHistory" from 100 index
    
    NSLog(@"%@",[myHistory substringFromIndex:100]);
    
    //                   change the words to another word
    NSLog(@"%@",[myHistory stringByReplacingOccurrencesOfString:@"Panamarou" withString:@"Orlovski"]);
    
    //                     объединить строки в массиве в один текст
    
    NSString* nameSoName = [array componentsJoinedByString:@"  "];
    NSLog(@"%@",nameSoName);
    
    NSString* nameSoName1 = [name stringByAppendingString:soName];
     NSLog(@"%@",nameSoName1);
    
    //          метод который создает массив строк разделенный строкой
    
    NSArray* separateArray = [myHistory componentsSeparatedByString:@"."];
    NSLog(@"%@",separateArray);
    
    
    NSLog(@"///////////////////////  LEVEL STUDENT  ////////////////////////////");
      //                  LEVEL STUDENT
    
    
    self.mutableArray = [NSMutableArray array];
    
    for (NSString* name in separateArray){
        NSRange name10 = [name rangeOfString:@"Maxim"];
        if (name10.location != NSNotFound){
            NSLog(@"%@",[separateArray objectAtIndex:[separateArray indexOfObject:name]]);
            [_mutableArray addObject:name];

        }
        else {}
    }
    
    NSLog(@" массив для мастера = %@", _mutableArray);
    

   
    /*
    //       ДЛЯ ЗАПИСИ СЛОВ И ПРЕДЛОЖЕНИЙ НАОБОРОТ
    
            for (NSString* backString in separateArray){
                for ( NSUInteger i = backString.length; i > 0; i--) {
            [_mutableArray addObject:[backString substringWithRange:NSMakeRange(i-1,1)]];
                    
            }
            }
    NSLog(@"back words = %@", _mutableArray);
    
    NSLog(@"///////////////////////  LEVEL MASTER  ////////////////////////////");
    
    //                            MASTER
    [_mutableArray removeAllObjects];
    
    self.mutableArray = [NSMutableArray array];
    
    NSLog(@"%@",_mutableArray);
    NSString* experement = @"My name is max or Maxim";
    
    NSRange searchRange = NSMakeRange(0, [experement length]);
    
    while (YES) {
        
        NSRange rangeTest = [experement rangeOfString:@" " options:0 range:searchRange];
        
        if (rangeTest.location != NSNotFound) {
            
            NSLog(@"%@",[experement substringWithRange:NSMakeRange(searchRange.location,  rangeTest.location-searchRange.location)]);
            
            NSString* addToArray =[experement substringWithRange:NSMakeRange(searchRange.location,  rangeTest.location-searchRange.location)];
          
            
            [_mutableArray addObject:addToArray];
            
            NSInteger index = rangeTest.location + rangeTest.length;
            
            searchRange.location = index;
            
            searchRange.length = [experement length] - index;
            
            
           
        } else {
            NSRange rangeTest1 = [experement rangeOfString:@" " options:NSBackwardsSearch];
            NSString* finish = [experement substringFromIndex:rangeTest1.location+1];
            [_mutableArray addObject:finish];
            break;
        };}
    
    NSLog(@"%@", _mutableArray);
    
    NSMutableArray* back = [NSMutableArray array];
    
    for
        
        (NSInteger i = _mutableArray.count-1; i>=0; i--) {
        NSLog(@"%@",[_mutableArray objectAtIndex:i]);
        [back addObject:[_mutableArray objectAtIndex:i]];
    }
    
    
    NSLog(@"NSMUtableArray = %@",back);
   
    */
    
    self.mutableArrayForMaster = [NSMutableArray array];
    self.mutableArrayForMasterNew=[NSMutableArray array];
    self.mutableArrayForMasterFinish = [NSMutableArray array];
    
    NSLog(@"Master Master Master Master Master Master Master Master Master Master ");
    
    for (NSString* string in _mutableArray) {
        
        BOOL yes = 1;
        NSRange searchRange = NSMakeRange(0, [string length]);
        while (yes) {
            
            NSRange rangeTest = [string rangeOfString:@" " options:0 range:searchRange];
            
            if (rangeTest.location != NSNotFound) {
                
                NSLog(@"%@",[string substringWithRange:NSMakeRange(searchRange.location,  rangeTest.location-searchRange.location)]);
                
                NSString* addToArray =[string substringWithRange:NSMakeRange(searchRange.location,  rangeTest.location-searchRange.location)];
                
                
                [_mutableArrayForMaster addObject:addToArray];
                
                NSInteger index = rangeTest.location + rangeTest.length;
                
                searchRange.location = index;
                
                searchRange.length = [string length] - index;
                
            } else {
                NSRange rangeTest1 = [string rangeOfString:@" " options:NSBackwardsSearch];
                NSString* finish = [string substringFromIndex:rangeTest1.location+1];
                NSLog(@"%@",finish);
                [_mutableArrayForMaster addObject:finish];
                yes = 0;
                for (int i = _mutableArrayForMaster.count-1; i>=0; i --) {
                    [_mutableArrayForMasterNew addObject:[_mutableArrayForMaster objectAtIndex:i]];
                }
                NSString* master = [_mutableArrayForMasterNew componentsJoinedByString:@" "];
                [_mutableArrayForMasterFinish addObject:master];
                [_mutableArrayForMaster removeAllObjects];
                [_mutableArrayForMasterNew removeAllObjects];
                
                [_mutableArrayForMaster removeAllObjects];
            }
        }
    }
     NSLog(@"NSMUtableArray = %@",_mutableArrayForMasterFinish);
    
    
    
    

    
    
    
    
    
    
    
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
