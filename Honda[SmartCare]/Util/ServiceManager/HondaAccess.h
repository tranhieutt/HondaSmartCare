//
//  HondaAccess.h
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 12/26/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "HondaAppContant.h"

@interface HondaAccess : NSObject
+ (HondaAccess *)sharedInstance;
- (void)getAccessaryById:(NSString *)accessaryId withCompletion:(void(^)(NSArray *resultArray))completion failure:(void(^)(HondaFailureCode failureCode))failure;
@end
