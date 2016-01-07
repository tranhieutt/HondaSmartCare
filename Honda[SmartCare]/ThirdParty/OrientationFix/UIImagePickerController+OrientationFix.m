//
//  UIImagePickerController+OrientationFix.m
//  CPOMobile
//
//  Created by MIC on 3/25/15.
//
//

#import "UIImagePickerController+OrientationFix.h"

@implementation UIImagePickerController (OrientationFix)

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
- (BOOL)shouldAutorotate {
    return NO;
}
@end
