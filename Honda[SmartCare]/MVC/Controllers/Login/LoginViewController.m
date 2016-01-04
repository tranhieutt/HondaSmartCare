//
//  LoginViewController.m
//  Honda
//
//  Created by Nguyen Quang Tuan on 12/31/15.
//  Copyright © 2015 HondaServices. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "ListAccessoriesViewController.h"
#import "HondaAppContant.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginSystem:(id)sender {
    NSString *username = self.txtUsername.text;
    NSString *password = self.txtPassword.text;
    if ([username isEqualToString:@""] && [password isEqualToString:@""]) {
        if (IS_IPAD) {
            HomeViewController *home = [[HomeViewController alloc] init];
            [self presentViewController:home animated:YES completion:nil];
        }else {
            NSLog(@"only ipad");
            //Check notification
//            PFQuery *pushQuery = [PFInstallation query];
//            [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
//            
//            // Send push notification to query
//            [PFPush sendPushMessageToQueryInBackground:pushQuery
//                                           withMessage:@"Hello World!"];
//            demo
            [[HondaParse sharedInstance] getListUser:^(NSArray *array) {
                
            } failure:^(HondaFailureCode failureCode) {
                
            }];
            
        }
    }else {
        ListAccessoriesViewController *view = [[ListAccessoriesViewController alloc]initWithNibName:@"ListAccessoriesViewController" bundle:nil];
        [self presentViewController:view animated:NO completion:nil];
    }
}

@end
