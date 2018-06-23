//
//  CBTableViewController.m
//  CBUITableViewNavigationHomeworkLesson33-34
//
//  Created by Alina on 25.12.17.
//  Copyright © 2017 Max. All rights reserved.
//

#import "CBTableViewController.h"
#import "CBTableViewCell.h"

@interface CBTableViewController ()

@property (strong,nonatomic) NSArray* contents;

@property (strong,nonatomic) NSMutableArray* sortingOfVisible;

@property (strong,nonatomic) NSMutableArray* sortedFile;

@property (strong,nonatomic) NSMutableArray* sortedFolder;

@property (strong,nonatomic) NSMutableArray* tempContents;
@end

@implementation CBTableViewController

- (id)initWithFolderPath:(NSString*) path
{
    self = [super init];
    if (self) {
        self.path = path;
        [self setEditing:YES];
        
        
    }
    return self;
}

- (void) setPath:(NSString *)path {
    _path = path;
    
    NSError* error = nil;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path
                                                                        error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [self.tableView reloadData];
    
    self.navigationItem.title = [self.path lastPathComponent];
    
   
    [self sortedVisibleFile];
    
}

-(void) loadView{
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    if (!self.path) {
        self.path = @"/Users/maksimponamorev";
    }

}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIBarButtonItem* addDirectory = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddDirectory:)];
    
    
    self.navigationItem.rightBarButtonItems = @[addDirectory];
    
    if([self.navigationController.viewControllers count] > 1){
        
        UIBarButtonItem* goToRootController = [[UIBarButtonItem alloc] initWithTitle: @"Back to root" style:UIBarButtonItemStyleDone target:self action:@selector(goToRootController:)];
        self.navigationItem.rightBarButtonItems = @[goToRootController,addDirectory];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark data sorting of contents

-(void) sortedVisibleFile {
    
    self.sortingOfVisible = [NSMutableArray array];

    
    for (int i = 0 ; i < [self.contents count]; i++) {
        
        NSString* fileName = [self.contents objectAtIndex:i];
        NSString* newFileName = [fileName substringToIndex:1];
        
        
        if ([newFileName isEqualToString:@"."]) {
            
        }
        else [self.sortingOfVisible addObject:[self.contents objectAtIndex:i]];
    }
    
    self.contents = self.sortingOfVisible;
    
    [self separationFilesAndFolders];
    
}

-(void) separationFilesAndFolders {
    
    self.sortedFolder = [NSMutableArray array];
    self.sortedFile   = [NSMutableArray array];
    
    
    for (int i = 0 ; i < [self.contents count]; i++) {
        
        if ([self isDirectoryAtIndex:i]) {
            [self.sortedFolder addObject:[self.contents objectAtIndex:i]];
        }
        else [self.sortedFile addObject:[self.contents objectAtIndex:i]];
    }
    
    for (int i = 0 ; i < [self.sortedFile count]; i++) {
        [self.sortedFolder addObject:[self.sortedFile objectAtIndex:i]];
    }
    
    self.contents = self.sortedFolder;

}

-(void) sortByName {
    
    self.contents = [self.contents sortedArrayUsingComparator:^NSComparisonResult(id   obj1, id   obj2) {
        
        NSString* stringOne = obj1;
        NSString* stringTwo = obj2;
        
        return ([stringOne compare:stringTwo]);
    }];
    
}


- (BOOL) isDirectoryAtIndex:(NSInteger) index {
    
    NSString* fileName = [self.contents objectAtIndex:index];
    
    NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
}


#pragma mark Action

-(void) goToRootController: (UIBarButtonItem*) sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void) actionAddDirectory: (UIBarButtonItem*) sender {
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Enter name new folder" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* folderButton = [UIAlertAction actionWithTitle:@"Create folder"       style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * _Nonnull action){
            if ([alertController.textFields[0].text length] > 0) {
                [self createNewFolderWithName:alertController.textFields[0].text];
            }}];
    
    UIAlertAction* cancelButton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    
    [alertController addAction:cancelButton];
    [alertController addAction:folderButton];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Name";
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void) createNewFolderWithName:(NSString*)folderName {
    
    self.tempContents = [NSMutableArray array];
    
    NSString* filePath = [self.path stringByAppendingPathComponent:folderName];
    
    NSError* error = nil;
    
    if ([[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:&error]) {
        self.tempContents = [NSMutableArray arrayWithArray:self.contents];
        [self.tempContents addObject:folderName];
        self.contents = self.tempContents;
       
        [self separationFilesAndFolders];
        
        [self.tableView beginUpdates];
        
        NSArray* indexes = [NSArray arrayWithObject:[self indexPathForFileName:folderName]];
        [self.tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationRight];
        
        [self.tableView endUpdates];
        
    } else {
        
        NSLog(@"%@",[error localizedDescription]);
        
    }
    
}

- (NSIndexPath*) indexPathForFileName:(NSString*)fileName {
    
    NSInteger section = 0;
    NSInteger row = 0;
    for (NSInteger index = 0; index < [self.contents count]; index++) {
        if ([[self.contents objectAtIndex:index] isEqualToString:fileName]) {
            row = index;
            break;
        }
    }
    
    return [NSIndexPath indexPathForRow:row inSection:section];
}

- (unsigned long long int)folderSize:(NSString *)folderPath {
  
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    NSString *fileName;
    unsigned long long int fileSize = 0;
     NSError* error = nil;
    
    while (fileName = [filesEnumerator nextObject]) {
       NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:&error];
         fileSize += [fileDictionary fileSize];
    }
    
    return fileSize;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.contents count];
}

- (BOOL) isDirectoryAtIndexPath:(NSIndexPath*) indexPath {
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    
    static NSString *fileIdentifier = @"FileCell";
    static NSString *folderIdentifier = @"FolderCell";
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString* folderPath = [self.path stringByAppendingPathComponent:fileName];
        
        NSUInteger sizeOfFolderB =  [self folderSize:folderPath];
        
        NSString * sizeOfFolder = [self fileSizeFromValue:sizeOfFolderB];

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:folderIdentifier];
        
        cell.detailTextLabel.text = sizeOfFolder;
        
        cell.textLabel.text = fileName;
        
        return cell;
        
    } else {
        
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        NSDictionary* attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        
        CBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fileIdentifier];
        
        cell.fileName.text = fileName;
        
        cell.sizeOfFile.text =  [self fileSizeFromValue:[attributes fileSize]];
        
        return cell;
    }
}
    
    
- (NSString*) fileSizeFromValue:(unsigned long long) size {
        
        static NSString* units[] = {@"B", @"KB", @"MB", @"GB", @"TB"};
        static int unitsCount = 5;
        
        int index = 0;
        
        double fileSize = (double)size;
        
        while (fileSize > 1024 && index < unitsCount) {
            fileSize /= 1024;
            index++;
        }
        
        return [NSString stringWithFormat:@"%.2f %@", fileSize, units[index]];
    }
    

#pragma mark UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isDirectoryAtIndexPath:indexPath]) {
        return 44.f;
    } else {
        return 80.f;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    return YES ;
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        
    NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
        
    /*
    CBTableViewController* vk = [[CBTableViewController alloc] initWithFolderPath:filePath];
        
    [self.navigationController pushViewController:vk animated:YES];
    */
    CBTableViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CBTableViewController"];
        
    vc.path = filePath;
        
    [self.navigationController pushViewController:vc animated:YES];
     
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
     NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
    
    self.tempContents = [NSMutableArray array];
    self.tempContents = [NSMutableArray arrayWithArray:self.contents];
    NSMutableArray* tempContents = [NSMutableArray arrayWithArray:self.contents];
    
    if ([[NSFileManager defaultManager] removeItemAtPath:filePath error:nil]) {
        [tempContents removeObject:fileName];
        self.contents = tempContents;
    }
    
    [self.tableView beginUpdates];
    NSArray* indexes = [NSArray arrayWithObject:indexPath];
    [self.tableView deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
    [self.tableView endUpdates];
}


@end
