//
//  HomeViewController.m
//  Honda
//
//  Created by Nguyen Quang Tuan on 12/31/15.
//  Copyright © 2015 HondaServices. All rights reserved.
//

#import "HomeViewController.h"
#import "MFSideMenu.h"
#import "HondaCustomCellTableViewCell.h"
#import "CommonUtility.h"
#import <Parse/Parse.h>
#import "NavigationView.h"
#import "DetailViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.listData = [[NSMutableArray alloc]initWithObjects:
//              @"Data 1 in array",@"Data 2 in array",@"Data 3 in array",
//              @"Data 4 in array",@"Data 5 in array",@"Data 5 in array",
//              @"Data 6 in array",@"Data 7 in array",@"Data 8 in array",
//              @"Data 9 in array", nil];
    
    
    if (self.plateNo) {
        self.tableView.allowsMultipleSelection = YES;
        self.btnDangKy.hidden = NO;
        self.multiSelect.hidden = NO;
        PFQuery *query = [PFQuery queryWithClassName:@"HondaItem"];
        [query whereKey:@"plateNo" equalTo:self.plateNo];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            if (!error) {
                if (objects.count != 0) {
                    self.listData = [CommonUtility convertPFObjectToHondaDataItem:objects];
                    [self.tableView reloadData];
                    // Do something with the found objects
                    //            for (HondaUser *object in self.listData) {
                    //                if (![arrPlateNo containsObject:object.plateNo]) {
                    //                    [arrPlateNo addObject:object.plateNo];
                    //                }
                    //            }
                }
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }else {
        self.btnDangKy.hidden = YES;
        self.multiSelect.hidden = YES;
        PFQuery *query = [PFQuery queryWithClassName:@"HondaUser"];
        //    [query whereKeyExists:@"endDate"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                self.listData = [CommonUtility convertPFObjectToHondaUser:objects];
                [self.tableView reloadData];
                // Do something with the found objects
                //            for (HondaUser *object in self.listData) {
                //                if (![arrPlateNo containsObject:object.plateNo]) {
                //                    [arrPlateNo addObject:object.plateNo];
                //                }
                //            }
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
    [CommonUtility registerNibWithName:@"HondaCustomCellTableViewCell" withIdentifier:@"cpoDataTableViewCell" withTableView:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnOpenLeftMenu:(id)sender {
    
}

- (IBAction)dangKyClick:(id)sender {
//    [[NavigationView shareInstance] howtouse];
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listData count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"tableViewCell";
    
    HondaCustomCellTableViewCell *cell = (HondaCustomCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HondaCustomCellTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if (self.plateNo) {
        HondaDataItem *hondaItem  = [CommonUtility getCPODataInArray:self.listData atIndex:indexPath.row];
        [cell setModelDetail:hondaItem];
    }else {
        HondaUser *hondaUser;
        hondaUser = [CommonUtility getCPODataInArray:self.listData atIndex:indexPath.row];
        [cell setModel:hondaUser];
    }

    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


#pragma mark - TableView delegate
/**
 *  Did select
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"Section:%d Row:%d selected and its data is %@",
//          indexPath.section,indexPath.row,cell.textLabel.text);
    if (!self.isEditModeView) {
        if (self.plateNo) {
            DetailViewController *detail = [[DetailViewController alloc] init];
            [self.navigationController pushViewController:detail animated:NO];
        }else {
            HondaUser *cpoData = [self.listData objectAtIndex:indexPath.row];
            HomeViewController *homeView = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
            homeView.plateNo = cpoData.plateNo;
            [self.navigationController pushViewController:homeView animated:NO];
        }
    }else {
    
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

/**
 *  did DeSelect
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
}


- (IBAction)btnMultiSelect:(id)sender {
    if (self.isEditModeView) {
        self.tableView.allowsMultipleSelection = NO;
        self.isEditModeView = NO;
    }else {
        self.tableView.allowsMultipleSelection = YES;
        self.isEditModeView = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
