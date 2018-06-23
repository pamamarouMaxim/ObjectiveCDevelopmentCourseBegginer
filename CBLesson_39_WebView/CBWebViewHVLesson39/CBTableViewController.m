//
//  CBTableViewController.m
//  CBWebViewHVLesson39
//
//  Created by Alina on 07.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBTableViewController.h"
#import "CBWebViewController.h" 
@interface CBTableViewController ()

@end

@implementation CBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString* urlString = @"http://vk.com/iosdevcourse";
    
    NSString* urlStringTwo = @"https://www.youtube.com";
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];
    
    NSString* filePathTwo = [[NSBundle mainBundle] pathForResource:@"2.pdf" ofType:nil];
    
    self.labelURLOne.text = urlString;
    self.labelURLTwo.text = urlStringTwo;
    self.labelPDFOne.text = filePath;
    self.labelPDFTwo.text = filePathTwo;
    

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"%@",cell.textLabel.text);
    
    CBWebViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CBWebViewController"];
    
    controller.adressToMove = cell.textLabel.text;
    
    [self.navigationController pushViewController:controller animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



@end
