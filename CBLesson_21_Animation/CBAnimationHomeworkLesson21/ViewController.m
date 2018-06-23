//
//  ViewController.m
//  CBAnimationHomeworkLesson21
//
//  Created by Alina on 18.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign , nonatomic) NSInteger number;
@property (assign , nonatomic) NSInteger numberCorner;
@property (assign,nonatomic) CGRect rect;
@property (assign,nonatomic) CGRect rect1;
@property (assign,nonatomic) NSInteger numberOfColor;
@property (strong,nonatomic) NSMutableArray* arrayOfColor;
@property (weak , nonatomic) UIImageView* image;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _arrayOfColor = [NSMutableArray array];
    
    for (int c = 0; c < 4; c++) {
       [ _arrayOfColor addObject:[self color]];
    }
    [_arrayOfColor addObject:[_arrayOfColor objectAtIndex:0]];
   
    [self rectOfview];
    
    for (int i = 0; i < 4; i++) {
        [self rectOfcorverView:i ];
   }
   
    
    /*
    UIImageView* image = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
   
    UIImage* image1 = [UIImage imageNamed:@"Argentina"];
    UIImage* image2 = [UIImage imageNamed:@"Australia"];
    UIImage* image3 = [UIImage imageNamed:@"Argentina"];
    
    NSArray* arrayOfImages = [NSArray arrayWithObjects:image1,image2,image3,nil];
    
    image.animationImages = arrayOfImages;
    
    image.animationDuration = 4.0f;
    
    [image startAnimating];
    
    [self.view addSubview:image];
    
    [self moveView:image];
    
    //[self moveView:_image];
    */
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) rectOfcorverView :(NSInteger) numberOfView {
    
    BOOL move = false;
    
    switch (numberOfView) {
        case 0:
            _rect1 = CGRectMake(20, 20, 40, 40);
            if (move){
                _rect = CGRectMake(CGRectGetWidth(self.view.bounds)-60, 20, 40, 40);
            }
            else _rect = CGRectMake(20, CGRectGetHeight(self.view.bounds)-60, 40, 40);
            
            
            break;
        case 1:
            _rect1 = CGRectMake(CGRectGetWidth(self.view.bounds)-60, 20, 40, 40);
              if (move){
             _rect =CGRectMake(CGRectGetWidth(self.view.bounds)-60, CGRectGetHeight(self.view.bounds)-60, 40, 40);
              }             else _rect = CGRectMake(20, 20, 40, 40);

            break;

        case 2:
             _rect1 = CGRectMake(CGRectGetWidth(self.view.bounds)-60, CGRectGetHeight(self.view.bounds)-60, 40, 40);
                    if (move){
             _rect = CGRectMake(20, CGRectGetHeight(self.view.bounds)-60, 40, 40);
                    }
            else  _rect = CGRectMake(CGRectGetWidth(self.view.bounds)-60, 20, 40, 40);
            break;
            
        case 3:
            _rect1 = CGRectMake(20, CGRectGetHeight(self.view.bounds)-60, 40, 40);
                          if (move){
             _rect = CGRectMake(20, 20, 40, 40);
                          }
            else _rect = CGRectMake(CGRectGetWidth(self.view.bounds)-60, CGRectGetHeight(self.view.bounds)-60, 40, 40);
            break;
            
        default:
            break;
    }
    
    CGRect rect = _rect1;
    
    [self uiViewCreated:rect];
}




-(void) uiViewCreated :(CGRect) rect{
    
    
    UIView* cornerView = [[UIView alloc] initWithFrame:rect];
    [self.view addSubview:cornerView];
    
    [self moveCornerView : cornerView];
}

-(void) moveCornerView: (UIView*) cornerView {
    
    UIView* view = [[UIView alloc] initWithFrame:_rect];
    
    
    cornerView.backgroundColor = [_arrayOfColor objectAtIndex:_numberOfColor];
    _numberOfColor = _numberOfColor +1;
    [UIView animateWithDuration:3 delay:1
                        options: [self numberOfOptionCorner]               |
                                 UIViewAnimationOptionAutoreverse    |
                                 UIViewAnimationOptionRepeat
     
     
                     animations:^{
                         
                         cornerView.center = view.center;
                         
                         
                         
                         cornerView.backgroundColor = [_arrayOfColor objectAtIndex:_numberOfColor];
                         
                     } completion:^(BOOL finished) {
                         
                     }];

    
}




-(void) rectOfview {
    
    CGPoint point = CGPointMake(arc4random()%100+100, arc4random()%100+100);
    
    CGSize sizeOfView = CGSizeMake(arc4random()%100 + 100, arc4random()%100 + 100);
    
    for (int i = 0; i < 4 ; i++) {
    
        
    CGRect rectOfView = CGRectMake(point.x, point.y, sizeOfView.width, sizeOfView.height);
        
        [self createdView: &rectOfView];
        
        point.y = point.y + sizeOfView.height+20;
        
        }
    
}

-(void) createdView :(CGRect*) rectOfView {
    
    CGRect rect = *rectOfView;
    
    UIView* createdView = [[UIView alloc] initWithFrame: rect];
    [self.view addSubview:createdView];
    
    [self moveView:createdView];
}


-(void) moveView: (UIView*) view {
    
    view.backgroundColor = [self color];
    
    [UIView animateWithDuration:3 delay:1
                        options: [self numberOfOption] |
                                 UIViewAnimationOptionAutoreverse    |
                                 UIViewAnimationOptionRepeat
     
                        animations:^{
    
        view.center = CGPointMake(CGRectGetWidth(self.view.bounds)-2*CGRectGetWidth(view.frame)/2 - CGRectGetWidth(view.bounds)/2, view.center.y);
                            
        view.transform = CGAffineTransformMakeRotation(M_PI);
                            
        view.transform = CGAffineTransformMakeScale(0.5, 0.5);
                            
        view.backgroundColor = [self color];
                            
    } completion:^(BOOL finished) {
        
    }];
}


-(NSInteger) numberOfOptionCorner{
    
    NSInteger number1 = _numberCorner << 16;
    
    _numberCorner = _numberCorner + 1;
    
    return number1;
}
-(NSInteger) numberOfOption{
    
    NSInteger number1 = _number << 16;
    
    _number = _number + 1;
    

    return number1;
}

-(UIColor*) color{
    
    CGFloat r = [self floatOfColor];
    CGFloat g = [self floatOfColor];
    CGFloat b = [self floatOfColor];
    
    UIColor* colorOfView = [UIColor colorWithRed:r green:g blue:b alpha:1];

    return colorOfView;
    
}

-(CGFloat) floatOfColor{
    
    CGFloat floatOfColor = (float) (arc4random()%256) / 255;
    
    return floatOfColor;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
