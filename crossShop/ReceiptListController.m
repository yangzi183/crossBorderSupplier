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

static NSString *receiptListCell = @"receiptListCell";

@interface ReceiptListController () {
    UIImageView *barLineView;
    UIView *lineView;
    UIImageView *lineImgView;
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
    return 3;
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
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptListCell *cell = (ReceiptListCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selectBtn.selected = YES;
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
