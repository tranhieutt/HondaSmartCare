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

@end
