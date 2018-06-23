//
//  CBPatient.m
//  Delegates
//
//  Created by Alina on 12.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBPatient.h"

@implementation CBPatient

-(BOOL) feelBad  {
    BOOL helth = arc4random() %2;
    
    
    if (helth) {
        ;
        
            }
    return !helth;
}
-(void) haveRest{
    NSLog(@"%@ have a rest",self.name);
}
-(void) takePill{
    NSLog(@"%@ take a pill",self.name);
}
-(void) makeShot{
    NSLog(@"%@ make a shot",self.name);
}

@end
