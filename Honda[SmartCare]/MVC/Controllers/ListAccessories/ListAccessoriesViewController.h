//
//  ListAccessoriesViewController.h
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 12/29/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface ListAccessoriesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,SWTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
