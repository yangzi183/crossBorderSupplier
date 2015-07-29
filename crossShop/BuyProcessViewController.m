//
//  BuyProcessViewController.m
//  crossShop
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BuyProcessViewController.h"

@interface BuyProcessViewController ()

@end

@implementation BuyProcessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViewToConstraint];
}

- (void)updateViewToConstraint {
    //NSLog(@"\r\n dotwidth:%f", self.dottedLineView.frame.size.width);
    CGSize size = self.dottedLineView1.frame.size;
    CGSize size1 = CGSizeMake(size.width, 75);
    [self.dottedLineView1 setTitle:@"拍下商品" content:@"选好商品下订单后需填写身份信息用于报关" imgTitle:@"1" toSize:size];
    [self.dottedLineView2 setTitle:@"保税区发货" content:@"海关清关2-3个工作日后发货,物流时间1-5天" imgTitle:@"2" toSize:size];
    [self.dottedLineView3 setTitle:@"海外直邮" content:@"海外妈妈买手将商品打包直邮,15天左右到手" imgTitle:nil toSize:size];
    [self.dottedLineView4 setTitle:@"海外直邮" content:@"商品如有品质或物流问题,可在7天内联系客服退货" imgTitle:@"3" toSize:size1];
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

@end
