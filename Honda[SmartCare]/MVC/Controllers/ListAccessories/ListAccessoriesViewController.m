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
@interface ListAccessoriesViewController ()

@end

@implementation ListAccessoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 140;
}
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    Header *header =[[[NSBundle mainBundle] loadNibNamed:@"Header" owner:self options:nil] objectAtIndex:0];
    return header;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *statusCell = @"statusCell";
    
    AccessoryStatusTableViewCell *cell = (AccessoryStatusTableViewCell *)[tableView dequeueReusableCellWithIdentifier:statusCell];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AccessoryStatusTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell setRightUtilityButtons:[self tableCellRightButtonsWithCPOData] WithButtonWidth:60];
    return cell;

}
#pragma mark - SWTableViewDelegate
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
#pragma mark - button click
- (IBAction)buttonDienClick:(id)sender {
    [[HondaParse sharedInstance] getGroupAccessory:@"Điện" withCompletion:^(NSArray *array) {
        
    } failure:^(HondaFailureCode failureCode) {
        
    }];

}
- (IBAction)buttonKhungClick:(id)sender {
}
- (IBAction)buttonNhienlieuClick:(id)sender {
}
- (IBAction)buttonDongcoClick:(id)sender {
}
- (IBAction)buttonOtherClick:(id)sender {
}



@end
