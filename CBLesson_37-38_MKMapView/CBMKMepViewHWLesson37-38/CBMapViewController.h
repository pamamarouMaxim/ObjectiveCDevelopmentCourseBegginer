//
//  CBMapViewController.h
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 04.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MKAnnotation.h>

@class MKMapView;

@interface CBMapViewController : UIViewController <UIPopoverControllerDelegate>

@property (weak,nonatomic) IBOutlet MKMapView* mapView;

@end




