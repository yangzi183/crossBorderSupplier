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

static NSString *orderConfirmHeadCell = @"orderConfirmHeadCell";
static NSString *orderConfirmMoreCell = @"orderConfirmMoreCell";
static NSString *orderDetailNormalCell = @"orderDetailNormalCell";
static NSString *orderDetailItemCell = @"orderDetailItemCell";

@interface OrderConfirmController ()

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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
        return 73;
        
        case 1:
        return 89;
        
        case 2:
        return 50;
        
        case 3:
        return 41;
        
        default:
        return 41;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    switch (section) {
        case 0:
        return 5;
        
        case 1:
        return 5;
        
        case 2:
        return 5;
        
        case 3:
        return 5;
        
        default:
        return 5;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 4) {
        return nil;
    } else if (section == 1) {
        UIView *footLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 5)];
        footLine.backgroundColor = [CROCommonAPI colorWithHexString:@"#F5F6F6"];
        return footLine;
    } else {
        UIView *footLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 5)];
        footLine.backgroundColor = [CROCommonAPI colorWithHexString:@"#F5F6F6"];
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
        OrderDetailItemCell *cell = [tableView dequeueReusableCellWithIdentifier:orderDetailItemCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderDetailItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderDetailItemCell];
        }
        //cell.backgroundColor = [UIColor redColor];
        return cell;
        
    } else if (indexPath.section == 2) {
        OrderConfirmMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:orderConfirmMoreCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderConfirmMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderConfirmMoreCell];
        }
        //cell.backgroundColor = [UIColor blueColor];
        return cell;
    } else {
        OrderDetailNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:orderDetailNormalCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderDetailNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderDetailNormalCell];
        }
        //cell.backgroundColor = [UIColor blueColor];
        return cell;
    }
}

- (void)intoCreateNewReceipt {
    [self performSegueWithIdentifier:@"toNewReceiptView" sender:nil];
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
@end
