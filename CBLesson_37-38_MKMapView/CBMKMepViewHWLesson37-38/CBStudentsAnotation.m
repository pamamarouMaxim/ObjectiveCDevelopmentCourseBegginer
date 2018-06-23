//
//  CBStudentsAnotation.m
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 04.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBStudentsAnotation.h"



@implementation CBStudentsAnotation

static NSString* firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

static int namesCount = 50;

+ (CBStudentsAnotation*) createStudent {
    
    CBStudentsAnotation* student = [[CBStudentsAnotation alloc] init];
    
    student.firstName = firstNames[arc4random() % namesCount];
    student.lastName = lastNames[arc4random() % namesCount];
    student.dateOfBirth = [self createDate];
    student.coordinate = [self createLocation];
    student.gender = (arc4random()% 2) ? CBStudentMale :
   CBSudentFemale;
    
   
    
    

    return student;
}

+(CLLocationCoordinate2D) createLocation{
    
    CGFloat delta = (arc4random() % 10 + 2) * 0.001;
    NSInteger direct = (arc4random() % 2 == 1) ? 1 : -1;
    
    CLLocationCoordinate2D location;
    location.latitude = latitudeCity + (direct * delta);
    delta = (arc4random() % 10 + 2) * 0.002;
   direct = (arc4random() % 2 == 1) ? 1 : -1;
    location.longitude = longitudeCity + (direct * delta);
    
    return location;
}


+(NSDate*) createDate{
    
    NSDate* date = [NSDate date];
    
    NSInteger ageOfYoungSeconds = 18*365*24*60*60;
    
    NSTimeInterval timeInterval = arc4random() % ageOfYoungSeconds + ageOfYoungSeconds;
    
    date = [date dateByAddingTimeInterval:-timeInterval];

    NSDate* dateOfBirth = date;
    
    return dateOfBirth;
    
}

@end
