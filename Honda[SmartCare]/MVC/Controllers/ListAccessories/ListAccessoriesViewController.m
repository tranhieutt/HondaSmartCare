//
//  ListAccessoriesViewController.m
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 12/29/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import "ListAccessoriesViewController.h"
#import "CollectionViewCell.h"
#import "AccessoryStatusTableViewCell.h"
#import "Header.h"
#import "HondaAccess.h"
#import "HondaParse.h"
#import "HondaDataItem.h"
#import "CommonUtility.h"
#import "HondaAppContant.h"
#import "HondaRepairItemsViewController.h"
#import "DownloadManager.h"
#import "SDWebImageDownloader.h"

@interface ListAccessoriesViewController ()

@end

@implementation ListAccessoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self getHondaItem:@"Điện"];
    itemDisplayed = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listHondaItems count];
}

- (void) setDataForHeader:(HondaDataItem *)item {
    
    self.name.text = item.nameItem;
    self.infor.text = item.descriptionDetail;
    self.date.text = [CommonUtility convertDateToString:item.starDate withFormat:kFormatDateDisplay];
    NSURL *url = [NSURL URLWithString:item.imageURL];
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            dispatch_async(dispatch_get_main_queue(), ^{ // 2
                self.imageView.image  = image; // 3
            });
    }];
    self.detail.text = item.getProgress <0.8?@"Tốt":@"Yếu" ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *statusCell = @"statusCell";
    
    AccessoryStatusTableViewCell *cell = (AccessoryStatusTableViewCell *)[tableView dequeueReusableCellWithIdentifier:statusCell];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AccessoryStatusTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    if (listHondaItems == nil) {
        return cell;
    }
    HondaDataItem *item = [listHondaItems objectAtIndex:indexPath.row];
    CGFloat progress = item.getProgress;
    [cell setDataForCellWithName:item.nameItem andProgress:progress];
//    [cell setRightUtilityButtons:[self tableCellRightButtonsWithCPOData] WithButtonWidth:60];
    return cell;

}
#pragma mark - Tableview Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    itemDisplayed = indexPath.row;
   
    HondaDataItem *item = [listHondaItems objectAtIndex:itemDisplayed];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setDataForHeader:item];
    });
    
    
}

#pragma mark - SWTableViewDelegate
/*
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    //Close flick menu
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        //Background Thread
        dispatch_async(dispatch_get_main_queue(), ^(void){
           [cell hideUtilityButtonsAnimated:YES];
        });
    });
}
- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    // allow just one cell's utility button to be open at once
    return YES;
}

- (void)swipeableTableViewCellDidEndScrolling:(SWTableViewCell *)cell{
    
}


- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state {
    //    disable seleted item in list view
    cell.accessoryType = UITableViewCellAccessoryNone;
    switch (state) {
        case 1:
            // set to NO to disable all left utility buttons appearing
            return NO;
            break;
        case 2:
            // set to NO to disable all right utility buttons appearing
            return YES;
            break;
        default:
            break;
    }
    return YES;
}
- (NSArray *)tableCellRightButtonsWithCPOData{
        NSMutableArray *rightUtilityButtons = [[NSMutableArray alloc] init];
    [rightUtilityButtons sw_addUtilityButtonWithSpecial:NO normalIcon:@"star_64_empty_blue" selectedIcon:@"star_64_empty_blue" enabled:NO];
    return rightUtilityButtons;
}
*/
- (IBAction)buttonClick:(id)sender {
    
}
- (void)getHondaItem:(NSString *)groupId {
    [[HondaParse sharedInstance] getGroupAccessory:groupId withCompletion:^(NSArray *array) {
        listHondaItems = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setDataForHeader:[listHondaItems firstObject]];
        });
        [self.tableView reloadData];
    } failure:^(HondaFailureCode failureCode) {
    }];
}


@end
