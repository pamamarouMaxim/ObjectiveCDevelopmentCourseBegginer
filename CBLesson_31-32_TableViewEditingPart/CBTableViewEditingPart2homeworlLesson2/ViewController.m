//
//  ViewController.m
//  CBTableViewEditingPart2homeworlLesson2
//
//  Created by Alina on 22.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "ViewController.h"
#import "CBSportsman.h"
#import "CBGroup.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray* arrayOfGroup;
@property (weak,nonatomic) UITableView* tableView;

@end

@implementation ViewController

-(void) loadView{
    [super loadView];
    
    CGRect rectOfTableView =  self.view.bounds;
    
     rectOfTableView.origin = CGPointZero;
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:rectOfTableView style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    
    self.tableView.allowsSelectionDuringEditing = NO;
    
    self.arrayOfGroup = [NSMutableArray array];
    
    NSInteger numberOfGroup = ((arc4random() % 6) + 5);
    
    for (int i = 0; i < numberOfGroup; i++) {
        
        CBGroup* group = [CBGroup createGroup];
        group.nameOfGroup = [NSString stringWithFormat:@"Group #%ld", numberOfGroup - i ];
        
        NSMutableArray* array = [NSMutableArray array];
        
        for (int j = 0; j < ((arc4random() % 11) + 15); j++) {
            [array addObject:[CBSportsman createSportsmen]];
        }
        
        group.arrayOfSportsmen = array;
        
        [self.arrayOfGroup addObject:group];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"kinds of sports";
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
      UIBarButtonItem* addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAdd:)];
    
    
    self.navigationItem.leftBarButtonItem = addButton;
        
}



#pragma mark Action

-(void) actionAdd:(UIBarButtonItem*) sender {
    
    
    CBGroup* group = [[CBGroup alloc] init];
    
    group.nameOfGroup = [NSString stringWithFormat:@"Group #%u", [self.arrayOfGroup count] +1];
    
    group.arrayOfSportsmen = @[[CBSportsman createSportsmen], [CBSportsman createSportsmen], [CBSportsman createSportsmen]];
    
    NSInteger newSectionIndex = 0;
    
    [self.arrayOfGroup insertObject:group atIndex:newSectionIndex];
    
    
    [self.tableView beginUpdates];
    
    NSIndexSet* insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
    
    
    UITableViewRowAnimation animation = UITableViewRowAnimationFade;
    
    animation = UITableViewRowAnimationLeft;
    
    [self.tableView insertSections:insertSections
                  withRowAnimation:animation];
    
    [self.tableView endUpdates];
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });

    
}

-(void) actionEdit:(UIBarButtonItem*) sender {
    
    BOOL isEditing = self.tableView.editing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    [self.navigationItem setRightBarButtonItem:editButton animated:YES];
    
}


#pragma mark UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [[self.arrayOfGroup objectAtIndex:section] nameOfGroup];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    CBGroup* group = [self.arrayOfGroup objectAtIndex:section];
    
    return [NSString stringWithFormat:@" Количество спотртсменов в группе %lu",(unsigned long)[group.arrayOfSportsmen count]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.arrayOfGroup count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    CBGroup* group = [self.arrayOfGroup objectAtIndex:section];
    
    return [group.arrayOfSportsmen count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        static NSString* addStudentIdentifier = @"AddSportsmenCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:addStudentIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addStudentIdentifier];
            cell.textLabel.textColor = [UIColor blueColor];
            cell.textLabel.text = @"Tap to add new sportsmen";
        }
        
        return cell;}
    
    else {
    
    
    CBGroup* groupOfstudents = [self.arrayOfGroup objectAtIndex:indexPath.section];
    
    CBSportsman* sport = [groupOfstudents.arrayOfSportsmen objectAtIndex:indexPath.row-1];
    
    static NSString* identifier = @"SportsmenCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
        
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                           sport.firstName,sport.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",
                                 (long)sport.age];
    
    
    return cell;
                   }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row > 0;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSMutableArray* array = [NSMutableArray array];
    
    CBGroup* groupSource = [self.arrayOfGroup objectAtIndex:sourceIndexPath.section];
    
    CBSportsman* sportsmen = [groupSource.arrayOfSportsmen objectAtIndex:sourceIndexPath.row-1];
    
     array = [NSMutableArray arrayWithArray:groupSource.arrayOfSportsmen];
    
    if (sourceIndexPath.section == destinationIndexPath.section) {
        
        [array exchangeObjectAtIndex:sourceIndexPath.row -1
                   withObjectAtIndex:destinationIndexPath.row - 1];
      
        groupSource.arrayOfSportsmen = array;
        
    }
    else{
        [array removeObject:sportsmen];
        groupSource.arrayOfSportsmen = array;
        
        
        CBGroup* groupdestination = [self.arrayOfGroup objectAtIndex:destinationIndexPath.section];
        array = [NSMutableArray arrayWithArray:groupdestination.arrayOfSportsmen];
        [array insertObject:sportsmen atIndex:destinationIndexPath.row - 1];
        groupdestination.arrayOfSportsmen = array;
        
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray* array = [NSMutableArray array];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        CBGroup* croup = [self.arrayOfGroup objectAtIndex: indexPath.section];
        
        CBSportsman* sport = [croup.arrayOfSportsmen objectAtIndex:indexPath.row - 1];
        
        array = [NSMutableArray arrayWithArray:croup.arrayOfSportsmen];
        
        [array removeObject:sport];
        
        croup.arrayOfSportsmen = array;
        
        [self.tableView beginUpdates];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        [self.tableView endUpdates];
    }
    
}

#pragma mark UITableViewDelegate

// устанавливает стиль при редактировании

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row == 0 ? UITableViewCellEditingStyleNone :
    UITableViewCellEditingStyleDelete;

}

// меняет кнопку Delete на Remove

- ( NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"Revove"];
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
    
    // сдвигаться ли таблице вправа при редактировании
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    
    if (proposedDestinationIndexPath.row == 0) {
        return sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        CBGroup* group = [self.arrayOfGroup objectAtIndex:indexPath.section];
    
        
        NSMutableArray* tempArray = nil;
        
        
        if ( group.arrayOfSportsmen) {
            tempArray = [NSMutableArray arrayWithArray:group.arrayOfSportsmen];
        } else {
            tempArray = [NSMutableArray array];
        }
        
        NSInteger newSportsmenIndex = 0;
        [tempArray insertObject:[CBSportsman createSportsmen] atIndex:newSportsmenIndex];
        group.arrayOfSportsmen = tempArray;
        
        [self.tableView beginUpdates];
        
        NSIndexPath* newIndexPath = [NSIndexPath indexPathForItem:newSportsmenIndex + 1 inSection:indexPath.section];
        
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        [self.tableView endUpdates];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        
        double delayInSeconds = 0.3;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
            }
        });
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
