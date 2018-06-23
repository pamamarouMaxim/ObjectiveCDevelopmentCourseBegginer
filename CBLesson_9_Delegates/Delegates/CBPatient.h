//
//  CBPatient.h
//  Delegates
//
//  Created by Alina on 12.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CBPatientDelegate <NSObject>
@end

@interface CBPatient : NSObject

@property (strong,nonatomic) NSString* name;
@property (assign,nonatomic) float temperature;
@property (assign,nonatomic) BOOL headPain;

@property (weak , nonatomic) id <CBPatientDelegate>  delegate;

-(BOOL) feelBad;
-(void) haveRest;
-(void) takePill;
-(void) makeShot;

@end

