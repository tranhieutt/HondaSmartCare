//
//  HondaCustomCellTableViewCell.m
//  Honda[SmartCare]
//
//  Created by Nguyen Quang Tuan on 1/4/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import "HondaCustomCellTableViewCell.h"
#import "CommonUtility.h"


@implementation HondaCustomCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(HondaUser *) hondaUser{
    self.txtName.text = hondaUser.userName;
    self.txtMotoType.text = hondaUser.motorType;
    self.txtPhone.text = hondaUser.addressUser;
    self.txtLicenseMoto.text = hondaUser.plateNo;
}

- (void)setModelDetail:(HondaDataItem *) hondaItem{
    self.txtName.text = hondaItem.nameItem;
    self.txtMotoType.text = hondaItem.groudAccessary;
    self.txtPhone.text = [CommonUtility convertDateToString:hondaItem.starDate withFormat:kFormatDateDisplay];
    self.txtLicenseMoto.text = hondaItem.plateNo;
}


@end
