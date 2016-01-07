//
//  HondaDataItem.h
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 1/2/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface HondaDataItem : NSObject
@property (copy, nonatomic) NSString *userID;
@property (copy, nonatomic) NSString *objectId;
@property (copy, nonatomic) NSString *nameItem;
@property (copy, nonatomic) NSString *groudAccessary;
@property (copy, nonatomic) NSString *imageURL;
@property (copy, nonatomic) NSString *descriptionDetail;
@property (copy, nonatomic) NSDate *starDate;
@property (copy, nonatomic) NSDate *endDate;
@property (copy, nonatomic) NSString *plateNo;
@property (nonatomic)       NSInteger fixedPrice;
@property (nonatomic)       NSInteger renewPrice;
@property (nonatomic)        UIImage *imageFile;
@property (nonatomic)       BOOL isRepair;
@property (nonatomic)       BOOL isReplace;
- (CGFloat)getProgress;
@end
