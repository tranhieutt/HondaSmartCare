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
-(void)getGroupAccessory:(NSString *)groupAccessoryName withCompletion:(void(^)(BOOL success))completion failure:(void(^)(HondaFailureCode failureCode))failure{
    PFQuery *query = [PFQuery queryWithClassName:@"HondaItem"];
    [query whereKey:@"groupAccessary" hasPrefix:@"Điện"];
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
    hondaItem[@"groupAccessary"] = @"Điện";
    hondaItem[@"nameItem"] = @"Đèn chiếu hậu sau";
    hondaItem[@"description"] = @"Bổ xung";
    hondaItem[@"renewPrice"] = @50000;
    hondaItem[@"fixedPrice"] = @10000;
    hondaItem[@"startDate"] = [NSDate date];
    hondaItem[@"endDate"] = [NSDate date];
    // Convert to JPEG with 50% quality
//    NSData* data = UIImageJPEGRepresentation(imageView.image, 0.5f);
    UIImage *image = [UIImage imageNamed:@"star_64_blue.png"];
    NSData *data = UIImageJPEGRepresentation(image,1);
    PFFile *imageFile = [PFFile fileWithName:@"denchieuhau.jpg" data:data];
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
        hondaItem.starDate           = (NSString *)[object objectForKey:@"startDate"];
        hondaItem.endDate            = (NSString *)[object objectForKey:@"endDate"];
        PFFile *file                 = (PFFile *)[object objectForKey:@"imageFile"];
        hondaItem.imageURL           = file.url;
        [array addObject:hondaItem];
    }];
    return array;
}

@end
