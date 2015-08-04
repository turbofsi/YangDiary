//
//  NewEntryViewController.h
//  YangDiary
//
//  Created by apple on 2015-07-31.
//  Copyright (c) 2015 YangTech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CoreDataStack.h"

@class YangDiary;

@interface NewEntryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *bodyTextFiled;
@property (nonatomic, strong) YangDiary *entry;

@end
