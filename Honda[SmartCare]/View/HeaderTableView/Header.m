//
//  Header.m
//  test
//
//  Created by Do Quoc Lam on 12/29/15.
//  Copyright © 2015 DoQuocLam. All rights reserved.
//

#import "Header.h"
#import "CommonUtility.h"
@implementation Header
- (void) setDataForHeaderWithName:(NSString *)name infor:(NSString *)infor date:(NSDate *)date status:(NSString *)status {
    self.name.text = name;
    self.information.text = infor;
    self.information.marqueeType = MLContinuous;
    self.information.scrollDuration = 1.0f;
    self.information.fadeLength = 10.0f;
    self.information.trailingBuffer = 30.0f;
    self.date.text = [CommonUtility convertDateToString:date withFormat:kFormatDateDisplay];
    self.status.text = status;
}

@end
