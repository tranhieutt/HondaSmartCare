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

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.listData = [[NSMutableArray alloc]initWithObjects:
              @"Data 1 in array",@"Data 2 in array",@"Data 3 in array",
              @"Data 4 in array",@"Data 5 in array",@"Data 5 in array",
              @"Data 6 in array",@"Data 7 in array",@"Data 8 in array",
              @"Data 9 in array", nil];
    [CommonUtility registerNibWithName:@"HondaCustomCellTableViewCell" withIdentifier:@"cpoDataTableViewCell" withTableView:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnOpenLeftMenu:(id)sender {
}


#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
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
    
    cell.txtName.text = @"Tuấn";
    cell.txtMotoType.text = @"Liberty";
    
    
    
//    static NSString *cellIdentifier = @"cellID";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
//                             cellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:
//                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    NSString *stringForCell;
//    if (indexPath.section == 0) {
//        stringForCell= [myData objectAtIndex:indexPath.row];
//        
//    }
//    else if (indexPath.section == 1){
//        stringForCell= [myData objectAtIndex:indexPath.row+ [myData count]/2];
//        
//    }
//    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%d Row:%d selected and its data is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
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
