//
//  ViewController.m
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 12/26/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "AFNetworking.h"
#import "ListAccessoriesViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *hondaType = @[@"Wave 110",@"Lead",@"AirBlade FI",@"Future - Wave",@"Future - 125",@"Vision",@"Lead",@"AirBlade 125",@"Click",@"PCX",@"Spacy",@"SH - 125",@"SH - 150"];
    
//    NSArray *hondaAccessaryGroup = @[@"fuelSystem",@"engine",@"electric",@"driveShaft"];
//   NSArray *hondaElectricGroup = @[@"Acquy",@"Chiếu sáng - Tín hiệu",@"Bugi"];
//   NSArray *hondaFuelSystemGroup = @[@"Bộ lọc gió",@"Bộ chế hoà khí",@"Phun xăng",@"Bình xăng"];
//   NSArray *hondaEngineGroup = @[@"Dầu máy",@"Xupap",@"Cam",@"Bộ ly hợp",@"Côn"];
//    for (int i=0; i < hondaElectricGroup.count; i++) {
//        PFObject *hondaItem = [PFObject objectWithClassName:@"electric"];
//        [hondaItem setObject:[hondaElectricGroup objectAtIndex:i] forKey:@"electricType"];
//        [hondaItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            
//            if (succeeded){
//                NSLog(@"Object Uploaded!");
//            }
//            else{
//                NSString *errorString = [[error userInfo] objectForKey:@"error"];
//                NSLog(@"Error: %@", errorString);
//            }
//            
//        }];
//    }
//    for (int i=0; i < hondaFuelSystemGroup.count; i++) {
//        
//        PFObject *hondaItem = [PFObject objectWithClassName:@"HondaFuelSystem"];
//        [hondaItem setObject:[hondaFuelSystemGroup objectAtIndex:i] forKey:@"fuelSystem"];
//        [hondaItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            
//            if (succeeded){
//                NSLog(@"Object Uploaded!");
//            }
//            else{
//                NSString *errorString = [[error userInfo] objectForKey:@"error"];
//                NSLog(@"Error: %@", errorString);
//            }
//            
//        }];
//    }
//    for (int i=0; i < hondaEngineGroup.count; i++) {
//        
//        PFObject *hondaItem = [PFObject objectWithClassName:@"HondaEngineGroup"];
//        [hondaItem setObject:[hondaEngineGroup objectAtIndex:i] forKey:@"hondaEngineGroup"];
//        [hondaItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            
//            if (succeeded){
//                NSLog(@"Object Uploaded!");
//            }
//            else{
//                NSString *errorString = [[error userInfo] objectForKey:@"error"];
//                NSLog(@"Error: %@", errorString);
//            }
//            
//        }];
//    }

//    [[HondaAccess sharedInstance] getAccessaryById:@"abc" withCompletion:^(NSArray *resultArray) {
//        
//    } failure:^(HondaFailureCode failureCode) {
//        
//    }];
//    demo get Image
    NSURL *url = [[NSURL alloc] initWithString:@"http://s1.storage.2banh.vn/image/2013/08/20130828_f9a4973a9bc51b96ba7ea42b51c087e5_1377655488.jpg"];
//    SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];
//    [downloader downloadImageWithURL:url
//                             options:0
//                            progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                                // progression tracking code
//                            }
//                           completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//                               if (image && finished) {
//                                   // do something with image
//                                   // Convert to JPEG with 50% quality
//                                   NSData* data = UIImageJPEGRepresentation(image, 0.5f);
//                                   PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:data];
//                                   
//                                   // Demo Save the image to Parse
//                                   
//                                   [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                                       if (!error) {
//                                           // The image has now been uploaded to Parse. Associate it with a new object
//                                           PFObject* newPhotoObject = [PFObject objectWithClassName:@"PhotoObject"];
//                                           [newPhotoObject setObject:imageFile forKey:@"image"];
//                                           
//                                           [newPhotoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                                               if (!error) {
////                                                   completion(succeeded);
//                                               }
//                                               else{
//                                                   // Error
//                                                   NSLog(@"Error: %@ %@", error, [error userInfo]);
//                                               }
//                                           }];
//                                       }
//                                   }];
//
//                               }
//                           }];
//    demo get group accessory
//    [[HondaParse sharedInstance] getGroupAccessory:nil withCompletion:^(BOOL success) {
//        
//    } failure:^(HondaFailureCode failureCode) {
//        
//    }];
//    demo, add accessory
//    [[HondaParse sharedInstance] addAccessory:nil withCompletion:^(BOOL success) {
//        
//    } failure:^(HondaFailureCode failureCode) {
//        
//    }];
    
//    demo delete accessory
//    [[HondaParse sharedInstance] deleteAccessory:nil withCompletion:^(BOOL success) {
//        
//    } failure:^(HondaFailureCode failureCode) {
//        
//    }];

    // Create our Installation query
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
    
    // Send push notification to query
    [PFPush sendPushMessageToQueryInBackground:pushQuery
                                   withMessage:@"Hello World!"];
    
//    PFQuery *qry = [PFUser query];
//    [qry getObjectWithId: @"Nbdt5pdifT"];
//    
//    PFQuery *pushQuery = [PFInstallation query];
//    [pushQuery whereKey:@"user" matchesQuery:qry];
    
    // Send push notification to query
//    PFPush *push = [[PFPush alloc] init];
//    [push setQuery:pushQuery]; // Set our Installation query
//    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
//                          @"A New Push Message was Put HERE!", @"alert",
//                          @"ursound.caf", @"sound",
//                          @"Increment", @"badge",
//                          @"Optionally a type was set", @"type",
//                          nil];
//    [push setData:data];
    
    
//    [push sendPushInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        NSLog(@"");
//    }];
    
   
}
- (IBAction)buttonClick:(id)sender {
//    ListAccessoriesViewController *view = [[ListAccessoriesViewController alloc]initWithNibName:@"ListAccessoriesViewController" bundle:nil];
//    [self presentViewController:view animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
