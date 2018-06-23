//
//  ViewController.m
//  CBGeometryHomeworkLesson19
//
//  Created by Alina on 13.11.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"

const NSInteger countOfCellToRow = 8;

@interface ViewController ()

@property(weak,nonatomic) UIView* board;
@property(strong,nonatomic) UIColor* color;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    UIView* boardView = [[UIView alloc] initWithFrame:
                         
                    CGRectMake(self.view.center.x - self.view.bounds.size.width/2,
                               self.view.center.y - self.view.bounds.size.width/2,
                               self.view.bounds.size.width,
                               self.view.bounds.size.width)];
    
    
   
    
    boardView.backgroundColor = [UIColor whiteColor];
    
    boardView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                 UIViewAutoresizingFlexibleRightMargin |
                                 UIViewAutoresizingFlexibleLeftMargin |
                                 UIViewAutoresizingFlexibleBottomMargin ;
    
    
    [self.view addSubview:boardView];
    
    NSMutableArray* arrayOfCallsAndCheckers = [self boardView:boardView colorOfCells:[UIColor blackColor]];
    
    for (UIView* viewOfCallsOrCheckers in arrayOfCallsAndCheckers) {
        [boardView addSubview:viewOfCallsOrCheckers];
       
    }
    
    self.board = boardView;
}

-(NSMutableArray*) boardView:(UIView*) boardView colorOfCells:(UIColor*) colorOfCells{
    
    NSMutableArray* arrayOfCalls = [NSMutableArray array];
    
    CGSize sizeOfCell = CGSizeMake(boardView.bounds.size.width/countOfCellToRow,
                                   boardView.bounds.size.height/countOfCellToRow);
    CGRect rectOfCells = CGRectMake(0, 0, sizeOfCell.width, sizeOfCell.height);
    
    
    for (int i = 0; i < 8; i++) {
        for (int w = 0; w < 4; w++) {
            if (i % 2) {
                       rectOfCells.origin.x = w * 2 * rectOfCells.size.width;
                
            }
            else      { rectOfCells.origin.x = (w * 2 + 1) * rectOfCells.size.width;
                }
            
            rectOfCells.origin.y = i * rectOfCells.size.height;
            
            UIView* viewsOfCalls = [[UIView alloc] initWithFrame:rectOfCells];
            
            viewsOfCalls.backgroundColor = colorOfCells;
            
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



-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    NSMutableArray* arrayOfCheckers = [NSMutableArray array];

    NSArray* arrayOfColors = [NSArray arrayWithObjects:
                              [UIColor darkGrayColor],
                              [UIColor greenColor],
                              [UIColor yellowColor], nil];
     UIColor* color = [arrayOfColors objectAtIndex:arc4random()%[arrayOfColors count]];
    
    for (UIView* view in _board.subviews) {
        if (((view.backgroundColor == [UIColor redColor])||(view.backgroundColor == [UIColor whiteColor]))) {
            [arrayOfCheckers addObject:view];
        }
        else if (view.backgroundColor == [UIColor blackColor]){
            view.backgroundColor = color;
                   }
        else view.backgroundColor = [UIColor blackColor];

    }
   
   
    for (int i = 0 ; i < [arrayOfCheckers count]; i++) {
        
        UIView* view  = [arrayOfCheckers objectAtIndex:arc4random()%[arrayOfCheckers count]];
        UIView* view2 = [arrayOfCheckers objectAtIndex:arc4random()%[arrayOfCheckers count]];
            
        CGRect rect = view.frame;
        view.frame = view2.frame;
        view2.frame = rect;
        [_board bringSubviewToFront:view];
        [_board bringSubviewToFront:view2];
        
        }
   
}

  

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
