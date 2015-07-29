//
//  ReturnGoodsViewController.m
//  crossShop
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ReturnGoodsViewController.h"

@interface ReturnGoodsViewController ()

@end

@implementation ReturnGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setDottedView];
}

- (void)setDottedView {
    NSLog(@"\r\n width:%f", self.view.bounds.size.width);
    CGSize size = CGSizeMake(self.dottedLineView1.frame.size.width, 60);
    CGSize size1 = CGSizeMake(size.width, 75);
    [self.dottedLineView1 setTitle:@"400 0000 00" content:@"请拨打我们的客服热线，接通后按5号键" imgTitle:@"1" toSize:size];
    [self.dottedLineView2 setTitle:@"核实商品状况" content:@"客服会根据您的叙述核实商品状况，后确认退货需求" imgTitle:@"2" toSize:size1];
    [self.dottedLineView3 setTitle:@"确认退货" content:@"确认符合退货条件，客服将电话通知您退货事宜" imgTitle:@"3" toSize:size];
    [self.dottedLineView4 setTitle:@"商品退回" content:@"将商品打包好并填写地址，然后快递到退货地址" imgTitle:@"4" toSize:size];
    [self.dottedLineView5 setTitle:@"完成退货" content:@"收到寄回商品一周内，我们将退款到您原支付账户" imgTitle:@"5" toSize:size1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
