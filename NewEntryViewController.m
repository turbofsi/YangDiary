//
//  NewEntryViewController.m
//  YangDiary
//
//  Created by apple on 2015-07-31.
//  Copyright (c) 2015 YangTech. All rights reserved.
//

#import "NewEntryViewController.h"
#import "YangDiary.h"

@interface NewEntryViewController ()

@end

@implementation NewEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.entry != nil) {
        self.bodyTextFiled.text = _entry.body;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertEntryDiary{
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    YangDiary *entry = [NSEntityDescription insertNewObjectForEntityForName:@"YangDiary" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.bodyTextFiled.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
}

- (IBAction)doneAction:(id)sender {
    if (self.entry != nil) {
        [self updateYangDiaryEntry];
    } else {
        [self insertEntryDiary];
    }
    [self dismissSelf];
}


- (IBAction)cancelAction:(id)sender {
    [self dismissSelf];
}

#pragma mark - helper methods

- (void)updateYangDiaryEntry {
    self.entry.body = self.bodyTextFiled.text;
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    [coreDataStack saveContext];
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
