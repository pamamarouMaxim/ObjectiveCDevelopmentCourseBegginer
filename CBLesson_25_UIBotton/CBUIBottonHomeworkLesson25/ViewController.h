//
//  ViewController.h
//  CBUIBottonHomeworkLesson25
//
//  Created by Alina on 06.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CBOperationOnNumbers){
    
    CBOperationOnNumbersPlus,
    CBOperationOnNumbersMinus,
    CBOperationOnNumbersMultiply,
    CBOperationOnNumbersDevide
   
};


@interface ViewController : UIViewController

@property (assign,nonatomic) CBOperationOnNumbers operationOnNumbers;

@property (weak, nonatomic) IBOutlet UILabel *figureOnTheScreen;

- (IBAction)actionPlusMinus:(UIButton *)sender;

- (IBAction)actionProcent:(UIButton *)sender;

- (IBAction)endingResult:(UIButton *)sender;

- (IBAction)resetCalculation:(UIButton *)sender;

- (IBAction)actionOfNumbers: (UIButton *)sender;

- (IBAction)actionOperation: (UIButton *)sender;

@end

