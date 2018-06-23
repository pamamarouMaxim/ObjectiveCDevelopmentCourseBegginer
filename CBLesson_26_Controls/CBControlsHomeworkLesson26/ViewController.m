//
//  ViewController.m
//  CBControlsHomeworkLesson26
//
//  Created by Alina on 10.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    
    CBInstallImageImageOne,
    CBInstallImageImageTwo,
    CBInstallImageImageThree
    
} CBInstallImage;


@interface ViewController ()

@property (assign,nonatomic) CGFloat speedOfAnimation;

@property (assign,nonatomic) CGFloat rotationAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.speedOfAnimation = 1;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionChangeTheImage:(UISegmentedControl *)sender {
    
    switch (self.changeImages.selectedSegmentIndex) {
            
        case CBInstallImageImageOne: self.imageForApp.image = [UIImage imageNamed:@"cat.png"];
            break;
        case CBInstallImageImageTwo: self.imageForApp.image = [UIImage imageNamed:@"fox.png"];
            break;
        case CBInstallImageImageThree: self.imageForApp.image = [UIImage imageNamed:@"dog.png"];
            break;
        default:
            break;
    }
}
#pragma mark animationScaleRotationTransaction


-(void) animationTranslation :(UIView*) view{
    
    [UIView animateWithDuration:[self durationOfanimation] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        view.center =  [self coordinateToMove];
        
        
    } completion:^(BOOL finished) {
        
        __weak UIView* imageTranslation = view;
        
        if (self.switchOfTranslation.isOn){
            
            [self animationTranslation:imageTranslation];
        }
    }];
}



-(void) animationScale :(UIView*) view{
    
    [UIView animateWithDuration:[self durationOfanimation] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        
            CGAffineTransform scaleTransform = view.transform;
            
            
            CGAffineTransform newScaleTransform = CGAffineTransformScale(scaleTransform, 3, 3);
            
            view.transform = newScaleTransform;
            
            
            CGAffineTransform returnScaleTransform = CGAffineTransformScale(scaleTransform, 1, 1);
            
            view.transform = returnScaleTransform;
      
    } completion:^(BOOL finished) {
    
        __weak UIView* image = view;
        
        if (self.switchOfScale.isOn){
     
        [self animationScale:image];
        }
    }];
}


-(void) animationRotation :(UIView*) view{
    
    
    [UIView animateWithDuration:[self durationOfanimation] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        
        CGAffineTransform rotationTransform = view.transform;
        
        
        CGAffineTransform newRotationTransform = CGAffineTransformRotate(rotationTransform, M_PI);
        
        view.transform = newRotationTransform;
        
        
        CGAffineTransform returnRotateTransform = CGAffineTransformRotate(rotationTransform, 0);
        
        view.transform = returnRotateTransform;
        
    } completion:^(BOOL finished) {
        
        __weak UIView* imageRotate = view;
        
        if (self.switchOfRotation.isOn){
            
            [self animationRotation:imageRotate];
        }
    }];
}




#pragma mark ActionsSwitchs


- (IBAction)actionSwitchRotation:(UISwitch *)sender {
    
    if (self.switchOfRotation.isOn) {
        
        [self animationRotation:self.imageForApp];
    }
    NSLog(@"switch off");
    
}

- (IBAction)actionSwitchScale:(UISwitch *)sender {
    
    if (self.switchOfScale.isOn) {
    
        [self animationScale:self.imageForApp];
    }
    
    
}


- (IBAction)actionSwitchTranslation:(UISwitch *)sender {
    
    if (self.switchOfTranslation.isOn) {
        
        [self animationTranslation:self.imageForApp];
    }
}


#pragma mark Methods


- (IBAction)actionSpeedChange:(UISlider *)sender {
    
    self.speedOfAnimation = sender.value;
    
    
}


-(CGFloat) durationOfanimation{
    
    CGFloat durationOfAnimation = 1/self.speedOfAnimation;
    
    return durationOfAnimation;
}

-(CGPoint) coordinateToMove{
    
int iX = CGRectGetWidth(self.view.bounds) - 2 * CGRectGetWidth(self.imageForApp.bounds);
int iY = CGRectGetHeight(self.view.bounds)/2;
    
float x = CGRectGetWidth(self.imageForApp.bounds) + arc4random()%iX;
float y = CGRectGetHeight(self.imageForApp.bounds) + arc4random()%iY;
    
    CGPoint point = CGPointMake(x, y);
    
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    return point;
}



@end
