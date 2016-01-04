//
//  LoginViewController.h
//  Honda
//
//  Created by Nguyen Quang Tuan on 12/31/15.
//  Copyright © 2015 HondaServices. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HondaParse.h"


@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end
