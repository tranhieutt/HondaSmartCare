//
//  NSMutableArray+SWUtilityButtons.h
//  SWTableViewCell
//
//  Created by Matt Bowman on 11/27/13.
//  Copyright (c) 2013 Chris Wendel. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSMutableArray (SWUtilityButtons)

- (void)sw_addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title;
- (void)sw_addUtilityButtonWithColor:(UIColor *)color attributedTitle:(NSAttributedString *)title;
- (void)sw_addUtilityButtonWithColor:(UIColor *)color icon:(UIImage *)icon;
- (void)sw_addUtilityButtonWithColor:(UIColor *)color normalIcon:(UIImage *)normalIcon selectedIcon:(UIImage *)selectedIcon;
- (void)sw_addUtilityButtonWithSpecial:(BOOL)isSpecial normalIcon:(NSString *)normalIconName selectedIcon:(NSString *)selectedIconName enabled:(BOOL)enabled;
- (void)sw_addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor;

@end


@interface NSArray (SWUtilityButtons)

- (BOOL)sw_isEqualToButtons:(NSArray *)buttons;

@end
