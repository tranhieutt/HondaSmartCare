//
//  HondaCustomCellTableViewCell.h
//  Honda[SmartCare]
//
//  Created by Nguyen Quang Tuan on 1/4/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HondaCustomCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *txtName;
@property (weak, nonatomic) IBOutlet UILabel *txtMotoType;
@property (weak, nonatomic) IBOutlet UILabel *txtPhone;
@property (weak, nonatomic) IBOutlet UILabel *txtLicenseMoto;

@end
