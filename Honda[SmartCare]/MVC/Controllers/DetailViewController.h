//
//  DetailViewController.h
//  Honda[SmartCare]
//
//  Created by Nguyen Quang Tuan on 1/6/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDButton.h"
#import "UIImage+FixOrientation.h"
#import "HondaAppContant.h"
#import "UIAlertView+Blocks.h"
#import "CommonUtility.h"
#import "NSDate+MDExtension.h"
#import "MDDatePickerDialog.h"


@interface DetailViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,MDDatePickerDialogDelegate>
@property (weak, nonatomic) IBOutlet UILabel *txtNameDevice;
@property (weak, nonatomic) IBOutlet UITextField *tfFixedPrice;
@property (weak, nonatomic) IBOutlet UITextField *tfRenewPrice;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UIButton *gotoCamera;
@property (weak, nonatomic) IBOutlet UITextField *tfDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *btnDatePicker;
@property (weak, nonatomic) IBOutlet UISwitch *swTypeEdit;
@property (weak, nonatomic) IBOutlet MDButton *btnAccepp;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic) NSDateFormatter *dateFormatter;

@property(nonatomic) MDDatePickerDialog *datePicker;

@end
