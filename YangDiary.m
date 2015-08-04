//
//  YangDiary.m
//  
//
//  Created by apple on 2015-07-31.
//
//

#import "YangDiary.h"


@implementation YangDiary



@dynamic date;
@dynamic body;
@dynamic imageData;
@dynamic mood;
@dynamic location;
@dynamic sectionName;

- (NSString *)sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM yyyy"];
    
    return [formatter stringFromDate:date];
}

@end
