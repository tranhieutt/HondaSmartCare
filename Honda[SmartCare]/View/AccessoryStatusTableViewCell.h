//
//  AccessoryStatusTableViewCell.h
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 12/29/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLProgressBar.h"
@interface AccessoryStatusTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet YLProgressBar *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

- (void)setDataForCellWithName:(NSString *)name andProgress:(CGFloat)progress;
@end
