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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i=0; i < 10; i++) {
        
        PFObject *hondaItem = [PFObject objectWithClassName:@"testObject"];
        [hondaItem setObject:@"Bugi" forKey:@"itemName"];
        [hondaItem setObject:[NSNumber numberWithInt:1200+i] forKey:@"distance"];
        [hondaItem setObject:[NSNumber numberWithInt:840.000+i*10] forKey:@"money"];
        [hondaItem setObject:@"Thailand" forKey:@"branch"];
        [hondaItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            if (succeeded){
                NSLog(@"Object Uploaded!");
            }
            else{
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                NSLog(@"Error: %@", errorString);
            }
            
        }];
    }
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.requestSerializer setValue:@"K11yFOWz1ShVrRzEXw2x0iadbhaDrPuA8zQnKtHq" forHTTPHeaderField:@"X-Parse-Application-Id"];
//    [manager.requestSerializer setValue:@"zWaJkFQiw2eCKJL1eOHQdsKhgfgui7UGnZybFDv6" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
//    [manager GET:@"https://api.parse.com/1/classes/testObject/dv0l1uCbte" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//         NSLog(@"JSON: %@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    [[HondaAccess sharedInstance] getAccessaryById:@"abc" withCompletion:^(NSArray *resultArray) {
        
    } failure:^(HondaFailureCode failureCode) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
