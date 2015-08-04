//
//  OrderDetailNormalCell.m
//  crossShop
//
//  Created by mac on 15/7/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderDetailNormalCell.h"
#import "CROOrderList.h"

@implementation OrderDetailNormalCell {
    CROOrderList *orderInstance;
}

- (void)awakeFromNib {
    // Initialization code
    orderInstance = [CROOrderList shareInstance];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setContentInfoByIndex: (NSInteger)index toMode:(ORDER_DETAIL_NORMAL_CELL_MODE)mode {
    if (mode == ORDER_MODE_DETAIL) {
        NSMutableArray *titleArray = [orderInstance getNormalList];
        NSMutableArray *contentArray = [orderInstance getContentList];
        //NSLog(@"\r\n index:%ld, count:%ld,hidde:%d", index, contentArray.count, self.bottomLineView.hidden);
        self.dutyImg.hidden = YES;
        if (index < [contentArray count]) {
            self.titleLabel.text = [titleArray objectAtIndex:index];
            self.contentLabel.text = [contentArray objectAtIndex:index];
            self.contentImg.hidden = YES;
            self.contentLabel.hidden = NO;
        } else {
            self.titleLabel.text = [titleArray objectAtIndex:index];
            self.contentLabel.hidden = YES;
            self.contentImg.hidden = NO;
        }
        if (index == titleArray.count - 1) {
            self.bottomLineView.hidden = YES;
        } else {
            self.bottomLineView.hidden = NO;
        }
    } else if (mode == ORDER_MODE_LOGISTICS) {
        self.titleLabel.text = @"物流信息";
        self.contentLabel.hidden = YES;
        self.contentImg.hidden = YES;
        self.titleLabel.hidden = NO;
        self.bottomLineView.hidden = NO;
        self.dutyImg.hidden = YES;
    } else {
        NSMutableArray *titleArray = [orderInstance getConfirmOrderList];
        NSMutableArray *contentArray = [orderInstance getConfirmContentList];
        self.titleLabel.text = [titleArray objectAtIndex:index];
        self.contentLabel.text = [contentArray objectAtIndex:index];
        self.contentImg.hidden = YES;
        if (index == 2) {
            self.dutyImg.hidden = NO;
        } else {
            self.dutyImg.hidden = YES;
        }
    }
    
}

@end
