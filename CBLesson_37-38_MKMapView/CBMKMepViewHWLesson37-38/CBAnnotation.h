//
//  CBAnnotation.h
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 04.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface CBAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end
