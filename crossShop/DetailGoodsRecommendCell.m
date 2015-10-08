//
//  DetailGoodsRecommendCell.m
//  crossShop
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DetailGoodsRecommendCell.h"

@implementation DetailGoodsRecommendCell

- (void)awakeFromNib {
    // Initialization code
    self.recoImg.layer.cornerRadius = self.recoImg.frame.size.width / 2;
    self.recoImg.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
