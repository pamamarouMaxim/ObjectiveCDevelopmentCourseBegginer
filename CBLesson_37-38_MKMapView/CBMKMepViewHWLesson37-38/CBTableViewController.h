//
//  CBTableViewController.h
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 05.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CBTableViewController : UITableViewController


@property (strong,nonatomic) NSArray* array;


-(void) addTitleForCell:(NSMutableArray*) array;

@end


