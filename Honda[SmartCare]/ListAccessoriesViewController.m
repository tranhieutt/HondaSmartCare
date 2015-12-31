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
@interface ListAccessoriesViewController ()

@end

@implementation ListAccessoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    //cell.cellLabel.text = [NSString stringWithFormat:@"cell %li",(long)indexPath.row];
    return cell;
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
    return cell;

}


@end
