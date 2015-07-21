//
//  DetailGoodsModeCell.m
//  crossShop
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DetailGoodsModeCell.h"

@implementation DetailGoodsModeCell

- (void)awakeFromNib {
    // Initialization code
    [self initUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initUI {
    UIImage *realImg = [UIImage imageNamed:@"real_icon"];
    UIImage *planeImg = [UIImage imageNamed:@"plane_icon"];
    UIImage *expressImg = [UIImage imageNamed:@"express_icon"];
    UIImage *sevenImg = [UIImage imageNamed:@"seven_icon"];
    CGSize iconSize = CGSizeMake(60, 60);
    [self.iconReal configImg:realImg withTitle:@"正品保障" widthSize:iconSize];
    [self.iconPlane configImg:planeImg withTitle:@"海外直采" widthSize:iconSize];
    [self.iconExpress configImg:expressImg withTitle:@"保税区直邮" widthSize:iconSize];
    [self.iconSeven configImg:sevenImg withTitle:@"7天退货" widthSize:iconSize];
    
    CGSize itemSize = CGSizeMake(66, 30);
    [self.itemDetail configImg:realImg withTitle:@"商品详情" widthSize:itemSize withTag:ITEMDETAIL];
    [self.buyIntro configImg:realImg withTitle:@"购买须知" widthSize:itemSize withTag:BUYINTRO];
    [self.moreQuestion configImg:realImg withTitle:@"常见问题" widthSize:itemSize withTag:MOREQUESTION];
    
    self.moreView.backgroundColor = [UIColor clearColor];
    self.moreView.layer.borderColor = [CROCommonAPI colorWithHexString:@"#e8e8e8"].CGColor;
    self.moreView.layer.borderWidth = 0.5f;
}

@end
