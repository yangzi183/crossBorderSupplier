//
//  DetailGoodsQuestionCell.m
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DetailGoodsQuestionCell.h"

@implementation DetailGoodsQuestionCell

- (void)awakeFromNib {
    // Initialization code
    [self.labelImg1 setContent:@"您拍下商品后，首先会由海关对商品进行清关，清关需要2-3个工作日。" number:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
