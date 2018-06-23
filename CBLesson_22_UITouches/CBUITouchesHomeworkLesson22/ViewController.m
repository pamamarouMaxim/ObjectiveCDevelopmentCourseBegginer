//
//  ViewController.m
//  CBUITouchesHomeworkLesson22
//
//  Created by Alina on 20.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign,nonatomic) NSInteger callsInString;

@property (strong,nonatomic) NSMutableArray* arrayOfCalls;

@property (strong,nonatomic) NSMutableArray* arrayOfChechers;

@property (strong,nonatomic) NSMutableArray* arrayOfCallss;

@property (weak,nonatomic) UIView* draggingView;

@property (weak,nonatomic) UIView* board;

@property (weak,nonatomic) UIView* oneCall;

@property (assign,nonatomic) CGPoint touchOffset;

@property (assign,nonatomic) CGPoint earlyPlace;

@property (strong,nonatomic) NSMutableArray* distanceToCenter;

@property (strong,nonatomic) NSMutableArray* arrayOfCallss3;

@property (assign,nonatomic) BOOL intersectCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.callsInString = 8;
   
    NSMutableArray* arrayOfChecher = [NSMutableArray array];
    NSMutableArray* arrayOfCallss = [NSMutableArray array];
    
    UIView* oneCall = [[UIView alloc] init];
    
    UIView* boardView = [[UIView alloc] initWithFrame:
                         
                         CGRectMake(self.view.center.x - self.view.bounds.size.width/2,
                                    self.view.center.y - self.view.bounds.size.width/2,
                                    self.view.bounds.size.width,
                                    self.view.bounds.size.width)];
    
    boardView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin   |
                                 UIViewAutoresizingFlexibleRightMargin  |
                                 UIViewAutoresizingFlexibleTopMargin    |
                                 UIViewAutoresizingFlexibleBottomMargin ;
    
    
    [self.view addSubview:boardView];
    
    boardView.backgroundColor = [UIColor greenColor];
    
    NSMutableArray* array = [self createdCalls:boardView];
    
    for (UIView* view in array) {
      
        [boardView addSubview:view];
        
        if (view.backgroundColor == [UIColor whiteColor] || view.backgroundColor == [UIColor redColor]){
            [arrayOfChecher  addObject:view];      }
        else [arrayOfCallss addObject:view];
        
            }
    
    oneCall = [arrayOfCallss objectAtIndex:0];
    
    _oneCall = oneCall;
    
    _arrayOfChechers =arrayOfChecher;
    _arrayOfCallss = arrayOfCallss;
    
    _board = boardView;

}


-(NSMutableArray*) createdCalls:(UIView*) board{
    
    NSMutableArray* arrayOfCalls = [NSMutableArray array];
    
    CGRect rectOfCells = CGRectMake(CGRectGetMinX(board.frame), CGRectGetMinY(board.frame), CGRectGetWidth(board.bounds)/self.callsInString, CGRectGetWidth(board.bounds)/self.callsInString);
    
    for (int i = 0; i < 8; i++) {
        for (int w = 0; w < 4; w++) {
            if (i % 2) {
                rectOfCells.origin.x = w * 2 * rectOfCells.size.width;
                
            }
            else      { rectOfCells.origin.x = (w * 2 + 1) * rectOfCells.size.width;
            }
            
            rectOfCells.origin.y = i * rectOfCells.size.height;
            
            UIView* viewsOfCalls = [[UIView alloc] initWithFrame:rectOfCells];
            
            viewsOfCalls.backgroundColor = [UIColor blackColor];
            
            [arrayOfCalls addObject:viewsOfCalls];
            
            
            if (i<3) {
                
                UIView* whiteCheckers = [[UIView alloc]initWithFrame:CGRectMake(
                                                                                
                rectOfCells.origin.x  + viewsOfCalls.bounds.size.width  * 0.2 ,
                rectOfCells.origin.y  + viewsOfCalls.bounds.size.height * 0.2 ,
                viewsOfCalls.bounds.size.width  * 0.6 ,
                viewsOfCalls.bounds.size.height * 0.6 )];
                
                whiteCheckers.backgroundColor = [UIColor whiteColor];
               [arrayOfCalls addObject:whiteCheckers];
                
                
            }
            if (i>4) {
                
                UIView* redCheckers = [[UIView alloc]initWithFrame:CGRectMake(
                                                                              
                rectOfCells.origin.x  + viewsOfCalls.bounds.size.width  * 0.2 ,
                rectOfCells.origin.y  + viewsOfCalls.bounds.size.height * 0.2 ,
                viewsOfCalls.bounds.size.width  * 0.6 ,
                viewsOfCalls.bounds.size.height * 0.6 )];
                
                redCheckers.backgroundColor = [UIColor redColor];
               [arrayOfCalls addObject:redCheckers];
                
                
            }

        }
        
        
    }
    
   
    
    return arrayOfCalls;
}

#pragma mark Touches


-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    UITouch* touch = [touches anyObject];
    
    CGPoint pointOfTouch = [touch locationInView:_board];
    
    UIView* viewOfTouch = [_board hitTest:pointOfTouch withEvent:event];
    
    if (viewOfTouch.bounds.size.width >= _oneCall.bounds.size.width){
        
        viewOfTouch = nil;
       
    }
   
    self.draggingView = viewOfTouch;
    
     if ( self.draggingView){
    
    _earlyPlace = viewOfTouch.center;
    
    CGPoint touchPoint = [touch locationInView:self.draggingView];
    
    self.touchOffset = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - touchPoint.x,
                                   CGRectGetMidY(self.draggingView.bounds) - touchPoint.y);
    
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                         self.draggingView.alpha = 0.5f;
                     }];
    }
}


-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    if (self.draggingView){
        UITouch* touch = [touches anyObject];
        
        CGPoint pointOnMainView = [touch locationInView:_board];
        
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        
        self.draggingView.center = correction;
        
        [_board bringSubviewToFront:_draggingView];
        
       if (![_board pointInside:pointOnMainView withEvent:event])
       
       {    _draggingView.center = _earlyPlace;

           [self touchesEnded:touches withEvent:event];}
          
    }
}


- (void) onTouchesEnded {
    
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity;
                         self.draggingView.alpha = 1.f;
                     }];
    
    self.draggingView = nil;
}

-(CGFloat)  viewCenter : (CGPoint) viewCenter{
    
    double res= powf(_draggingView.center.x - viewCenter.x, 2) +
                powf(_draggingView.center.y - viewCenter.y, 2);
    
    CGFloat hypotenuse = sqrt(res);
    NSLog(@"%f",hypotenuse);
    
 
    
    
    return hypotenuse;
}

-(void) checkerCrossCall {
    
    
    NSMutableArray* choeseCsall = [NSMutableArray array];
    
    NSInteger twoCalls = 0;
    NSInteger distance = 0;
    CGFloat twoCallHelp = 10000;
    UIView* view = [[UIView alloc] init];
    
    for (UIView* view in _arrayOfCallss) {
        if (CGRectIntersectsRect(_draggingView.frame,view.frame)) {
            twoCalls = twoCalls +1;
            [choeseCsall addObject:view];
            if (twoCalls >= 2) {
                for (UIView* view1 in choeseCsall) {
                    CGFloat minDistance = [self viewCenter:view1.center];
                    if (minDistance<twoCallHelp) {
                        twoCallHelp = minDistance;
                        distance = distance +1;
                    }
                }
                break;
            }
        }
    }
    
    if (distance>=2) {
        view = [choeseCsall objectAtIndex:1];
        _draggingView.center = view.center;
    }
    
    if (distance == 1 || distance == 0 ) {view = [choeseCsall objectAtIndex:0];
        _draggingView.center = view.center;
    }
    
    [self crossCheckerToChecker];
}

-(void) crossCheckerToChecker{
    
    NSInteger cross = 0;
    for (UIView* view in _arrayOfChechers) {
        if (CGRectIntersectsRect(_draggingView.frame,view.frame)){
            cross = cross +1;
        }
    }
    if (cross>=2) {
        _draggingView.center = _earlyPlace;
    }
}


-(NSNumber*) nearPlaceToChecker:(CGPoint) centerOfCall {
    
    double res= powf(_draggingView.center.x - centerOfCall.x, 2) +
    powf(_draggingView.center.y - centerOfCall.y, 2);
    
    CGFloat hypotenuse = sqrt(res);
    
    NSLog(@"%f",hypotenuse);
    
    NSNumber* hypotenuseOfDistance = [NSNumber numberWithFloat:hypotenuse];
    
   // [arrayOfCenterOfCalls addObject: hypotenuseOfDistance];
    
    return hypotenuseOfDistance;
    
}

-(void) intersectCalls {
    
    NSInteger intersect = 0;
    
    for (UIView* view  in _arrayOfCallss) {
        
        if (CGRectIntersectsRect(view.frame, _draggingView.frame)){
            
            intersect = intersect +1;
        }
        else intersect = intersect;
    }
    
    if (!(intersect)) {
        [self checkerInGreenCall];
    }
    else [self checkerCrossCall];
    
}

-(void) checkerInGreenCall{
    
     NSMutableArray* arrayOfCenterOfCalls = [NSMutableArray array];
    
    for (UIView* view in _arrayOfCallss) {
        NSNumber* numberOfCecter = [self nearPlaceToChecker:view.center];
        [arrayOfCenterOfCalls addObject: numberOfCecter];
    }
    
    NSNumber *min=[arrayOfCenterOfCalls valueForKeyPath:@"@min.floatValue"];
    
    NSInteger numb = [arrayOfCenterOfCalls indexOfObject:min];
    
    UIView* nearView = [_arrayOfCallss objectAtIndex:numb];
    
   _draggingView.center = nearView.center;
    
    [self crossCheckerToChecker];
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (self.draggingView ){
       
        [self intersectCalls];
        
        [self onTouchesEnded];
        
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
