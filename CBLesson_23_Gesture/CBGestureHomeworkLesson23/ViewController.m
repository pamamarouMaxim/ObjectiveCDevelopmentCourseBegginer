//
//  ViewController.m
//  CBGestureHomeworkLesson23
//
//  Created by Alina on 27.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property ( weak,nonatomic) UIView* moveImages;
@property (assign,nonatomic) CGAffineTransform rotationOfImage;

@property (assign, nonatomic) CGFloat testViewScale;
@property (assign, nonatomic) CGFloat testViewRotation;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    
                  // CREATED THE VIEW AND ANIMATION TO TAP
    
   UIImageView *imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.frame) + 100, CGRectGetHeight(self.view.bounds)/10, CGRectGetWidth(self.view.bounds)/8, CGRectGetHeight(self.view.bounds)/10)];
    
    
     UIImage* cat1 = [UIImage imageNamed:@"cat1.jpg"];
     UIImage* cat2 = [UIImage imageNamed:@"cat2.jpg"];
     UIImage* cat3 = [UIImage imageNamed:@"cat3.jpg"];
     UIImage* cat4 = [UIImage imageNamed:@"cat4.jpg"];
     UIImage* cat5 = [UIImage imageNamed:@"cat5.jpg"];
     UIImage* cat6 = [UIImage imageNamed:@"cat6.jpg"];
    
    NSArray* cats = [NSArray arrayWithObjects:cat1,cat2,cat3,cat4,cat5,cat6, nil];
    
    imageHolder.animationImages = cats;
    imageHolder.animationDuration = 2;
    [imageHolder startAnimating];
    
    imageHolder.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:imageHolder];
    
    self.moveImages = imageHolder;
    
    
    UITapGestureRecognizer* tapMovie = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    [self.view addGestureRecognizer:tapMovie];
    
    UITapGestureRecognizer* stopAnimation = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    
    stopAnimation.numberOfTapsRequired = 2;
    stopAnimation.numberOfTouchesRequired = 2;

    
    [self.view addGestureRecognizer:stopAnimation];

    
    //                               SWIPE clockwiseRotation
    UISwipeGestureRecognizer* clockwiseRotation = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rotationTheImage:)];
    
    clockwiseRotation.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:clockwiseRotation];
    
     //                               SWIPE counter-clockwise
    
    UISwipeGestureRecognizer* counterClockwiseRotation = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rotationTheImage:)];
    
    clockwiseRotation.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:counterClockwiseRotation];
    
    //                                ROTATION
    
    UIRotationGestureRecognizer* rotationGesture =
    [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                 action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    
    [self.view addGestureRecognizer:rotationGesture];

                        // PINCH
    UIPinchGestureRecognizer* pinchGesture =
    [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    
    [self.view addGestureRecognizer:pinchGesture];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark Methods

- (void) handleRotation:(UIRotationGestureRecognizer*) rotationGesture {
    
    NSLog(@"handleRotation %1.3f", rotationGesture.rotation);
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransform = self.moveImages.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, newRotation);
    
    self.moveImages.transform = newTransform;
    
    self.testViewRotation = rotationGesture.rotation;
}
 

- (void) handlePinch:(UIPinchGestureRecognizer*) pinchGesture {
    
    NSLog(@"handlePinch %1.3f", pinchGesture.scale);
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewScale = 1.f;
    }
    
    CGFloat newScale = 1.f + pinchGesture.scale - self.testViewScale;
    
    CGAffineTransform currentTransform = self.moveImages.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, newScale, newScale);
    
    self.moveImages.transform = newTransform;
    
    self.testViewScale = pinchGesture.scale;
}




-(void) handleTap: (UITapGestureRecognizer*) tapMove {
    
    [UIView animateKeyframesWithDuration:4
     
                            delay:0
                            options: UIViewKeyframeAnimationOptionBeginFromCurrentState
                            animations:^{
                            self.moveImages.center = [tapMove locationInView:self.view];

                            } completion:^(BOOL finished) {
                            
                            }];
}

-(void) handleDoubleTap:(UITapGestureRecognizer*) tapGester{
    [self.moveImages.layer removeAllAnimations];
}

-(void) rotationTheImage:(UISwipeGestureRecognizer*) rotation{
    
    CGFloat turn = M_PI;
    CGFloat turnWhole = 2*M_PI;
    CGFloat turn1 = -3.14f;
    CGFloat turnWhole1 = -6.28f;
    
    if (rotation.direction == UISwipeGestureRecognizerDirectionRight) {
       
        
        [self animateRotationView:turn animateRotationViewPart2:turnWhole];
    }
    
    else  [self animateRotationView:turn1 animateRotationViewPart2:turnWhole1];
    
        
   
}

-(void) animateRotationView:(CGFloat) turnAround animateRotationViewPart2:(CGFloat) turnAroundPart2{
    NSLog(@"first = %f , second = %f",turnAround ,turnAroundPart2 );
    _rotationOfImage = CGAffineTransformMakeRotation(turnAround);
    CGAffineTransform rotationOfImage = CGAffineTransformMakeRotation(turnAroundPart2);
    
    [UIView animateKeyframesWithDuration:2
                     delay       :0
                     options     :UIViewKeyframeAnimationOptionBeginFromCurrentState
                     animations  :^{
                                  
                                  
    self.moveImages.transform = _rotationOfImage;
                         

    self.moveImages.transform = rotationOfImage;
                         
                              } completion:^(BOOL finished) {
                                  NSLog(@"i am finished turn on clockwise");
                              }];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
