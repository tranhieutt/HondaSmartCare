//
//  HondaDataItem.m
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 1/2/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import "HondaDataItem.h"

@implementation HondaDataItem
- (id)init {
    if (!(self = [super init])) {
        return nil;
    }
    return self;
}
- (CGFloat)getProgress{
    if (self.starDate == nil || self.endDate== nil) {
        return 0;
    }
    NSTimeInterval daysBetween = [self.endDate timeIntervalSince1970] - [self.starDate timeIntervalSince1970];
    NSTimeInterval daysUsed = [[NSDate date] timeIntervalSince1970] - [self.starDate timeIntervalSince1970];
    
    return daysUsed/daysBetween;
}
@end
