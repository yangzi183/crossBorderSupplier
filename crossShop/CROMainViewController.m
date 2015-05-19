//
//  CROMainViewController.m
//  crossShop
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainViewController.h"

@interface CROMainViewController ()

@end

@implementation CROMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {
    UIImage *diaperImg = [UIImage imageNamed:@"column_main"];
    UIImage *milkImg = [UIImage imageNamed:@"column_main"];
    UIImage *foodImg = [UIImage imageNamed:@"column_main"];
    [self.diaper configImg:diaperImg withTitle:@"纸尿裤"];
    [self.milkPower configImg:milkImg withTitle:@"奶粉"];
    [self.food configImg:foodImg withTitle:@"辅食"];
    NSLog(@"\r\n fram:%f", self.diaper.bounds.size.width);
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

@end
