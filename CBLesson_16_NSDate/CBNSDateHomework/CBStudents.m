//
//  CBStudents.m
//  CBNSDateHomework
//
//  Created by Alina on 07.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBStudents.h"

@implementation CBStudents

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [self studentsName];
        self.soName = [self studentsSoName];
        self.dateOfBirth =[self createDateOfBirth];
        
       
        
    }
    return self;
}

-(NSDate*) createDateOfBirth{
    
    NSInteger dateYounger = 16*365*24*60*60;
    NSInteger dateOlder = 50*365*60*60;
    
    
    NSDate* dateOfBirth = [NSDate dateWithTimeIntervalSinceNow:-(dateYounger + arc4random()%(dateOlder-dateYounger))];
    
    return dateOfBirth;
    
}

-(NSString*) studentsName {
    
    NSInteger randomName = arc4random()%7;
    
    NSString* name = [[NSString alloc]init];
    
    switch (randomName) {
        case 0:
            name = @"Maxim";
            break;
        case 1:
            name = @"Alina";
            break;
        case 2:
            name = @"Tifa";
            break;
        case 3:
            name = @"Kolia";
            break;
        case 4:
            name = @"Natasha";
            break;
        case 5:
            name = @"Jidkii";
            break;
        case 6:
            name = @"Bafi";
            break;
    }
    return name;
}

-(NSString*) studentsSoName {
    
    NSInteger randomSoName = arc4random()%7;
    
    NSString* soName = [[NSString alloc]init];
    
    switch (randomSoName) {
        case 0:
            soName = @"Panamarou";
            break;
        case 1:
            soName = @"Stules";
            break;
        case 2:
            soName = @"Krupp";
            break;
        case 3:
            soName = @"Savelev";
            break;
        case 4:
            soName = @"Grishko";
            break;
        case 5:
            soName = @"Skutarenko";
            break;
        case 6:
            soName = @"Palto";
            break;
    }
    return soName;
}

-(NSString*) description {
    
    NSDateFormatter * dateFormtter = [[NSDateFormatter alloc]init];
    [dateFormtter setDateStyle:NSDateFormatterLongStyle];

    return [NSString stringWithFormat:@"          \n"
                 "name = %@  \n"
                 "soName = %@ \n"
                 "date of birth = %@",self.name , self.soName,[dateFormtter stringFromDate:self.dateOfBirth]];
}

@end
