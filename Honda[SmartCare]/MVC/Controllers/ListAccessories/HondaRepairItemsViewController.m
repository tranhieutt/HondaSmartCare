//
//  HondaRepairItemsViewController.m
//  Honda[SmartCare]
//
//  Created by Do Quoc Lam on 1/6/16.
//  Copyright © 2016 3SI. All rights reserved.
//

#import "HondaRepairItemsViewController.h"
#import "ConfirmRepairTableViewCell.h"
#import "CustomColor.h"

@interface HondaRepairItemsViewController ()

@end

@implementation HondaRepairItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRepairItem];
    self.tableView.delegate = self;
    self.tableView.dataSource  = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listRepairItem count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *statusCell = @"repairCell";
    
   __block ConfirmRepairTableViewCell *cell = (ConfirmRepairTableViewCell *)[tableView dequeueReusableCellWithIdentifier:statusCell];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ConfirmRepairTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    HondaDataItem *item = [listRepairItem objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:item.imageURL];
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        dispatch_async(dispatch_get_main_queue(), ^{ // 2
            cell.image.image  = image; // 3
        });
    }];
    __weak __typeof__(ConfirmRepairTableViewCell *) weakCell = cell;
    cell.repairClick = ^(){
        if (item.isReplace) {
            item.isReplace = NO;
        }
        item.isRepair = !item.isRepair;
        if (item.isRepair) {
            weakCell.cost.text = [NSString stringWithFormat:@"%ld",(long)item.fixedPrice];
            [weakCell.repair setBackgroundColor:[UIColor redColor]];
            [weakCell.replace setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        }else {
            weakCell.cost.text = @"";
            [weakCell.repair setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        }
    };
    cell.replaceClick = ^(){
        if (item.isRepair) {
            item.isRepair = NO;
        }
        item.isReplace = !item.isReplace;
        if (!item.isReplace) {
            weakCell.cost.text = @"";
            [weakCell.replace setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        }else {
            weakCell.cost.text = [NSString stringWithFormat:@"%ld",(long)item.renewPrice];
            [weakCell.replace setBackgroundColor:[UIColor redColor]];
            [weakCell.repair setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        }
    };

    [cell setData:item];
    return cell;
    
}
- (void)getRepairItem {
    [[HondaParse sharedInstance] getAllAccessory:^(NSArray *array) {
        listRepairItem = array;
        [self.tableView reloadData];
    } failure:^(HondaFailureCode failureCode) {
        
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closeRepairItems:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
