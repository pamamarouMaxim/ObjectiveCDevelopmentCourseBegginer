//
//  CBDoctor.h
//  Delegates
//
//  Created by Alina on 12.10.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBPatient.h"

@interface CBDoctor : NSObject <CBPatientDelegate>

@end
