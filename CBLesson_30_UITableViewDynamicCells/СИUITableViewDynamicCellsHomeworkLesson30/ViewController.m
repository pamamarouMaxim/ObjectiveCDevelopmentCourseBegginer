//
//  ViewController.m
//  СИUITableViewDynamicCellsHomeworkLesson30
//
//  Created by Alina on 19.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"
#import "CBStudents.h"
#import "CBGroupesOfStudents.h"

typedef enum : NSUInteger {
    CBStudentGropeFive    ,
    CBStudentGropeFour    ,
    CBStudentGropeThree   ,
    CBStudentGropeTwo     ,
    
} CBStudentGrope;

static NSInteger countOfStudent = 100;
static NSInteger countOfGroup = 4;


@interface ViewController ()

@property (strong,nonatomic) NSMutableArray* arrayOfStudents;
@property (strong,nonatomic) NSMutableArray* arrayOfGroup;
@property (strong,nonatomic) NSMutableArray* arrayGropeOfStudents;
@property (strong,nonatomic) NSArray* sortedArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createStudents];
    
    [self createGroup];
    
    [self sortedStudents];
    
    [self gropeOfStudents];
    
    
    self.tableView.frame = self.view.bounds;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //                   If You need a EDGE
    /*
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 100, 0);
    
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
   */
    
}

#pragma mark SortedStudentToGroupeAndSortedName

-(void) gropeOfStudents{
    
    for (int i = 0; i<countOfGroup; i++) {
        
        self.arrayGropeOfStudents = [NSMutableArray array];
        
        for (CBStudents* student in self.sortedArray ) {
            
            
            if (student.numberOfGroup == i) {
                [self.arrayGropeOfStudents addObject:student];
            }
            }
        
            CBGroupesOfStudents* grope = [self.arrayOfGroup objectAtIndex:i];
            grope.arrayGroupOfStudents = self.arrayGropeOfStudents;
        

    }
    
}

-(void) sortedStudents {
    
    NSArray* array = [[NSArray alloc]init];
    
    array = [self.arrayOfStudents sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([[obj1 lastName] compare:[obj2 lastName]] ==NSOrderedAscending){
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([[obj1 lastName] compare:[obj2 lastName]] ==NSOrderedDescending){
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    self.sortedArray = array;
    
    
}

#pragma mark CreateStudentsWithGroup

-(void) createStudents{
    self.arrayOfStudents = [NSMutableArray array];

        for (int i = 0;  i <  countOfStudent; i++) {
             CBStudents* student = [CBStudents randomStudent];
            [self student : student];
            [self.arrayOfStudents addObject:student];
        }
}

-(void) student :(CBStudents*) student{
    
    switch (student.averageScore) {
        case 5:
            student.numberOfGroup = CBStudentGropeFive;
            break;
        case 4:
            student.numberOfGroup = CBStudentGropeFour;
            break;
        case 3:
            student.numberOfGroup = CBStudentGropeThree;
            break;
        case 2:
            student.numberOfGroup = CBStudentGropeTwo;
            break;
            
        default:
            break;
    }
}


#pragma mark CreateGroupeWithName

-(void)createGroup{
    self.arrayOfGroup = [NSMutableArray array];

    for (int i = 0; i<countOfGroup; i++) {
        CBGroupesOfStudents* groupe  = [CBGroupesOfStudents createGroupesOfStudents];
        
        [self nameOfGroup:i :groupe];
        
        [self.arrayOfGroup addObject:groupe];
        
        
    }
   
}

-(void) nameOfGroup :(NSInteger) groupNumber :(CBGroupesOfStudents*) group{
    
    switch (groupNumber) {
        case 0:
            group.nameOfGroup = [NSString stringWithFormat:@"Отличники"];
            break;
        case 1:
            group.nameOfGroup = [NSString stringWithFormat:@"Хорошисты"];
            break;
        case 2:
            group.nameOfGroup = [NSString stringWithFormat:@"Троечники"];
            break;
        case 3:
            group.nameOfGroup = [NSString stringWithFormat:@"Двоечники"];
            break;
            
        default:
            break;
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ColorOfCell

-(CGFloat) numberOfColor{
    CGFloat numberOfColor = (float)(arc4random()%256)/255;
    return numberOfColor;
}


-(UIColor*) colorOfCell{
    
    UIColor* colorOfCell = [UIColor colorWithRed:[self numberOfColor]
                                           green:[self numberOfColor]
                                            blue:[self numberOfColor]
                                           alpha:1];
    
    return colorOfCell;
}



#pragma mark UITableViewDataSource



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.arrayOfGroup count]  + 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section < [self.arrayOfGroup count]) {
        CBGroupesOfStudents* group = [self.arrayOfGroup objectAtIndex:section];
        
        return [group.arrayGroupOfStudents count] ;

    }
    
    else return 10;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* indentifier;
    
    UITableViewCell* cell ;
    
    if (indexPath.section < [self.arrayOfGroup count]) {
        
        CBGroupesOfStudents* groupOfstudents = [self.arrayOfGroup objectAtIndex:indexPath.section];
        
        CBStudents* studentInCell = [groupOfstudents.arrayGroupOfStudents objectAtIndex:indexPath.row];
        
        
         indentifier = @"Cell";
        
     cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
            
            
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                                   studentInCell.firstName,studentInCell.lastName];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",
                                         (long)studentInCell.averageScore];
            
            
            
        } else {
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                                   studentInCell.firstName,studentInCell.lastName];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",
                                         (long)studentInCell.averageScore];
        }}
    else{
        
        indentifier = @"ColorOfCell";
        
        cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        
        if (!cell) {
             cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        
        cell.backgroundColor = [self colorOfCell];
        
        const CGFloat* color = CGColorGetComponents(cell.backgroundColor.CGColor);
        
        cell.textLabel.text = [NSString stringWithFormat:@"red = %.2f green = %.2f blue = %.2f",color [0],color[1],color[2]];
    }
    return cell;
}



@end
