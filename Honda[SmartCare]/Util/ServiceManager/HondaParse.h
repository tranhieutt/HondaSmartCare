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
#import "HondaDataItem.h"
#import "HondaUser.h"


@interface HondaParse : NSObject
+ (HondaParse *)sharedInstance;
-(void)getGroupAccessory:(NSString *)groupAccessoryName withCompletion:(void(^)(NSArray *array))completion failure:(void(^)(HondaFailureCode failureCode))failure;
- (void)addAccessory:(HondaDataItem *)hondaDataItem withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure;
- (void)deleteAccessory:(HondaDataItem *)hondaDataItem withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure;
- (void)getListUser:(void(^)(NSArray *array))completion failure:(void(^)(HondaFailureCode failureCode))failure;
- (void)updateListAccessory:(NSArray *)listAccessory withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure;
@end
