//
//  CommonUtility.m
//  Honda[SmartCare]
//
//  Created by Nguyen Quang Tuan on 1/4/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import "CommonUtility.h"


@implementation CommonUtility
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
@end
