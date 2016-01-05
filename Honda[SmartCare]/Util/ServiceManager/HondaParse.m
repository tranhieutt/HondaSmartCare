//
//  HondaParse.m
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 12/30/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import "HondaParse.h"


@implementation HondaParse
// Create Singleton: https://developer.apple.com/library/ios/documentation/general/conceptual/DevPedia-CocoaCore/Singleton.html
+ (HondaParse *)sharedInstance {
    static dispatch_once_t onceToken;
    static HondaParse *sharedInstance = nil;
    // make sure it run only one.
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[HondaParse alloc] init];
        }
    });
    return sharedInstance;
}
- (void)addImageToParseWithImageView:(UIImageView*)imageView withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    // Convert to JPEG with 50% quality
    NSData* data = UIImageJPEGRepresentation(imageView.image, 0.5f);
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:data];
    
    // Save the image to Parse
    
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // The image has now been uploaded to Parse. Associate it with a new object
            PFObject* newPhotoObject = [PFObject objectWithClassName:@"PhotoObject"];
            [newPhotoObject setObject:imageFile forKey:@"image"];
            
            [newPhotoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    completion(succeeded);
                }
                else{
                    // Error
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
    }];
}
-(void)getGroupAccessory:(NSString *)groupAccessoryName withCompletion:(void(^)(NSArray *array))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    PFQuery *query = [PFQuery queryWithClassName:@"HondaItem"];
    [query whereKey:@"groupAccessary" hasPrefix:groupAccessoryName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            if ([self convertPFObjectToHondaDataItem:objects].count) {
                completion([self convertPFObjectToHondaDataItem:objects]);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
-(void)addAccessory:(HondaDataItem *)hondaDataItem withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    PFObject *hondaItem = [PFObject objectWithClassName:@"HondaItem"];
    hondaItem[@"groupAccessary"] = hondaDataItem.groudAccessary;
    hondaItem[@"nameItem"]    = hondaDataItem.nameItem;
    hondaItem[@"description"] = hondaDataItem.descriptionDetail;
    hondaItem[@"renewPrice"]  = @(hondaDataItem.renewPrice);
    hondaItem[@"fixedPrice"]  = @(hondaDataItem.fixedPrice);
    hondaItem[@"startDate"]   = hondaDataItem.starDate;
    hondaItem[@"endDate"]     = hondaDataItem.endDate;
    // Convert to JPEG with 50% quality
//    NSData* data = UIImageJPEGRepresentation(imageView.image, 0.5f);
//    TODO: convert image from camera
    UIImage *image = [UIImage imageNamed:@"star_64_blue.png"];
    NSData *data = UIImageJPEGRepresentation(image,1);
    PFFile *imageFile = [PFFile fileWithName:hondaDataItem.nameItem data:data];
    hondaItem[@"imageFile"] = imageFile;
    [hondaItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            completion(succeeded);
            
        } else {
            // There was a problem, check error.description
            
        }
    }];

}
-(void)getListUser:(void(^)(NSArray *array))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    PFQuery *query = [PFQuery queryWithClassName:@"HondaUser"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            if ([self convertPFObjectToHondaUser:objects].count) {
                completion([self convertPFObjectToHondaUser:objects]);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
-(void)addUser:(HondaUser *)hondaUser withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    PFObject *hondaItem = [PFObject objectWithClassName:@"HondaUser"];
    hondaItem[@"addressUser"]   = hondaUser.addressUser;
    hondaItem[@"chassisNo"]     = @(hondaUser.chassisNo);
    hondaItem[@"engineNo"]      = @(hondaUser.engineNo);
    hondaItem[@"motorType"]     = hondaUser.motorType;
    hondaItem[@"plateNo"]       = hondaUser.plateNo;
    hondaItem[@"userID"]        = hondaUser.userID;
    hondaItem[@"userName"]      = hondaUser.userName;
    // Convert to JPEG with 50% quality
    //    NSData* data = UIImageJPEGRepresentation(imageView.image, 0.5f);
    //    TODO: convert image from camera
    UIImage *image = [UIImage imageNamed:@"star_64_blue.png"];
    NSData *data = UIImageJPEGRepresentation(image,1);
    PFFile *imageFile = [PFFile fileWithName:hondaUser.userName data:data];
    hondaItem[@"imageFile"] = imageFile;
    [hondaItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            completion(succeeded);
        } else {
            // There was a problem, check error.description
            
        }
    }];
}
- (void)updateListAccessory:(NSArray *)listAccessory withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    PFQuery *query = [PFQuery queryWithClassName:@"HondaItem"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        NSMutableArray *saveAllOfMe = [NSMutableArray new];
        [listAccessory enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HondaDataItem *hondaItem = (HondaDataItem *)obj;
            for (PFObject *object in objects) {
                if ([object.objectId isEqualToString:hondaItem.objectId]) {
                    [self convertHondaDataItemToPFObject:hondaItem];
                }
                [saveAllOfMe addObject:object];
            }
        }];
        [PFObject saveAllInBackground:saveAllOfMe block:^(BOOL success, NSError *error) {
            // Check result of the operation, all objects should have been saved by now
            if (success) {
                // The object has been saved.
                completion(success);
            } else {
                // There was a problem, check error.description
                
            }

        }];
    }];

}
-(void)deleteAccessory:(HondaDataItem *)hondaDataItem withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    PFObject *hondaItem = [PFObject objectWithClassName:@"HondaItem"];
    hondaItem.objectId = hondaDataItem.objectId;
//    multi delete
//    [PFObject deleteAllInBackground:@[object1, object2, object3]];
    [hondaItem deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            // The object has been saved.
            completion(succeeded);
            
        } else {
            // There was a problem, check error.description
            
        }
    }];
}
- (NSMutableArray *)convertPFObjectToHondaDataItem:(NSArray *)listPFObjects{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    HondaDataItem *hondaItem = [[HondaDataItem alloc] init];
    [listPFObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PFObject *object = (PFObject *)obj;
        hondaItem.objectId = object.objectId;
        hondaItem.groudAccessary     = (NSString *)[object objectForKey:@"groupAccessary"];
        hondaItem.nameItem           = (NSString *)[object objectForKey:@"nameItem"];
        hondaItem.descriptionDetail  = (NSString *)[object objectForKey:@"description"];
        hondaItem.renewPrice         = (NSInteger)[object objectForKey:@"renewPrice"];
        hondaItem.fixedPrice         = (NSInteger)[object objectForKey:@"fixedPrice"];
        hondaItem.starDate           = (NSDate *)[object objectForKey:@"startDate"];
        hondaItem.endDate            = (NSDate *)[object objectForKey:@"endDate"];
        PFFile *file                 = (PFFile *)[object objectForKey:@"imageFile"];
        hondaItem.imageURL           = file.url;
        hondaItem.userID             = (NSString *)[object objectForKey:@"userID"];
        [array addObject:hondaItem];
    }];
    return array;
}
- (NSMutableArray *)convertPFObjectToHondaUser:(NSArray *)listPFObjects{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    HondaUser *hondaItem = [[HondaUser alloc] init];
    [listPFObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PFObject *object = (PFObject *)obj;
        hondaItem.objectId = object.objectId;
        hondaItem.addressUser         = (NSString *)[object objectForKey:@"addressUser"];
        hondaItem.chassisNo           = (NSInteger)[object objectForKey:@"chassisNo"];
        hondaItem.engineNo            = (NSInteger )[object objectForKey:@"engineNo"];
        hondaItem.motorType           = (NSString *)[object objectForKey:@"motorType"];
        hondaItem.plateNo             = (NSString *)[object objectForKey:@"plateNo"];
        hondaItem.starDate            = (NSString *)[object objectForKey:@"startDate"];
        hondaItem.userID              = (NSString *)[object objectForKey:@"userID"];
        hondaItem.userName            = (NSString *)[object objectForKey:@"userName"];
        [array addObject:hondaItem];
    }];
    return array;
}
- (PFObject *)convertHondaDataItemToPFObject:(HondaDataItem *)hondaItem{
    PFObject *pfOject = [PFObject objectWithClassName:@"HondaItem"];
    pfOject[@"groupAccessary"] = hondaItem.groudAccessary;
    pfOject[@"nameItem"]    = hondaItem.nameItem;
    pfOject[@"description"] = hondaItem.descriptionDetail;
    pfOject[@"renewPrice"]  = @(hondaItem.renewPrice);
    pfOject[@"fixedPrice"]  = @(hondaItem.fixedPrice);
    pfOject[@"startDate"]   = hondaItem.starDate;
    pfOject[@"endDate"]     = hondaItem.endDate;
    return pfOject;
}
@end
