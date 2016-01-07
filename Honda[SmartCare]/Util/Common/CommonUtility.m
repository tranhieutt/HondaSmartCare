
//
//  CommonUtility.m
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 1/5/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import "CommonUtility.h"

@implementation CommonUtility
+ (CGFloat)getProgressBetweendate:(NSDate *)date1 andDate:(NSDate *)date2{
    if (date1 == nil || date2 == nil) {
        return 0;
    }
    NSTimeInterval daysBetween = [date2 timeIntervalSince1970] - [date1 timeIntervalSince1970];
    NSTimeInterval daysUsed = [[NSDate date] timeIntervalSince1970] - [date1 timeIntervalSince1970];
    
    return daysUsed/daysBetween;
}

/**
 *  Convert string to date
 *
 *  @param string <#string description#>
 *  @param format <#format description#>
 *
 *  @return <#return value description#>
 */
+ (NSDate*)convertStringToDate:(NSString *)string withFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSDate *ret = [formatter dateFromString:string];
    
    return ret;

}

/**
 *  show alert message
 *
 *  @param message <#message description#>
 *
 *  @return <#return value description#>
 */
+ (UIAlertView *)showCPOMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:MSG_BLANK
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:BUTTON_OK
                                          otherButtonTitles:nil];
    [alert show];
    return alert;
}

/**
 *  convert date to string
 *
 *  @param date   <#date description#>
 *  @param format <#format description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *) convertDateToString: (NSDate *) date withFormat: (NSString *) format {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    if (!date) {
        return MSG_BLANK;
    }
    return [dateFormat stringFromDate:date];
}

+ (MFSideMenuContainerViewController*)createHomeControllerByMFSideMenu {
    MFSideMenuContainerViewController *container;
    //    CPORightMenuViewController *rightMenuViewController = [[CPORightMenuViewController alloc] init];
    
    LeftMenuViewControllerViewController *leftMenuViewController = [[LeftMenuViewControllerViewController alloc] init];
    LoginViewController *loginView = [[LoginViewController alloc] init];
    
    container = [MFSideMenuContainerViewController containerWithCenterViewController:[self navigationForPresentModalWithRootView:loginView]
                                                              leftMenuViewController:leftMenuViewController
                                                             rightMenuViewController:nil];
    
    //    container.panGestureDelegate = self;
    [container.shadow setEnabled:NO];
    [container setPanMode:MFSideMenuPanModeSideMenu];
    [container setMenuSlideAnimationEnabled:YES];
    [container setMenuSlideAnimationFactor:1];
    [container childViewControllerForStatusBarStyle];
    return container;
}

// create new navigation for present modal
+ (UINavigationController *)navigationForPresentModalWithRootView:(id)rootView {
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:rootView];
    UIColor *naviColor;
    [navi.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    navi.navigationBar.barTintColor = naviColor;
    navi.navigationBar.translucent = NO;
    UIColor *tintColor = [UIColor whiteColor];
    [navi.view setTintColor:tintColor];
    return navi;
}

+ (void) registerNibWithName: (NSString*) nibName withIdentifier: (NSString*) identifier withTableView: (UITableView*) tableView{
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    tableView.rowHeight = 60;
    [tableView reloadData];
}

+ (NSMutableArray *)convertPFObjectToHondaUser:(NSArray *)listPFObjects{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [listPFObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PFObject *object = (PFObject *)obj;
        HondaUser *hondaItem = [[HondaUser alloc] init];
        hondaItem.objectId = object.objectId;
        hondaItem.addressUser         = (NSString *)[object objectForKey:@"addressUser"];
        hondaItem.chassisNo           = (NSInteger)[object objectForKey:@"chassisNo"];
        hondaItem.engineNo            = (NSInteger )[object objectForKey:@"engineNo"];
        hondaItem.motorType           = (NSString *)[object objectForKey:@"motorType"];
        hondaItem.plateNo             = (NSString *)[object objectForKey:@"plateNo"];
        hondaItem.starDate            = (NSString *)[object objectForKey:@"startDate"];
        hondaItem.userID              = (NSString *)[object objectForKey:@"userID"];
        hondaItem.userName            = (NSString *)[object objectForKey:@"userName"];
        [array addObject:hondaItem];
    }];
    return array;
}

+ (NSMutableArray *)convertPFObjectToHondaDataItem:(NSArray *)listPFObjects{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [listPFObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PFObject *object = (PFObject *)obj;
        HondaDataItem *hondaItem = [[HondaDataItem alloc] init];
        hondaItem.objectId = object.objectId;
        hondaItem.groudAccessary     = (NSString *)[object objectForKey:@"groupAccessary"];
        hondaItem.nameItem           = (NSString *)[object objectForKey:@"nameItem"];
        hondaItem.descriptionDetail  = (NSString *)[object objectForKey:@"description"];
        hondaItem.renewPrice         = (NSInteger)[object objectForKey:@"renewPrice"];
        hondaItem.fixedPrice         = (NSInteger)[object objectForKey:@"fixedPrice"];
        hondaItem.starDate           = (NSDate *)[object objectForKey:@"startDate"];
        hondaItem.endDate            = (NSDate *)[object objectForKey:@"endDate"];
        PFFile *file                 = (PFFile *)[object objectForKey:@"imageFile"];
        hondaItem.imageURL           = file.url;
        //        hondaItem.userID             = (NSString *)[object objectForKey:@"userID"];
        hondaItem.plateNo            = (NSString *)[object objectForKey:@"plateNo"];
        [array addObject:hondaItem];
    }];
    return array;
}

// get CPOData in array
+ (HondaUser*)getCPODataInArray:(NSMutableArray*)cpoDataList atIndex:(NSInteger)index {
    if (index < cpoDataList.count) {
        return [cpoDataList objectAtIndex:index];
    }
    return nil;
}
@end

