//  Header.h
//  test
//
//  Created by Do Quoc Lam on 12/29/15.
//  Copyright © 2015 DoQuocLam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarqueeLabel.h"

@interface Header : UIView
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet  MarqueeLabel *information;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIImageView *imageItem;
- (void) setDataForHeaderWithName:(NSString *)name infor:(NSString *)infor date:(NSDate *)date status:(NSString *)status;

@end
