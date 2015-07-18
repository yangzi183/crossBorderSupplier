//
//  CROMainTitleTableViewCell.m
//  crossShop
//
//  Created by apple on 15/5/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainTitleTableViewCell.h"

@implementation CROMainTitleTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, screenWidth, kTitleCellHeight);
    [self initUI];
    CGFloat width = self.frame.size.width - self.marginLeftScroll.constant - self.marginRightScroll.constant;
    [self.flowTable configFlowTable:width];
    [self initData];
}

- (void)initUI {
    UIImage *diaperImg = [UIImage imageNamed:@"diaper_icon"];
    UIImage *milkImg = [UIImage imageNamed:@"milk_icon"];
    UIImage *foodImg = [UIImage imageNamed:@"food_icon"];
  //  [self.diaper configImg:diaperImg withTitle:@"纸尿裤"];
    [self.milkPower configImg:milkImg withTitle:@"奶粉" widthSize:CGSizeMake(44, 60)];
    [self.diaper configImg:diaperImg withTitle:@"纸尿裤" widthSize:CGSizeMake(44, 60)];
    [self.food configImg:foodImg withTitle:@"辅食" widthSize:CGSizeMake(44, 60)];
    
    UIImage *realImg = [UIImage imageNamed:@"real_icon"];
    UIImage *planeImg = [UIImage imageNamed:@"plane_icon"];
    UIImage *expressImg = [UIImage imageNamed:@"express_icon"];
    UIImage *sevenImg = [UIImage imageNamed:@"seven_icon"];
    [self.iconReal configImg:realImg withTitle:@"正品保障" widthSize:CGSizeMake(60, 60)];
    [self.iconPlane configImg:planeImg withTitle:@"海外直采" widthSize:CGSizeMake(60, 60)];
    [self.iconExpress configImg:expressImg withTitle:@"保税区直邮" widthSize:CGSizeMake(60, 60)];
    [self.iconSeven configImg:sevenImg withTitle:@"7天退货" widthSize:CGSizeMake(60, 60)];
}

- (void)initData {
    flowTableData = [[NSMutableArray alloc]init];
    flowTableData = [NSMutableArray arrayWithObjects:@"http://img4q.duitang.com/uploads/item/201202/12/20120212145057_yKtnj.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/12/20120212145048_cjYNR.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", nil];
    [self.flowTable setDataArray:flowTableData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
