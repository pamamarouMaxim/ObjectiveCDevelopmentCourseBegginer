//
//  CBTableViewController.m
//  CBMKMepViewHWLesson37-38
//
//  Created by Alina on 05.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBTableViewController.h"
#import <MapKit/MapKit.h>

@interface CBTableViewController ()

@end

@implementation CBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addTitleForCell:(NSMutableArray*) array{
    self.array = array;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.array count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",self.array);
    
    static NSString* identificator = @"Cell";
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identificator];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identificator];
        
        cell = [self titleForCell:cell :indexPath];
        
    }
    else cell = [self titleForCell:cell :indexPath];
    
    return cell;
}

-(UITableViewCell*) titleForCell:(UITableViewCell*) cell :(NSIndexPath*) indexPath{
    
     cell.detailTextLabel.text = [self.array objectAtIndex:indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Country" ;
            
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"Name";
            return cell;
            break;

        case 2:
            cell.textLabel.text = @"Date of birth";
              return cell;
                       break;

        case 3:
            cell.textLabel.text = @"Sex";
              return cell;
                       break;

        default:
            break;
    }
      return cell;
}




@end
