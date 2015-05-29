//
//  CROShoppingCartTableViewCell.m
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingCartTableViewCell.h"

@implementation CROShoppingCartTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)changeCellMode: (BOOL)isEdit {
    if (isEdit == true) {
        self.xLabel.hidden = YES;
        self.realNumLabel.hidden = YES;
        self.reduceBtn.hidden = NO;
        self.editTxt.hidden = NO;
        self.plusBtn.hidden = NO;
    } else {
        self.xLabel.hidden = NO;
        self.realNumLabel.hidden = NO;
        self.reduceBtn.hidden = YES;
        self.editTxt.hidden = YES;
        self.plusBtn.hidden = YES;
    }
}

@end
