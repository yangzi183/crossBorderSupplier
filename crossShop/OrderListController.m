//
//  OrderListController.m
//  crossShop
//
//  Created by mac on 15/6/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderListController.h"
#import "CROOrderList.h"
#import "orderFootView.h"
#import "CROCommonAPI.h"

static NSString *orderCell = @"orderListCell";

@interface OrderListController ()

@end

@implementation OrderListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"OrderListCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:orderCell];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataArray = [[NSMutableArray alloc] init];
    self.dataArray = [[CROOrderList shareInstance] getAllOrderList];
    self.tableView.backgroundColor = [UIColor whiteColor];
    NSLog(@"\r\n dataarray:%@", self.dataArray);
}

- (void)reloadData {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 91;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 30)];
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 60, 20)];
    titleView.font = [UIFont boldSystemFontOfSize:14];
    titleView.textColor = [CROCommonAPI colorWithHexString:@"#E75A5C"];
    NSDictionary *itemDic = [self.dataArray objectAtIndex:section];
    NSString *modeStr = [itemDic objectForKey:@"type"];
    titleView.text = modeStr;
    [head addSubview:titleView];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 29, self.tableView.frame.size.width, 1)];
    lineView.backgroundColor = [CROCommonAPI colorWithHexString:@"#E8E8E8"];
    [head addSubview:lineView];
    head.backgroundColor = [UIColor whiteColor];
    return head;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *itemDic = [self.dataArray objectAtIndex:section];
    NSArray *items = [itemDic objectForKey:@"list"];
    return [items count];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    orderFootView *foot = [[orderFootView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 91)];
    NSDictionary *itemDic = [self.dataArray objectAtIndex:section];
    NSNumber *price = [itemDic objectForKey:@"total_price"];
    NSString *modeStr = [itemDic objectForKey:@"type"];
    ORDER_LIST_MODE mode;
    if ([modeStr isEqualToString:@"待付款"]) {
        mode = ORDER_TO_BE_PAID;
    } else if ([modeStr isEqualToString:@"已失效"]) {
        mode = ORDER_IS_FAILURE;
    } else if ([modeStr isEqualToString:@"待发货"]) {
        mode = ORDER_TO_BE_SHIPPED;
    } else if ([modeStr isEqualToString:@"已发货"]) {
        mode = ORDER_IS_DELIVERED;
    } else {
        mode = ORDER_DONE;
    }
    [foot configFootViewWithPrice:[NSString stringWithFormat:@"%@", price] mode:mode];
    return foot;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    NSDictionary *itemDic = [self.dataArray objectAtIndex:section];
    NSString *modeStr = [itemDic objectForKey:@"type"];
    if ([modeStr isEqualToString:@"待发货"]) {
        return 40;
    } else {
        return 91;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[OrderListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderCell];
    }
    NSDictionary *itemDic = [self.dataArray objectAtIndex:indexPath.section];
    NSArray *items = [itemDic objectForKey:@"list"];
    NSDictionary *itemData = [items objectAtIndex:indexPath.row];
    [cell setOrderItemInfoByDic:itemData];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
