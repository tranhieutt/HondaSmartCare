//
//  NavigationView.h
//  Honda
//
//  Created by Nguyen Quang Tuan on 12/31/15.
//  Copyright © 2015 HondaServices. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenuContainerViewController.h"

@interface NavigationView : UIView<MFSideMenuContainerViewControllerPanProtocol>{}
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;

@property (weak, nonatomic) IBOutlet UIButton *btnLeftMenu;
@end