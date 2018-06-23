//
//  UIView+MKAnnotationView.m
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 05.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "UIView+MKAnnotationView.h"
#import "Mapkit/MKAnnotationView.h"

@implementation UIView (MKAnnotationView)

-(MKAnnotationView*) superAnnotationView{
    
    if ([self isKindOfClass:[MKAnnotationView class]]) {
        return (MKAnnotationView*)self ;
    }
    
    if (!self.superview) {
        return nil;
    }
    
    return [self.superview superAnnotationView];
}

@end
