//
//  HondaRepairItemsViewController.h
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 1/6/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HondaDataItem.h"
#import "HondaParse.h"
#import "SDWebImageDownloader.h"
@interface HondaRepairItemsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray *listRepairItem;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;

@end
