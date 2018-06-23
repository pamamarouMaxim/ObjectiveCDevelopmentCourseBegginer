//
//  CBPatientDelegate.h
//  Delegates
//
//  Created by Alina on 12.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CBPatientDelegate <NSObject>

-(void) patientFeelsBad: (CBPatient*) patient;



@end
