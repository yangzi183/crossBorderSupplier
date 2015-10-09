//
//  OrderConfirmController.m
//  crossShop
//
//  Created by mac on 15/7/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderConfirmController.h"

#import "OrderDetailViewController.h"
#import "OrderDetailCell.h"
#import "OrderDetailNormalCell.h"
#import "OrderDetailItemCell.h"
#import "CROCommonAPI.h"
#import "OrderDetailLogisticsCell.h"
#import "OrderConfirmMoreCell.h"
#import "commonConfig.h"
#import "OrderListCell.h"
#import "CROOrderList.h"

static NSString *orderConfirmHeadCell = @"orderConfirmHeadCell";
static NSString *orderConfirmMoreCell = @"orderConfirmMoreCell";
static NSString *orderDetailNormalCell = @"orderDetailNormalCell";
static NSString *orderDetailItemCell = @"orderDetailItemCell";
static NSString *orderCell = @"orderListCell";

@interface OrderConfirmController () {
    UIImageView *barLineView;
    UIView *lineView;
    UIImageView *lineImgView;
    NSString *itemId;
}

@end

@implementation OrderConfirmController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"OrderConfirmHeadCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:orderConfirmHeadCell];
    UINib *normalNib = [UINib nibWithNibName:@"OrderDetailNormalCell" bundle:nil];
    [self.tableView registerNib:normalNib forCellReuseIdentifier:orderDetailNormalCell];
    UINib *itemNib = [UINib nibWithNibName:@"OrderDetailItemCell" bundle:nil];
    [self.tableView registerNib:itemNib forCellReuseIdentifier:orderDetailItemCell];
    UINib *moreNib = [UINib nibWithNibName:@"OrderConfirmMoreCell" bundle:nil];
    [self.tableView registerNib:moreNib forCellReuseIdentifier:orderConfirmMoreCell];
    UINib *listNib = [UINib nibWithNibName:@"OrderListCell" bundle:nil];
    [self.tableView registerNib:listNib forCellReuseIdentifier:orderCell];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataArray = [[NSMutableArray alloc] init];
    self.dataArray = [[CROOrderList shareInstance] getAllOrderList];
}

- (void)viewWillAppear:(BOOL)animated {
    willLoadToRemoveLine
    /*barLineView = [CROCommonAPI findHairlineImageViewUnder:self.navigationController.navigationBar];
     
     barLineView.hidden = YES;*/
    willLoadAddOrderLine
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    willDisappearToAddLine
    willDisappearRemoveOrderLine
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        return kOrderConfirmHeadCellHeight;
        
        case 1:
        return kOrderListCellHeight;
        
        case 2:
        return kOrderConfirmMoreCellHeight;
        
        case 3:
        return kOrderDetailNormalCellHeight;
        
        default:
        return kOrderDetailNormalCellHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 0;
    }
    return kThickLineHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 4) {
        return nil;
    } else {
        UIView *footLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, kThickLineHeight)];
        footLine.backgroundColor = [CROCommonAPI colorWithHexString:kThickLineColor];
        return footLine;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 1;
    } else {
        return 5;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        OrderConfirmHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:orderConfirmHeadCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderConfirmHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderConfirmHeadCell];
        }
        cell.delegate = self;
        [cell configCellInfo];
        return cell;
        
    } else if (indexPath.section == 1) {
        /*OrderDetailItemCell *cell = [tableView dequeueReusableCellWithIdentifier:orderDetailItemCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderDetailItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderDetailItemCell];
        }*/
        OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderCell];
        }
        NSDictionary *itemDic = [self.dataArray objectAtIndex:indexPath.section];
        NSArray *items = [itemDic objectForKey:@"list"];
        NSDictionary *itemData = [items objectAtIndex:indexPath.row];
        [cell setOrderItemInfoByDic:itemData];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell.backgroundColor = [UIColor redColor];
        return cell;
        
    } else if (indexPath.section == 2) {
        OrderConfirmMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:orderConfirmMoreCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderConfirmMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderConfirmMoreCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell.backgroundColor = [UIColor blueColor];
        return cell;
    } else {
        OrderDetailNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:orderDetailNormalCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderDetailNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderDetailNormalCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setContentInfoByIndex:indexPath.row toMode:ORDER_MODE_CONFIRM];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        NSDictionary *itemDic = [self.dataArray objectAtIndex:indexPath.section];
        NSArray *items = [itemDic objectForKey:@"list"];
        NSDictionary *itemData = [items objectAtIndex:indexPath.row];
        itemId = [itemData objectForKey:@"id"];
        [self performSegueWithIdentifier:@"showGoodsDetail" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGoodsDetail"]) {
        [segue.destinationViewController setItemId:itemId];
    }
}
- (void)intoCreateNewReceiptToMode: (RECEIPT_VIEW)mode {
    NSLog(@"\r\n toNewReceiptView mode:%d", mode);
    if (mode == RECEIPT_VIEW_NEW) {
        [self performSegueWithIdentifier:@"toNewReceiptView" sender:nil];
    } else {
        [self performSegueWithIdentifier:@"toReceiptListView" sender:nil];
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

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitOrderAct:(id)sender {
    [self performSegueWithIdentifier:@"orderSubmitView" sender:nil];
}
@end
