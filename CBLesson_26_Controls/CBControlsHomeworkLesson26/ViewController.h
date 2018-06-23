//
//  ViewController.h
//  CBControlsHomeworkLesson26
//
//  Created by Alina on 10.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageForApp;

@property (weak, nonatomic) IBOutlet UISegmentedControl *changeImages;

@property (weak, nonatomic) IBOutlet UISwitch *switchOfTranslation;

@property (weak, nonatomic) IBOutlet UISwitch *switchOfRotation;

@property (weak, nonatomic) IBOutlet UISwitch *switchOfScale;


- (IBAction)actionSwitchTranslation:(UISwitch *)sender;

- (IBAction)actionSwitchRotation:(UISwitch *)sender;

- (IBAction)actionSwitchScale:(UISwitch *)sender;

- (IBAction)actionSpeedChange:(UISlider *)sender;

- (IBAction)actionChangeTheImage:(UISegmentedControl *)sender;


@end

