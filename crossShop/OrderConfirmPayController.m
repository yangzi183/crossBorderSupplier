//
//  OrderConfirmPayController.m
//  crossShop
//
//  Created by mac on 15/8/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderConfirmPayController.h"
#import "CROCommonAPI.h"
#import "commonConfig.h"
#import "OrderPayMethodCell.h"

static NSString *orderPayMethodCell = @"orderPayMethodCell";

@interface OrderConfirmPayController () {
    UIView *backView;
}

@end

@implementation OrderConfirmPayController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self createBackView];
    //backView.hidden = YES;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UINib *nib = [UINib nibWithNibName:@"OrderPayMethodCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:orderPayMethodCell];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self createBackView];
    backView.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [backView removeFromSuperview];
}

- (void)createBackView {
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelDel)];
    [backView addGestureRecognizer:tap];
    
    UIView *whiteBack = [[UIView alloc] initWithFrame:CGRectMake((screenWidth - kWhiteBackWidth) / 2, (screenHeight - kWhiteBackHeight) / 2, kWhiteBackWidth, kWhiteBackHeight)];
    whiteBack.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, kWhiteBackWidth, kLabelHeight)];
    titleLabel.text = @"确定付款?";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [CROCommonAPI colorWithHexString:@"9b9b9b"];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [whiteBack addSubview:titleLabel];
    
    CGFloat btnWidth = (whiteBack.frame.size.width - kMargin * 2 - kMarginBtn) / 2;
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(kMargin, kBtnY, btnWidth, kBtnHeight)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.layer.cornerRadius = 0;
    [cancelBtn addTarget:self action:@selector(cancelDel) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitleColor:[CROCommonAPI colorWithHexString:@"9b9b9b"] forState:UIControlStateNormal];
    cancelBtn.layer.borderColor = [CROCommonAPI colorWithHexString:@"9b9b9b"].CGColor;
    cancelBtn.layer.borderWidth = 0.8f;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    UIButton *confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(kMargin + cancelBtn.frame.size.width + kMarginBtn, kBtnY, btnWidth, kBtnHeight)];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[CROCommonAPI colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
    confirmBtn.layer.backgroundColor = [CROCommonAPI colorWithHexString:@"82d6d6"].CGColor;
    [confirmBtn addTarget:self action:@selector(confirmDel) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.layer.cornerRadius = 0;
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [whiteBack addSubview:cancelBtn];
    [whiteBack addSubview:confirmBtn];
    [backView addSubview:whiteBack];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:backView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancelDel {
    backView.hidden = YES;
    NSLog(@"\r\n cancel");
}

- (void)confirmDel {
    backView.hidden = YES;
    NSLog(@"\r\n confirm");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderPayMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:orderPayMethodCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[OrderPayMethodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderPayMethodCell];
    }
    return cell;
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
}
- (IBAction)payAct:(id)sender {
    backView.hidden = NO;
}

@end
