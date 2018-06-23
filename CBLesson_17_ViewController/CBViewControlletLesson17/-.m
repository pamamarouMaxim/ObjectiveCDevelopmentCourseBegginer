//
//  ViewController.m
//  CBViewControlletLesson17
//
//  Created by Alina on 10.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark Loading

-(void) loadView{
    [super loadView];
    NSLog(@"loadView");
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
    
}

#pragma mark View
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     NSLog(@"viewWillAppear");
}

-(void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

-(void)  viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
    // Dispose of any resources that can be recreated.
}

#pragma mark - Orientation

-(BOOL) shouldAutorotate{
    return NO;
}
















@end
