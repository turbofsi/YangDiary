//
//  YangDiary.h
//  
//
//  Created by apple on 2015-07-31.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NS_ENUM(int16_t, YangDiaryEntryMood) {
    DiaryEntryMoodGood = 0,
    DiaryEntryMoodAverage = 0,
    DiaryEntryMoodBad = 0
};


@interface YangDiary : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;

@property (nonatomic, strong) NSString *sectionName;

@end
