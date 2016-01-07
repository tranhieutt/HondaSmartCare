//
//  ConfirmRepairTableViewCell.h
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 12/31/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HondaDataItem.h"
#import "MDButton.h"
@interface ConfirmRepairTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *cost;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet MDButton *repair;
@property (weak, nonatomic) IBOutlet MDButton *replace;
@property (copy, nonatomic) void (^replaceClick)();
@property (copy, nonatomic) void (^repairClick)();
- (void) setData:(HondaDataItem *)item;

@end
