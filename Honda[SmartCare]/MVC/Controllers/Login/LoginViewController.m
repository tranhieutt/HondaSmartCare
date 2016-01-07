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
#import "CommonUtility.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
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

- (void)dismissKeyboard {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.txtPassword resignFirstResponder];
        [self.txtUsername resignFirstResponder];
    });
    
}

- (IBAction)loginSystem:(id)sender {
    [self dismissKeyboard];
    NSString *username = self.txtUsername.text;
    NSString *password = self.txtPassword.text;
    if ([username isEqualToString:@""] && [password isEqualToString:@""]) {
        if (IS_IPAD) {
            HomeViewController *home = [[HomeViewController alloc] init];
            UINavigationController *loginNavi = [CommonUtility navigationForPresentModalWithRootView:home];
            [self presentViewController:loginNavi animated:YES completion:nil];
            
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
        HondaBaseViewController *hondaBaseViewController = [[HondaBaseViewController alloc]initWithNibName:@"HondaBaseViewController" bundle:nil];
        
//        ListAccessoriesViewController *view = [[ListAccessoriesViewController alloc]initWithNibName:@"ListAccessoriesViewController" bundle:nil];
        [self presentViewController:hondaBaseViewController animated:NO completion:nil];
    }
}

@end
