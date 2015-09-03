//
//  YangTableViewCell.m
//  YangDiary
//
//  Created by apple on 2015-09-03.
//  Copyright (c) 2015 YangTech. All rights reserved.
//

#import "YangTableViewCell.h"
#import "YangDiary.h"

@interface YangTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;

@end


@implementation YangTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configureCellForEntry:(YangDiary *)entry {
    self.bodyLabel.text = entry.body;
    self.locationLabel.text = entry.location;
    
    NSDateFormatter *fomatter = [[NSDateFormatter alloc] init];
    [fomatter setDateFormat:@"EEEE, MMMMM d yyyy"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:entry.date];
    self.dateLabel.text = [fomatter stringFromDate:date];
    
    if(entry.imageData) {
        self.mainImageView.image = [UIImage imageWithData:entry.imageData];
    } else {
        self.mainImageView.image = [UIImage imageNamed:@"icn_noimage"];
    }
    
    if (entry.mood == DiaryEntryMoodGood) {
        self.moodImageView.image = [UIImage imageNamed:@"icn_happy"];
    } else if (entry.mood == DiaryEntryMoodAverage) {
        self.moodImageView.image = [UIImage imageNamed:@"icn_average"];
    } else {
        self.moodImageView.image = [UIImage imageNamed:@"icn_bad"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightForEntry:(YangDiary *)entry {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 106.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.body boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

@end
