//
//  DetailViewController.m
//  Honda[SmartCare]
//
//  Created by Nguyen Quang Tuan on 1/6/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImagePickerController+OrientationFix.h"
@import UIKit;
@import QuickLook;
@import Photos;

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

/**
 *  dismiss key board
 */
- (void)dismissKeyboard {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tfRenewPrice resignFirstResponder];
        [self.tfFixedPrice resignFirstResponder];
        [self.tfDatePicker resignFirstResponder];
        [self.tvDescription resignFirstResponder];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addFileFromSourceType:(int)sourceType {
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])  {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType =  sourceType;
        if (IS_IPAD) imagePickerController.modalPresentationStyle =  UIModalPresentationCustom;
        
        [self presentViewController:imagePickerController animated:YES completion:^{
            if (sourceType == UIImagePickerControllerSourceTypeCamera) {
                [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
            }
        }];
    } else {
//        [CommonUtility showCPOMessage:MSG_DOES_NOT_HAVE_ACCESS_CAMERA];
    }
}

- (void)camDenied {
//    DLog(@"%@", @"Denied camera access");
    
    NSString *alertText;
    NSString *alertButton;
    
    BOOL canOpenSettings = (&UIApplicationOpenSettingsURLString != NULL);
    if (canOpenSettings) {
        alertText = MSG_CAN_OPEN_SETING;
        alertButton = BUTTON_GO;
    } else {
        alertText = MSG_CAN_NOT_OPEN_SETING;
        alertButton = BUTTON_OK;
    }
    
    [UIAlertView showWithTitle:MSG_BLANK
                       message:alertText
             cancelButtonTitle:alertButton
             otherButtonTitles:nil
                      tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                          BOOL canOpenSettings = (&UIApplicationOpenSettingsURLString != NULL);
                          if (canOpenSettings)
                              [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                      }];
}

/**
 *  Open camera
 */
- (void)addFileFromCamera {
    //    isTakenPhotoByCamera = YES;
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusAuthorized) {
        [self addFileFromSourceType:UIImagePickerControllerSourceTypeCamera];
    } else if(authStatus == AVAuthorizationStatusNotDetermined) {
//        DLog(@"%@", @"Camera access not determined. Ask for permission.");
        
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if(granted) {
//                DLog(@"Granted access to %@", AVMediaTypeVideo);
                [self addFileFromSourceType:UIImagePickerControllerSourceTypeCamera];
            } else {
//                DLog(@"Not granted access to %@", AVMediaTypeVideo);
                [self camDenied];
            }
        }];
    } else if (authStatus == AVAuthorizationStatusRestricted) {
        [CommonUtility showCPOMessage:MSG_DOES_NOT_HAVE_ACCESS_CAMERA];
    } else { // AVAuthorizationStatusDenied
        [self camDenied];
    }
    
    }

- (IBAction)gotoCamera:(id)sender {
    [self addFileFromCamera];
}

/**
 *  This method is called when an image has been chosen from the library or taken from the camera.
 *
 *  @param picker <#picker description#>
 *  @param info   <#info description#>
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //Retrieve the actual UIImage
    UIImage *imagePhoto = [[info valueForKey:UIImagePickerControllerOriginalImage] fixOrientation];
    self.imageView.image = imagePhoto;
    [picker dismissViewControllerAnimated:NO completion:nil];
}

/**
 *  Open Date time picker
 *
 *  @param sender <#sender description#>
 */
- (IBAction)btnOpenDateTimePicker:(id)sender {
    if (!_datePicker) {
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.year = 1980;
        dateComponents.month = 1;
        dateComponents.day = 5;
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
        
        MDDatePickerDialog *datePicker = [[MDDatePickerDialog alloc] init];
        _datePicker = datePicker;
        _datePicker.minimumDate = date;
        _datePicker.selectedDate = date;
        _datePicker.delegate = self;
    }
    [_datePicker show];
}

/**
 *  delegat datePicker
 *
 *  @param date <#date description#>
 */
- (void)datePickerDialogDidSelectDate:(NSDate *)date {
    _dateFormatter.dateFormat = @"dd-MM-yyyy";
    _tfDatePicker.text = [_dateFormatter stringFromDate:date];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
