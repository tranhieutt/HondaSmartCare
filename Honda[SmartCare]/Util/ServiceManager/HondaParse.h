//
//  HondaParse.h
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 12/30/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "HondaAppContant.h"
#import "HOndaDataItem.h"

@interface HondaParse : NSObject
+ (HondaParse *)sharedInstance;
- (void)getGroupAccessory:(UIImageView*)imageView withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure;
- (void)addAccessory:(HondaDataItem *)hondaDataItem withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure;
- (void)deleteAccessory:(HondaDataItem *)hondaDataItem withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure;
@end
