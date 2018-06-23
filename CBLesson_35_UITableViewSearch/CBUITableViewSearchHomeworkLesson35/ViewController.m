//
//  ViewController.m
//  CBUITableViewSearchHomeworkLesson35
//
//  Created by Alina on 28.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"
#import "CBStudents.h"
#import "CBGroupOfStudents.h"

@interface ViewController ()


@property(assign,nonatomic) CGRect keyboardRect;
@property (strong,nonatomic) NSMutableArray* arrayOfgroup;
@property (strong,nonatomic) NSMutableArray* arrayOfStudents;

@property (strong,nonatomic) NSMutableArray* titleForHeaderOfSections;

@property (strong,nonatomic) NSDateFormatter* dateFormatter;

@property (strong, nonatomic) NSOperation* currentOperation;

@end

static NSInteger countOfStudents = 500;

@implementation ViewController

-(void) loadView{
    [super loadView];
    

    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.arrayOfStudents = [NSMutableArray array];
    [self createStudents];
    [self createdSizeOfTableView];
    [self createSizeOFSegmentedControl];
    [self createDirectoryByDateOfBirth];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark Created


-(void) createSizeOFSegmentedControl{
    
    NSInteger countOfSegments = 3;
    
    for (int i = 0; i < countOfSegments; i++) {
        [self.segmentControl setWidth:CGRectGetWidth(self.view.bounds)/countOfSegments forSegmentAtIndex:i ];
    }
    
}

-(void) createdSizeOfTableView{
    
    CGRect rectOfTableView = CGRectMake(0, 100,
                             CGRectGetWidth(self.view.bounds),
                             CGRectGetHeight(self.view.bounds) - 100);

    self.tableView.frame = rectOfTableView;
}


-(void) createStudents{
    
        self.arrayOfStudents = [CBStudents createStudentWithCount:countOfStudents];
}

#pragma mark SortedToSegmentDateOfBirth


- (void) createDirectoryByDateOfBirth  {
    
    [self.arrayOfStudents sortUsingComparator:^NSComparisonResult(CBStudents *obj1, CBStudents *obj2) {
        if ([obj1 getBirthDayMonth] < [obj2 getBirthDayMonth]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        else if ([obj1 getBirthDayMonth] > [obj2 getBirthDayMonth]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        else return (NSComparisonResult)NSOrderedSame;
    }];
    
    [self createSectionsByDateOfBirth];
    
}

-(void) sectionTitleIndexForDateOfBirth{
    
    self.titleForHeaderOfSections = [NSMutableArray array];
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    
    NSMutableArray* array = [NSMutableArray array];
    
    
    for (CBGroupOfStudents* group in self.arrayOfgroup) {
        
        [dateFormat setDateFormat:@"MM"];
        
        NSString* fakeDate = [NSString stringWithFormat:@"%@",group.nameOfGroup];
        
        
        NSDate* date = [dateFormat dateFromString:fakeDate];
        
        [dateFormat setDateFormat:@"MMM"];
        
        [array addObject:[dateFormat stringFromDate:date]];
    }
    
    self.titleForHeaderOfSections = array;
    
}

-(void) createSectionsByDateOfBirth{
    
    self.arrayOfgroup = [NSMutableArray array];
    
    NSInteger firstMonth = 0;
    
    for (CBStudents* student in self.arrayOfStudents) {
        
        NSInteger currentMonth = [student getBirthDayMonth];
        
        CBGroupOfStudents* section = nil;
        
        if (!(currentMonth ==firstMonth)) {
            section = [[CBGroupOfStudents alloc] init];
            section.nameOfGroup = [NSString stringWithFormat:@"%ld",currentMonth];
            section.groupOfStudents = [NSMutableArray array];
            firstMonth = currentMonth;
            [self.arrayOfgroup addObject:section];
        } else {
            section = [self.arrayOfgroup lastObject];
        }
        
        [section.groupOfStudents addObject:student];
        
    }
    
    [self sortStudentByLastNameAndFirstName];
    
}

-(void) sortStudentByLastNameAndFirstName{
    
    /*
     NSSortDescriptor *firstName = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
     NSSortDescriptor *lastName = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
     NSArray *sortDescription = [[NSMutableArray alloc] initWithObjects: firstName, lastName, nil];
     
     */
    
    
    for (int i = 0 ; i < [self.arrayOfgroup count]; i++) {
        
        CBGroupOfStudents* group = [self.arrayOfgroup objectAtIndex:i];
        
        // [group.groupOfStudents sortUsingDescriptors:sortDescription];
        
        // }
        
        [group.groupOfStudents sortUsingComparator:^NSComparisonResult(id obj1, id  obj2) {
            
            if ([[obj1 lastName] isEqualToString:[obj2 lastName]]) {
                return [[obj1 firstName] compare:[obj2 firstName]];
            }
            
            else {
                return [[obj1 lastName] compare:[obj2 lastName]];
            }
        }];
        
    }
    
    [self sectionTitleIndexForDateOfBirth];
}


#pragma mark SortedToSegmentFirstName

-(void) createDrectoryByAlphabetOfName{
    
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    
    NSArray* sortDescriptor = [[NSArray alloc] initWithObjects:descriptor, nil];
    
    [self.arrayOfStudents sortUsingDescriptors:sortDescriptor];
    
    [self createSectionsByFirstName];
}


- (void) sortStudentsByName  {
    
    for (int i = 0 ; i < [self.arrayOfgroup count]; i++) {
        
        CBGroupOfStudents* group = [self.arrayOfgroup objectAtIndex:i];
        
        [group.groupOfStudents sortUsingComparator:^NSComparisonResult(id obj1, id  obj2) {
            
            if ([[obj1 firstName] isEqualToString:[obj2 firstName]]) {
                return [[obj1 lastName] compare:[obj2 lastName]];
            }
            
            else {
                return [[obj1 firstName] compare:[obj2 firstName]];
            }
        }];
        
    }
    
    
}

-(void) createSectionsByFirstName{
    
     self.titleForHeaderOfSections = [NSMutableArray array];
    
    self.arrayOfgroup = [NSMutableArray array];
    
    NSString* currentLetter = nil;
    
    for (CBStudents* student in self.arrayOfStudents) {
        
            if ([self.searchText.text length] > 0 && [student.firstName rangeOfString:self.searchText.text].location == NSNotFound) {
                continue;
            }
        
        NSString* firstLetter = [student.firstName substringToIndex:1];
        
        CBGroupOfStudents* group = nil;
        
        if (![currentLetter isEqualToString:firstLetter]) {
            group = [[CBGroupOfStudents alloc] init];
            group.nameOfGroup = firstLetter;
            group.groupOfStudents = [NSMutableArray array];
            currentLetter = firstLetter;
            [self.arrayOfgroup addObject:group];
        } else {
            group = [self.arrayOfgroup lastObject];
        }
        
        [group.groupOfStudents addObject:student];
        
    }
    
    
    for (int i = 0; i< [self.arrayOfgroup count]; i++) {
        
    [self.titleForHeaderOfSections addObject:[[self.arrayOfgroup objectAtIndex:i] nameOfGroup]];
    }
    
    [self sortStudentsByName];
    
}

#pragma mark SortedToSegmentLastName


-(void) createDrectoryByAlphabetOfLastName{
    
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    
    NSArray* sortDescriptor = [[NSArray alloc] initWithObjects:descriptor, nil];
    
    [self.arrayOfStudents sortUsingDescriptors:sortDescriptor];
    
    [self createSectionsByLastName];
}


- (void) sortStudentsByLastName  {
    
    for (int i = 0 ; i < [self.arrayOfgroup count]; i++) {
        
        CBGroupOfStudents* group = [self.arrayOfgroup objectAtIndex:i];
        
        [group.groupOfStudents sortUsingComparator:^NSComparisonResult(id obj1, id  obj2) {
            
            if ([[obj1 lastName] isEqualToString:[obj2 lastName]]) {
                return [[obj1 firstName] compare:[obj2 firstName]];
            }
            
            else {
                return [[obj1 lastName] compare:[obj2 lastName]];
            }
        }];
        
    }
    
    
}

-(void) createSectionsByLastName{
    
    self.titleForHeaderOfSections = [NSMutableArray array];
    
    self.arrayOfgroup = [NSMutableArray array];
    
    NSString* currentLetter = nil;
    
    for (CBStudents* student in self.arrayOfStudents) {
        
        if ([self.searchText.text length] > 0 && [student.lastName rangeOfString:self.searchText.text].location == NSNotFound) {
            continue;
        }
        
        NSString* firstLetter = [student.lastName substringToIndex:1];
        
        CBGroupOfStudents* group = nil;
        
        if (![currentLetter isEqualToString:firstLetter]) {
            group = [[CBGroupOfStudents alloc] init];
            group.nameOfGroup = firstLetter;
            group.groupOfStudents = [NSMutableArray array];
            currentLetter = firstLetter;
            [self.arrayOfgroup addObject:group];
        } else {
            group = [self.arrayOfgroup lastObject];
        }
        
        [group.groupOfStudents addObject:student];
        
    }
    
    
    for (int i = 0; i< [self.arrayOfgroup count]; i++) {
        
        [self.titleForHeaderOfSections addObject:[[self.arrayOfgroup objectAtIndex:i] nameOfGroup]];
    }
    
    [self sortStudentsByLastName];
    
}

#pragma mark UISearchBarDelegate


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [self generateSectionsInBackgroundFromArray];
    
}

- (void) generateSectionsInBackgroundFromArray {
    
    [self.currentOperation cancel];
    
    __weak ViewController* weakSelf = self;
    
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        switch (self.sender.selectedSegmentIndex) {
            case 0:
                [self createDirectoryByDateOfBirth];
                
                break;
            case 1:
                [self createDrectoryByAlphabetOfName];
                
                break;
            case 2:
                [self createDrectoryByAlphabetOfLastName];
                
                break;
                
            default:
                break;
        }

        
        dispatch_async(dispatch_get_main_queue(), ^{
           // weakSelf.arrayOfgroup = [NSMutableArray arrayWithArray:sectionsArray];
            [weakSelf.tableView reloadData];
            
            self.currentOperation = nil;
        });
    }];
    
    [self.currentOperation start];
}





- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}


#pragma mark UITableViewDataSource


- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView{

    return  self.titleForHeaderOfSections;
}

- ( NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
   
    
    
    return [self.titleForHeaderOfSections objectAtIndex:section];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
     return [self.arrayOfgroup count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     CBGroupOfStudents* group = [self.arrayOfgroup objectAtIndex:section];
    
    
    return [group.groupOfStudents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    static NSString* identifier = @"Cell";
    
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    CBGroupOfStudents* group = [self.arrayOfgroup objectAtIndex:indexPath.section];
    
    CBStudents* student = [group.groupOfStudents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                           student.firstName,student.lastName];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",
                                [dateFormat stringFromDate:student.dateOfBirth]];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action

- (IBAction)actionChoiseOfSorting:(UISegmentedControl *)sender {
    
    self.arrayOfgroup = [NSMutableArray array];
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self createDirectoryByDateOfBirth];

            break;
        case 1:
            [self createDrectoryByAlphabetOfName];

            break;
        case 2:
            [self createDrectoryByAlphabetOfLastName];
            
            break;
            
        default:
            break;
    }
    [self.tableView reloadData];
    
}

#pragma mark Notifications

- (void)keyboardWillChange:(NSNotification *)notification {
    
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    NSLog(@"%@",NSStringFromCGRect(self.keyboardRect));
    NSLog(@"%f",self.keyboardRect.origin.y);

    self.tableView.frame = CGRectMake(0,100, CGRectGetWidth(self.view.bounds), self.keyboardRect.origin.y - 100);
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
