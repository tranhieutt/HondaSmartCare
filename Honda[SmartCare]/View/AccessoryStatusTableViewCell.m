//
//  AccessoryStatusTableViewCell.m
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 12/29/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import "AccessoryStatusTableViewCell.h"

@implementation AccessoryStatusTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _progressBar.progressTintColor = [UIColor redColor];
    _progressBar.trackTintColor = [UIColor lightGrayColor];
    _progressBar.type                     = YLProgressBarTypeRounded;
    _progressBar.indicatorTextDisplayMode = YLProgressBarIndicatorTextDisplayModeProgress;
    _progressBar.behavior                 = YLProgressBarBehaviorIndeterminate;
    _progressBar.stripesOrientation       = YLProgressBarStripesOrientationVertical;
    [_progressBar setProgress:0.5f animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDataForCellWithName:(NSString *)name andProgress:(CGFloat)progress{
    self.labelName.text = name;
    if (progress <= 0.7) {
        _progressBar.progressTintColor = [UIColor greenColor];
    }
    else if (progress <= 0.8 && progress >0.7){
        _progressBar.progressTintColor = [UIColor yellowColor];
    }
    else{
        _progressBar.progressTintColor = [UIColor redColor];

    }
    [_progressBar setProgress:progress animated:YES];

}
@end
