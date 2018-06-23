//
//  CBMapViewController.m
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 04.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBMapViewController.h"
#import <MapKit/MapKit.h>
#import "CBStudentsAnotation.h"
#import "CBAnnotation.h"
#import "UIView+MKAnnotationView.h"
#import "CBTableViewController.h"
#import "CBAnnotationMitting.h"

@interface CBMapViewController ()

@property (strong,nonatomic) NSMutableArray* arrayOfStudents;
@property (strong,nonatomic) NSMutableArray* arrayOfAnnotation;
@property(nonatomic,retain)UIPopoverPresentationController *dateTimePopover8;
@property (strong,nonatomic) NSMutableArray* arrayOfPopoverData;
@property (strong,nonatomic) CLGeocoder* geocoder;

@property(strong,nonatomic) NSString* country;
@property(strong,nonatomic) NSString* locality;
@property(strong,nonatomic) NSString* thoroughfare;

@property (strong, nonatomic) MKDirections* directions;


@property(assign,nonatomic) double placeOfMittingLong;
@property(assign,nonatomic) double placeOfMittingLatitude;


@end

@implementation CBMapViewController

-(void) loadView {
    [super loadView];

    self.arrayOfStudents = [NSMutableArray array];
    self.arrayOfAnnotation = [NSMutableArray array];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect sizeOfMapView = self.view.frame;
    
    self.mapView.frame = sizeOfMapView;
    
    self.geocoder = [[CLGeocoder alloc] init];
    
    UIBarButtonItem* addStudentsToMap = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addStudentsToMap:)];
    
    UIBarButtonItem* searchStudentsOnMap = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(actionShowAll)];
    
     UIBarButtonItem* fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];

self.navigationItem.rightBarButtonItems = @[addStudentsToMap,fixedSpace,searchStudentsOnMap];
    
    
    UIBarButtonItem* showPlaceOfMitting = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showPlaceOfMitting:)];
    
    UIBarButtonItem* showThePath = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(actionDirection:)];
    
    self.navigationItem.leftBarButtonItems = @[showPlaceOfMitting,fixedSpace,showThePath];
    
    [self setBeginingRegion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) showAlertWithTitle:(NSString*) title andMessage:(NSString*) message {
    
    
    [UIAlertController alertControllerWithTitle:title
                                          message:message
                                   preferredStyle:UIAlertControllerStyleAlert];
    
    
}


-(void) setBeginingRegion{
    
    CLLocationCoordinate2D location;
    location.latitude = latitudeCity;
    location.longitude = longitudeCity ;

    MKCoordinateRegion region;
    
    region.center  = location;
    
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.05;
    span.longitudeDelta =0.05;
    
    region.span =  span;
    [self.mapView setRegion:region animated:YES];

}


-(void) createInfoForPopover:(NSString*)country locality: (NSString*) locality  thoroughfare: (NSString*)thoroughfare{
    
    self.locality = locality;
    self.country = country;
    self.thoroughfare = thoroughfare;
    
}

-(void) addInfoForPopoverInArray :(MKAnnotationView*) view{
    
    NSString* country = self.country;

    NSArray* array = [[NSArray alloc] initWithObjects:country,view.annotation.title,view.annotation.subtitle, nil];
    
    
    self.arrayOfPopoverData = [NSMutableArray arrayWithArray:array];
    
    if ([view.image isEqual:[UIImage imageNamed:@"male1.png"]]) {
        [self.arrayOfPopoverData addObject:@"Male"];
    }
    else [self.arrayOfPopoverData addObject:@"Female"];
}

-(void) callTheTableViewController:(MKAnnotationView*) view{
    
    CBTableViewController* controller = [[CBTableViewController alloc] init];
    [controller addTitleForCell:self.arrayOfPopoverData];
    
    
    CBTableViewController* dateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBTableViewController"];
    
    UINavigationController *destNav = [[UINavigationController alloc] initWithRootViewController:dateVC];
    dateVC.preferredContentSize = CGSizeMake(400,300);
    destNav.modalPresentationStyle = UIModalPresentationPopover;
    _dateTimePopover8 = destNav.popoverPresentationController;
    _dateTimePopover8.delegate = self;
    _dateTimePopover8.sourceView = self.view;
    _dateTimePopover8.sourceRect = view.frame;
    destNav.navigationBarHidden = YES;
    dateVC.array = self.arrayOfPopoverData;
    [self presentViewController:destNav animated:YES completion:nil];
}


#pragma mark Action



- (void) actionDirection:(UIButton*) sender {
    
   
    [self.mapView removeOverlays:[self.mapView overlays]];

    
    for (id <MKAnnotation> annotation in self.mapView.annotations)  {
        
        if ([annotation isKindOfClass:[CBAnnotation class]]) {
            
            CLLocationCoordinate2D location;
           
            location.longitude = self.placeOfMittingLong;
            location.latitude = self.placeOfMittingLatitude;
            
            MKDirectionsRequest* request = [[MKDirectionsRequest alloc] init];
            
            MKPlacemark* placemarkFlag = [[MKPlacemark alloc] initWithCoordinate:location
                                                               addressDictionary:nil];
            
            request.source = [[MKMapItem alloc] initWithPlacemark: placemarkFlag];
            
            MKPlacemark* placemark = [[MKPlacemark alloc] initWithCoordinate:annotation.coordinate                                                           addressDictionary:nil];
            
            MKMapItem* destination = [[MKMapItem alloc] initWithPlacemark:placemark];
            
            request.destination = destination;
            
            request.transportType = MKDirectionsTransportTypeAutomobile;
            
            
            self.directions = [[MKDirections alloc] initWithRequest:request];
            
                    [self.directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
                
                if (error) {
                    [self showAlertWithTitle:@"Error" andMessage:[error localizedDescription]];
                } else if ([response.routes count] == 0) {
                    [self showAlertWithTitle:@"Error" andMessage:@"No routes found"];
                } else {
                    
                   // [self.mapView removeOverlays:[self.mapView overlays]];
                    
                    NSMutableArray* array = [NSMutableArray array];
                    
                    for (MKRoute* route in response.routes) {
                        [array addObject:route.polyline];
                        
                    }
                    
                    [self.mapView addOverlays:array level:MKOverlayLevelAboveRoads];
                    
                }
                
            }];

            
        }
    }
    
   }


- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor colorWithRed:0.0/255.0 green:171.0/255.0 blue:253.0/255.0 alpha:1.0];
    renderer.lineWidth = 5.0;
    return  renderer;
}

-(void) showPlaceOfMitting: (UIBarButtonItem*) sender{
    
    CBAnnotationMitting* annotation = [[CBAnnotationMitting alloc] init];
    
    annotation.title = @"meeting point";
    
    annotation.coordinate = self.mapView.region.center;
    
    [self.mapView addAnnotation:annotation];
    
}


-(void) actionDescription:(UIButton*) sender{
    
    self.arrayOfPopoverData = [NSMutableArray array];
    
    MKAnnotationView* view = [sender superAnnotationView];
    
    if (!view) {
        return;
    }
    
    CLLocation* location = [[CLLocation alloc]
                           initWithLatitude:view.annotation.coordinate.latitude
                           longitude       :view.annotation.coordinate.latitude];
    
    if ([self.geocoder isGeocoding]){
        [self.geocoder cancelGeocode];
    }
     [self.geocoder
     reverseGeocodeLocation:location
     completionHandler:^(NSArray *placemarks, NSError *error) {
          NSString* t = nil;
          NSString* l = nil;
          NSString* c = nil;
          NSString* message = nil;
         
         if (error) {
             
             message = [error localizedDescription];
             
         } else {
             
             if ([placemarks count] > 0) {
                 
                 MKPlacemark* placeMark = [placemarks firstObject];
                 
                 message = [placeMark.addressDictionary description];
                 t = placeMark.thoroughfare;
                 c = placeMark.country;
                 l = placeMark.locality;
                 
                
             } else {
                 message = @"No Placemarks Found";
             }
                      }
         
         self.country = c;
         self.locality = l;
         self.thoroughfare= t;
         
    
   
        // [self createInfoForPopover:c locality:l thoroughfare:t];
         [self addInfoForPopoverInArray:view];
         [self callTheTableViewController:view];
     }];
    
}

-(void) addStudentsToMap : (UIBarButtonItem*) addStudent{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    for (int i = 0; i <10; i++) {
        
        CBStudentsAnotation* student = [CBStudentsAnotation createStudent];

        CBAnnotation* annotation = [[CBAnnotation alloc] init];
        
        annotation.title = [NSString stringWithFormat:@"%@ %@",
                            student.firstName,student.lastName];
        
        annotation.subtitle = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:student.dateOfBirth]];
        
        
        annotation.coordinate = student.coordinate;
        
        [self.mapView addAnnotation:annotation];
    }
}


- (void) actionShowAll {
    
    MKMapRect zoomRect = MKMapRectNull;
    
    for (id <MKAnnotation> annotation in self.mapView.annotations) {
        
        CLLocationCoordinate2D location = annotation.coordinate;
        
        MKMapPoint center = MKMapPointForCoordinate(location);
        
        static double delta = 20000;
        
        MKMapRect rect = MKMapRectMake(center.x - delta, center.y - delta, delta * 2, delta * 2);
        
        zoomRect = MKMapRectUnion(zoomRect, rect);
    }
    
    zoomRect = [self.mapView mapRectThatFits:zoomRect];
    
    [self.mapView setVisibleMapRect:zoomRect
                        edgePadding:UIEdgeInsetsMake(50, 50, 50, 50)
                           animated:YES];
    
}


- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)annotationViews
{
    
    for (MKAnnotationView *annView in annotationViews)
    {
        CGRect endFrame = annView.frame;
        annView.frame = CGRectOffset(endFrame, 0, -500);
        [UIView animateWithDuration:0.5
                         animations:^{ annView.frame = endFrame; }];
    }
}


#pragma mark MKAnnotationView

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    if ([annotation isKindOfClass:[CBAnnotationMitting class]]) {
         static NSString* identifierMitting = @"AnnotationMitting";
        MKAnnotationView* view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifierMitting];
        if (!view) {
            
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifierMitting];
        
        view.image = [UIImage imageNamed:@"flag.ico"];
        
        view.bounds = CGRectMake(0, 0, 100, 100);
        
          view.draggable = YES;
            
            self.placeOfMittingLong = view.annotation.coordinate.longitude;
            self.placeOfMittingLatitude = view.annotation.coordinate.latitude;
            
             view.canShowCallout = YES;
        
        }
        return view;

    }
    
    static NSString* identifierView = @"AnnotationView";
    
    MKAnnotationView* view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifierView];
    
    if (!view) {
        
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifierView];
        
        view.canShowCallout = YES;
        
        //view.annotation = annotation;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
         UIImageView * callout= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        
        if (arc4random()%2){
              imageView.image = [UIImage imageNamed:@"female2.png"];
              callout.image = [UIImage imageNamed:@"female.png"];
        }
        else  { imageView.image = [UIImage imageNamed:@"male1.png"];
                callout.image = [UIImage imageNamed:@"male.jpg"];
        }
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [button addTarget:self action:@selector(actionDescription:) forControlEvents:UIControlEventTouchUpInside];
     
        view.rightCalloutAccessoryView = button;
        
        view.draggable = NO;
    
        view.image= imageView.image;
        view.leftCalloutAccessoryView = callout;
        
        view.bounds = CGRectMake(0, 0, 50, 50);
        
}
        
        else
        {
            view.annotation = annotation;
        }

    return view;
    
}



- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState {
    
    
    if (newState == MKAnnotationViewDragStateStarting) {
        view.dragState = MKAnnotationViewDragStateDragging;
    }

    else if (newState == MKAnnotationViewDragStateEnding || newState == MKAnnotationViewDragStateCanceling) {
        view.dragState = MKAnnotationViewDragStateNone;
        self.placeOfMittingLong = view.annotation.coordinate.longitude;
        self.placeOfMittingLatitude = view.annotation.coordinate.latitude;
    
        }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) dealloc{
    if ([self.geocoder isGeocoding]){
        [self.geocoder cancelGeocode];
    }
}
@end
