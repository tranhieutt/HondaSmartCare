//
//  CustomColor.h
//  CPOMobile
//
//  Created by MIC on 6/19/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor(HexString)
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;
+ (UIColor *) colorWithHexString: (NSString *) hexString;
@end
