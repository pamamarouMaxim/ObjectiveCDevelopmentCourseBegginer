//
//  ViewController.m
//  CBDrawingsHomeworkLesson24
//
//  Created by Alina on 30.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"
#import "CBDrawingView.h"

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

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [self.drawingView setNeedsDisplay];
}

@end
