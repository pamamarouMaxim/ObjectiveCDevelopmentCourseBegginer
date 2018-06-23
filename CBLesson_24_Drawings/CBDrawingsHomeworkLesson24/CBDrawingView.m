//
//  CBDrawingView.m
//  CBDrawingsHomeworkLesson24
//
//  Created by Alina on 30.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBDrawingView.h"

@implementation CBDrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
   CGContextRef context = UIGraphicsGetCurrentContext();
  /*
CGPoint center = CGPointMake((float)(arc4random()%((int)CGRectGetWidth (rect)-100*2)+100) ,
                             (float)(arc4random()%((int)CGRectGetHeight(rect)-100*2)+100));
    
   CGContextMoveToPoint(context,center.x, center.y);
    */
    
   // NSArray* arrayOfPoint = [self angleOfStar:rect context:context];
    
       for (int countOfStar = 0; countOfStar< 4; countOfStar ++) {
           NSArray* arrayOfPoint = [self angleOfStar:rect context:context];

           [self createStars: arrayOfPoint context:context];
           [self createElipse:arrayOfPoint context:context];
           [self lineElipse:  arrayOfPoint context:context];
           

    }
    
    /*
    for (NSValue* pointValue in array) {
        CGPoint point = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x, point.y);
        
        
         }
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
     CGContextFillPath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokePath(context);
   
   
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    for (int i = 0 ; i < [array count]; i ++) {
        
        if (!(i%2)){
            
        CGPoint point = [[array objectAtIndex:i] CGPointValue];
        CGContextAddEllipseInRect(context, CGRectMake(point.x - 25, point.y-25
                                                      , 50, 50));
            
            CGContextFillPath(context);
       }
    }
     */
  

    
    
  //  [self makeStar:context rectOfView:rect];

  
}

-(void) lineElipse:(NSArray*) arrayOfPoint context:(CGContextRef) context{
   
    CGContextSetStrokeColorWithColor(context, [self setColor].CGColor);
    
    CGPoint startPoint = [[arrayOfPoint objectAtIndex:0] CGPointValue];
    
    CGContextMoveToPoint(context,startPoint.x, startPoint.y);
    
   
    
    for (int i = 1; i<[arrayOfPoint count] ; i++) {
         CGPoint firstPoint = [[arrayOfPoint objectAtIndex:i] CGPointValue];
        
       
        
        // CGPoint secondPoint = [[arrayOfPoint objectAtIndex:i+1] CGPointValue];
         if (!(i%2)){
            CGPoint nextPoint =  [[arrayOfPoint objectAtIndex:i] CGPointValue];
             NSLog(@"%@",NSStringFromCGPoint(nextPoint));
            CGContextAddLineToPoint(context, nextPoint.x, nextPoint.y);
             CGContextStrokePath(context);
         }
    }
    
}




-(void) createElipse:(NSArray*) arrayOfPoint context:(CGContextRef) context{
    CGContextSetFillColorWithColor(context, [self setColor].CGColor);
   
    CGFloat sizeOfElipse = arc4random()% 30;
    
    
    for (int i = 0 ; i < [arrayOfPoint count]; i ++) {
        
        if (!(i%2)){
            
            CGPoint point = [[arrayOfPoint objectAtIndex:i] CGPointValue];
            CGContextAddEllipseInRect(context, CGRectMake(point.x - sizeOfElipse/2, point.y-sizeOfElipse/2
                                                          , sizeOfElipse, sizeOfElipse));
            CGContextFillPath(context);
        }
    }

}



-(void) createStars:(NSArray*) arrayOfPoint context:(CGContextRef) context{
    
    
    for (NSValue* pointValue in arrayOfPoint) {
        
        CGPoint point = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x, point.y);
        
    }
    CGContextSetFillColorWithColor(context, [self setColor].CGColor);
    CGContextFillPath(context);
    CGContextSetStrokeColorWithColor(context, [self setColor].CGColor);
    CGContextStrokePath(context);
    
}


-(NSArray*) angleOfStar:(CGRect) rect context:(CGContextRef) context{
    
    CGPoint center = CGPointMake(
                     (float)(arc4random()%((int)CGRectGetWidth (rect)-200)+100) ,
                     (float)(arc4random()%((int)CGRectGetHeight(rect)-200)+100));
    
    CGContextMoveToPoint(context,center.x, center.y);
    
    CGFloat sizeOfStar = 20 + arc4random()%40;
    
    CGPoint rightAngle1 = CGPointMake(center.x + sizeOfStar*sinf(18*M_PI/180),  center.y + sizeOfStar*cosf(18*M_PI/180));
    
    CGPoint rightAngle2 = CGPointMake(center.x + sizeOfStar*sinf(18*M_PI/180) + sizeOfStar,   center.y + sizeOfStar*cosf(18*M_PI/180));
    
    CGPoint rightAngle3 = CGPointMake(center.x + sizeOfStar*sinf(18*M_PI/180) + sizeOfStar - sizeOfStar*cosf(36*M_PI/180),  center.y + sizeOfStar*cosf(18*M_PI/180)+sizeOfStar*sinf(36*M_PI/180));
    
    CGPoint rightAngle4 = CGPointMake(center.x + sizeOfStar*sinf(18*M_PI/180) + sizeOfStar - sizeOfStar*cosf(36*M_PI/180) + sizeOfStar*sinf(18*M_PI/180),  center.y + sizeOfStar*cosf(18*M_PI/180)+sizeOfStar*sinf(36*M_PI/180)+sizeOfStar*cosf(18*M_PI/180));
    
    CGPoint rightAngle5 = CGPointMake(center.x,  center.y + sizeOfStar*cosf(18*M_PI/180)+sizeOfStar*sinf(36*M_PI/180)+sizeOfStar*cosf(18*M_PI/180) - sizeOfStar*cosf(54*M_PI/180));
    
     CGPoint rightAngle6 = CGPointMake(center.x - sizeOfStar*sinf(18*M_PI/180)- sizeOfStar+ sizeOfStar*cosf(36*M_PI/180)- sizeOfStar*sinf(18*M_PI/180),  center.y + sizeOfStar*cosf(18*M_PI/180)+sizeOfStar*sinf(36*M_PI/180)+sizeOfStar*cosf(18*M_PI/180));
    
    CGPoint rightAngle7 = CGPointMake(center.x - sizeOfStar*sinf(18*M_PI/180)- sizeOfStar+ sizeOfStar*cosf(36*M_PI/180),  center.y + sizeOfStar*cosf(18*M_PI/180)+sizeOfStar*sinf(36*M_PI/180));
    
    CGPoint rightAngle8 = CGPointMake(center.x - sizeOfStar*sinf(18*M_PI/180)- sizeOfStar,  center.y + sizeOfStar*cosf(18*M_PI/180));
    
    CGPoint rightAngle9 = CGPointMake(center.x - sizeOfStar*sinf(18*M_PI/180),  center.y + sizeOfStar*cosf(18*M_PI/180));
    
    CGPoint rightAngle10 = center;
    
    
    NSArray* angleOfStar =  [[NSArray alloc]initWithObjects:
                             [NSValue valueWithCGPoint:center],
                             [NSValue valueWithCGPoint:rightAngle1],
                             [NSValue valueWithCGPoint:rightAngle2],
                             [NSValue valueWithCGPoint:rightAngle3],
                             [NSValue valueWithCGPoint:rightAngle4],
                             [NSValue valueWithCGPoint:rightAngle5],
                             [NSValue valueWithCGPoint:rightAngle6],
                             [NSValue valueWithCGPoint:rightAngle7],
                             [NSValue valueWithCGPoint:rightAngle8],
                             [NSValue valueWithCGPoint:rightAngle9],
                             [NSValue valueWithCGPoint:rightAngle10],nil];
    return angleOfStar;
    
}

-(UIColor*) setColor{
    CGFloat r = (float)(arc4random()%256) / 255.f;
    CGFloat g = (float)(arc4random()%256) / 255.f;
    CGFloat b = (float)(arc4random()%256) / 255.f;
    
    UIColor* randomColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    return randomColor;
}









@end
