//
//  ViewController.h
//  CBUITableViewSearchHomeworkLesson35
//
//  Created by Alina on 28.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UISearchBar *searchText;

@property (weak, nonatomic) IBOutlet UISegmentedControl *sender;

- (IBAction)actionChoiseOfSorting:(UISegmentedControl *)sender;

@end

