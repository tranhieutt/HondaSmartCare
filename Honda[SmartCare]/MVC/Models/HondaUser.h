//
//  HondaUser.h
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 1/4/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HondaUser : NSObject
@property (copy, nonatomic) NSString *addressUser;
@property (copy, nonatomic) NSString *objectId;
@property (copy, nonatomic) NSString *userID;
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *plateNo;
@property (copy, nonatomic) NSString *starDate;
@property (copy, nonatomic) NSString *motorType;
@property (nonatomic)       NSInteger engineNo;
@property (nonatomic)       NSInteger chassisNo;
@end
