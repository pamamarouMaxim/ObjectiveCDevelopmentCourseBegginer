//
//  CBStudentsAnotation.h
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 04.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

static const CLLocationDegrees spanDelta = 0.005;
static const CLLocationDegrees latitudeCity = 53.904690;
static const CLLocationDegrees longitudeCity = 27.563731;


typedef enum {
    CBStudentMale,
    CBSudentFemale
}CBStudentGender;

@interface CBStudentsAnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,  strong) NSString *firstName;
@property (nonatomic, strong  ) NSString *lastName;

@property (strong,nonatomic) NSDate* dateOfBirth;

@property (assign , nonatomic)  CBStudentGender gender;




+(CBStudentsAnotation*) createStudent;

@end
