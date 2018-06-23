//
//  ViewController.m
//  CBUIBottonHomeworkLesson25
//
//  Created by Alina on 06.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic) NSMutableString* numberOfDigits;
@property(assign,nonatomic) CGFloat firstNumber;
@property(assign,nonatomic) CGFloat secondNumber;

@property(assign,nonatomic) NSInteger repeatOperation;



@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableString * string = [[NSMutableString alloc] init];
    
    _numberOfDigits = string;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionOfNumbers:(UIButton *)sender {
    
    self.repeatOperation = 0;
    
    if (!(sender.currentTitle == [NSString stringWithFormat:@"0"] )){
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:sender.currentTitle]];
        
        self.figureOnTheScreen.text = self.numberOfDigits;
        
    }

    
}


- (IBAction)actionOperation:(UIButton *)sender {
    
    self.repeatOperation = 0;

    
    [self operationOnNumbers:sender.tag];

    _firstNumber = [self.numberOfDigits integerValue];
    
    self.figureOnTheScreen.text =[NSString stringWithFormat:
                                  @"%@",sender.currentTitle];
    
     [self removeSymbolInString];
  
}


-(void) operationOnNumbers:(NSInteger) numberOfOperation{
    
    switch (numberOfOperation) {
        case 11:
            self.operationOnNumbers = CBOperationOnNumbersPlus;
            break;
        case 12:
             self.operationOnNumbers = CBOperationOnNumbersMinus;
            break;
        case 13:
             self.operationOnNumbers = CBOperationOnNumbersMultiply;
            break;
        case 14:
             self.operationOnNumbers = CBOperationOnNumbersDevide;
            break;
            
        default:
            break;
    }
}


- (IBAction)endingResult:(UIButton *)sender {
    
    self.secondNumber  = [self.numberOfDigits integerValue];
    
    self.repeatOperation = self.repeatOperation +1;
    
    
    switch ( self.operationOnNumbers) {
        case CBOperationOnNumbersPlus:      [self resultOperationPlus];       break;
            
        case CBOperationOnNumbersMinus:     [self resultOperationMinus];      break;
            
        case CBOperationOnNumbersMultiply:  [self resultOperationMultiply];   break;
            
        case CBOperationOnNumbersDevide:    [self resultOperationDevide];      break;
            
        default:
            break;
    }
}



#pragma mark OperationPlus

-(void) resultOperationPlus{
    if (_repeatOperation < 2 ){
        
        self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationPlus]];
        
        [self removeSymbolInString];
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationPlus]]]];
        
        _firstNumber = _secondNumber;
    }
    
    else {  self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationPlus]];
        
        [self removeSymbolInString];
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationPlus]]]];
        
    }

}

-(CGFloat) operationPlus {
    CGFloat result = _secondNumber + _firstNumber;
    return result;
}

#pragma mark OperetionMinus

-(void) resultOperationMinus {
    if (_repeatOperation <2) {
        
        
        self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationMinus]];
        
        [self removeSymbolInString];
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationMinus]]]];
        _firstNumber = _secondNumber;
    }
    else {
        self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationMinus]];
        
        [self removeSymbolInString];
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationMinus]]]];
    }

}

-(CGFloat) operationMinus {
    CGFloat result =  _firstNumber - _secondNumber ;
    
    if (_repeatOperation >1){
        result = _secondNumber - _firstNumber;
    }
    return result;
}

#pragma mark OperationMultiply

-(void) resultOperationMultiply{
    
    if (_repeatOperation<2){
        
        self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationMultiply]];
        
        [self removeSymbolInString];
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationMultiply]]]];
        
        _firstNumber = _secondNumber;
        
    }
    else {
        self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationMultiply]];
        
        [self removeSymbolInString];
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationMultiply]]]];
        
    }
    
}

-(CGFloat) operationMultiply {
    CGFloat result = _secondNumber*_firstNumber;
    return result;
}

#pragma mark OperationDevide

-(void) resultOperationDevide{
    
    if(_repeatOperation <2) {
        
        self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationDevide]];
        
        [self removeSymbolInString];
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationDevide]]]];
        
        _firstNumber = _secondNumber;
    }
    
    else {
        
        self.figureOnTheScreen.text =[NSString stringWithFormat:@"%f",[self operationDevide]];
        
        [self removeSymbolInString];
        
        [self.numberOfDigits appendString:[NSMutableString stringWithString:[NSString stringWithFormat:@"%f",[self operationDevide]]]];
        
    }

}


-(CGFloat) operationDevide {
    CGFloat result =  _firstNumber/_secondNumber;
    
    if (_repeatOperation >1){
        result = _secondNumber/_firstNumber;
    }
    return result;
}


-(void) removeSymbolInString{
    [_numberOfDigits deleteCharactersInRange:NSMakeRange(0, _numberOfDigits.length)];
}


- (IBAction)resetCalculation:(UIButton *)sender {
    
    self.repeatOperation = 0;
    
    _firstNumber  = 0;
    _secondNumber = 0;
    
    [_numberOfDigits deleteCharactersInRange:NSMakeRange(0, _numberOfDigits.length)];
    self.figureOnTheScreen.text =[NSString stringWithFormat:
                                  @"0"];
    
}

- (IBAction)actionPlusMinus:(UIButton *)sender {
    
    
    CGFloat plusMinus = [self.figureOnTheScreen.text integerValue] * (-1);
    
    
    self.figureOnTheScreen.text = [NSString stringWithFormat:@"%f",plusMinus];
    
    [self removeSymbolInString];
    
    
     [_numberOfDigits appendString:[NSMutableString stringWithString:self.figureOnTheScreen.text]];
    
    
}

- (IBAction)actionProcent:(UIButton *)sender {
    
    CGFloat procent = [self.figureOnTheScreen.text integerValue];
    
    procent = procent/100;
    
    self.figureOnTheScreen.text = [NSString stringWithFormat:@"%f",procent];
    
    
    
    
}
@end
