
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
+ (CGFloat)getProgressBetweendate:(NSDate *)date1 andDate:(NSDate *)date2;
+ (NSDate *)convertStringToDate:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)convertDateToString:(NSDate *)date withFormat: (NSString *)format;
+ (MFSideMenuContainerViewController*)createHomeControllerByMFSideMenu;
// create new navigation for present modal
+ (UINavigationController *)navigationForPresentModalWithRootView:(id)rootView;
+ (void)registerNibWithName:(NSString*)nibName withIdentifier:(NSString*)identifier withTableView:(UITableView*)tableView;
+ (NSMutableArray *)convertPFObjectToHondaUser:(NSArray *)listPFObjects;
+ (HondaUser*)getCPODataInArray:(NSMutableArray*)cpoDataList atIndex:(NSInteger)index;
+ (NSMutableArray *)convertPFObjectToHondaDataItem:(NSArray *)listPFObjects;
+ (UIAlertView *)showCPOMessage:(NSString *)message;
@end

