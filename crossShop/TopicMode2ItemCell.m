//
//  TopicMode2ItemCell.m
//  crossShop
//
//  Created by mac on 15/6/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TopicMode2ItemCell.h"
#import "UILabel+textFrame.h"

@implementation TopicMode2ItemCell

- (void)awakeFromNib {
    // Initialization code
    [self.oriLabel insertLineToText:self.oriLabel.text];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
