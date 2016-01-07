//
//  ListAccessoriesViewController.h
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 12/29/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface ListAccessoriesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate>{
    NSArray *listHondaItems;
    NSInteger itemDisplayed;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *infor;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *date;
- (void)getHondaItem:(NSString *)groupId;
@end
