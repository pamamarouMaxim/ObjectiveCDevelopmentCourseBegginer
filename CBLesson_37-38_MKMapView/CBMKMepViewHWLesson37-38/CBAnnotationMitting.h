//
//  CBAnnotationMitting.h
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 06.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MKAnnotation.h"


@interface CBAnnotationMitting : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
