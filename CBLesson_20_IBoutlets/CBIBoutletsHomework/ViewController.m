//
//  ViewController.m
//  CBIBoutletsHomework
//
//  Created by Alina on 17.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIColor*) color {
    
    CGFloat r = (float)(arc4random()%256) / 255;
    CGFloat g = (float)(arc4random()%256) / 255;
    CGFloat b = (float)(arc4random()%256) / 255;

    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}



-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
   
    UIColor* colorOfCalls = [self color];
    
  for (UIView* blackCalls in _blackCalls) {
      
       blackCalls.backgroundColor = colorOfCalls;
     
    }
    
    for (int i = 0 ; i < [_whiteAndRedCheckers count]; i++){
        
        UIView* firstChecker  = [_whiteAndRedCheckers objectAtIndex:arc4random()%[_whiteAndRedCheckers count]];
        UIView* secondChecker = [_whiteAndRedCheckers objectAtIndex:arc4random()%[_whiteAndRedCheckers count]];
        
        CGRect rectOfFirstChecker = firstChecker.frame;
        firstChecker.frame = secondChecker.frame;
        secondChecker.frame = rectOfFirstChecker;
        
        
    }
    
    
}
@end
