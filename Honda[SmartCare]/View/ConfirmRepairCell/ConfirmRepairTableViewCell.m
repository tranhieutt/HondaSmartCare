//
//  ConfirmRepairTableViewCell.m
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 12/31/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import "ConfirmRepairTableViewCell.h"

@implementation ConfirmRepairTableViewCell

- (void)awakeFromNib {
}
- (void) setData:(HondaDataItem *)item{
        self.name.text = item.nameItem;
        self.detail.text = item.descriptionDetail;
    if (item.isRepair) {
        [self.repair setBackgroundColor:[UIColor redColor]];
        self.cost.text = [NSString stringWithFormat:@"%ld",(long)item.fixedPrice ];
    }
    if (item.isReplace) {
        [self.replace setBackgroundColor:[UIColor redColor]];
        self.cost.text = [NSString stringWithFormat:@"%ld",(long)item.renewPrice ];
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)repairButtonClick:(id)sender {
    
    if (self.repairClick) {
        self.repairClick();
    }
    
}
- (IBAction)replaceButtonClick:(id)sender {

    if (self.replaceClick) {
        self.replaceClick();
    }
}

@end
