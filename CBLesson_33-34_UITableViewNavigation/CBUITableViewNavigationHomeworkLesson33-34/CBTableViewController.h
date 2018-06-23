//
//  CBTableViewController.h
//  CBUITableViewNavigationHomeworkLesson33-34
//
//  Created by Alina on 25.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTableViewController : UITableViewController

@property (strong,nonatomic) NSString* path;

- (id)initWithFolderPath:(NSString*) path;

@end
