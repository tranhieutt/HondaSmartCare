//
//  HomeViewController.h
//  Honda
//
//  Created by Nguyen Quang Tuan on 12/31/15.
//  Copyright © 2015 HondaServices. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDButton.h"
@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{}
    @property (strong, nonatomic) IBOutlet UITableView *tableView;
    @property (strong, nonatomic) NSMutableArray *listData;
    @property (weak, nonatomic) IBOutlet MDButton *btnDangKy;
    @property (weak, nonatomic) IBOutlet MDButton *multiSelect;
    @property (copy, nonatomic) NSString *plateNo;
    @property (nonatomic) BOOL isEditModeView;
@end
