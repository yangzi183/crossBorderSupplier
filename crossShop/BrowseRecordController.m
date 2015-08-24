//
//  BrowseRecordController.m
//  crossShop
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BrowseRecordController.h"
#import "commonConfig.h"
#import "CROCommonAPI.h"
#import "OrderListCell.h"
#import "CROOrderList.h"
#import "DetailGoodsViewController.h"

NSString *orderListCell = @"orderListCell";

@interface BrowseRecordController () {
    NSString *itemId;
}

@end

@implementation BrowseRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [CROCommonAPI colorWithHexString:@"#f5f6f6"];
    self.tableView.backgroundColor = [UIColor clearColor];
    UINib *nib = [UINib nibWithNibName:@"OrderListCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:orderListCell];
    self.dataArray = [[NSMutableArray alloc] init];
    self.dataArray = [[CROOrderList shareInstance] getAllOrderList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kOrderListCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:orderListCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[OrderListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderListCell];
    }
    cell.itemCount.hidden = YES;
    cell.itemX.hidden = YES;
    NSDictionary *itemDic = [self.dataArray objectAtIndex:indexPath.section];
    NSArray *items = [itemDic objectForKey:@"list"];
    NSDictionary *itemData = [items objectAtIndex:indexPath.row];
    [cell setOrderItemInfoByDic:itemData];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGoodsDetail"]) {
        [segue.destinationViewController setItemId:itemId];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *itemDic = [self.dataArray objectAtIndex:indexPath.section];
    NSArray *items = [itemDic objectForKey:@"list"];
    NSDictionary *itemData = [items objectAtIndex:indexPath.row];
    itemId = [itemData objectForKey:@"id"];
    [self performSegueWithIdentifier:@"showGoodsDetail" sender:nil];
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
