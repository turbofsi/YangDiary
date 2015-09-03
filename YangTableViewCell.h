//
//  YangTableViewCell.h
//  YangDiary
//
//  Created by apple on 2015-09-03.
//  Copyright (c) 2015 YangTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YangDiary;

@interface YangTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

+ (CGFloat)heightForEntry:(YangDiary *)entry;
- (void)configureCellForEntry:(YangDiary *)entry;

@end
