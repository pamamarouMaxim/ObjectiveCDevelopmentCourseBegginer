//
//  CBViewControllerEducation.m
//  CBPopoverHomeworkLesson36
//
//  Created by Alina on 03.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBViewControllerEducation.h"


@interface CBViewControllerEducation ()

@end

@implementation CBViewControllerEducation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfEducation = [NSArray array];
    NSArray*array = [[NSArray alloc] initWithObjects:@"soldat",@"polcovnic",@"general",@"genegalissimus", nil];
    
    self.arrayOfEducation = array;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark   UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return [self.arrayOfEducation count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifire = @"Cell";
    
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifire];
    
    cell.textLabel.text = [self.arrayOfEducation objectAtIndex:indexPath.row];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath

{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    self.levelOfEducation = [self.arrayOfEducation objectAtIndex:indexPath.row];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath


{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

#pragma mark SenderEducationToTextfield

- (IBAction)actionFixedEducation:(UIButton *)sender {
    
    [self.delegate dataFromEducationPickerController:self.levelOfEducation];
    
     [self dismissViewControllerAnimated:YES completion:nil];
    
    

}
@end
