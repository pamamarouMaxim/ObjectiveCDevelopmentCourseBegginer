//
//  CBStudents.m
//  CBUITableViewSearchHomeworkLesson35
//
//  Created by Alina on 28.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBStudents.h"

@implementation CBStudents


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

+ (NSMutableArray*) createStudentWithCount : (NSInteger) countOfStudents {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < countOfStudents; i++ ) {
        
        CBStudents* student = [[CBStudents alloc] init];
        student.firstName = firstNames[arc4random() % namesCount];
        student.lastName = lastNames[arc4random() % namesCount];
        student.dateOfBirth = [self createDate];
        [array addObject:student];
    }
    
    return array;
}





+(NSDate*) createDate{
    
    NSDate* date = [NSDate date];
    
    NSInteger ageOfYoungSeconds = 18*365*24*60*60;
    
    NSTimeInterval timeInterval = arc4random() % ageOfYoungSeconds + ageOfYoungSeconds;
    
    date = [date dateByAddingTimeInterval:-timeInterval];
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSDate* dateOfBirth = date;
    
    return dateOfBirth;
    
}


- (NSInteger) getBirthDayMonth {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSCalendarUnitMonth  fromDate:self.dateOfBirth];
    
    return [components month];
}


@end
