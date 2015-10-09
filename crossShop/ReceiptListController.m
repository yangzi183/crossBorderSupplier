//
//  ReceiptListController.m
//  crossShop
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ReceiptListController.h"
#import "CROCommonAPI.h"
#import "commonConfig.h"
#import "ReceiptListCell.h"
#import "ModelData.h"

static NSString *receiptListCell = @"receiptListCell";

@interface ReceiptListController () {
    UIImageView *barLineView;
    UIView *lineView;
    UIImageView *lineImgView;
    NSMutableArray *dataArray;
}

@end

@implementation ReceiptListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *nib = [UINib nibWithNibName:@"ReceiptListCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:receiptListCell];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [CROCommonAPI colorWithHexString:@"#f5f6f6"];
    dataArray = [[NSMutableArray alloc] init];
    HTTPRequestArray complete = ^(NSMutableArray *returnData) {
        dataArray = [NSMutableArray arrayWithArray:returnData];
        [self.tableView reloadData];
    };
    [ModelData getReceiptsList:complete];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    willLoadToRemoveLine
    //willLoadAddOrderLine
}

- (void)viewWillDisappear:(BOOL)animated {
    willDisappearToAddLine
    //willDisappearRemoveOrderLine
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kReceiptListCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptListCell *cell = [tableView dequeueReusableCellWithIdentifier:receiptListCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ReceiptListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:receiptListCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.selected = YES;
    }
    [cell configCellByDic:[dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptListCell *cell = (ReceiptListCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selectBtn.selected = YES;
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[dataArray objectAtIndex:indexPath.row] forKey:kReceipt];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptListCell *cell = (ReceiptListCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selectBtn.selected = NO;
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

- (IBAction)addNewReceiptAddrAct:(id)sender {
}
@end
