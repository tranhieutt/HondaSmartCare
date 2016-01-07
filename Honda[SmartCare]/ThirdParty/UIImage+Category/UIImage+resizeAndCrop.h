//
//  UIImage+resizeAndCrop.h
//  CPOMobile
//
//  Created by MIC on 5/12/14.
//

#import <UIKit/UIKit.h>

@interface UIImage (resizeAndCrop)
- (UIImage *)resizeToSize:(CGSize) newSize thenCropWithRect:(CGRect) cropRect;
- (UIImage *)imageResize:(UIImage *)img andResizeTo:(CGSize)newSize;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage *)imageWithView:(UIView *)view;
- (UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)imageWithImage:(UIImage *) sourceImage scaledToWidth: (float) i_width;
- (UIImage *)imageWithImage:(UIImage *) sourceImage scaledToHeight: (float) i_Height;
@end
