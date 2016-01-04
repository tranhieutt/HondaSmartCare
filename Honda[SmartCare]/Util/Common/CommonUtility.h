//
//  CommonUtility.h
//  Honda[SmartCare]
//
//  Created by Nguyen Quang Tuan on 1/4/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MFSideMenuContainerViewController.h"
#import "LoginViewController.h"
#import "LeftMenuViewControllerViewController.h"



@interface CommonUtility : NSObject
+ (MFSideMenuContainerViewController*)createHomeControllerByMFSideMenu;
// create new navigation for present modal
+ (UINavigationController *)navigationForPresentModalWithRootView:(id)rootView;
+ (void)registerNibWithName:(NSString*)nibName withIdentifier:(NSString*)identifier withTableView:(UITableView*)tableView;
@end
