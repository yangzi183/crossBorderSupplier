//
//  PersonalCenterCell.m
//  crossShop
//
//  Created by mac on 15/6/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PersonalCenterCell.h"

@implementation PersonalCenterCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellInfoByDic: (NSDictionary *)dicData {
    if ([dicData objectForKey:kPersonalIconCell]) {
        self.cellIcon.image = [UIImage imageNamed:[dicData objectForKey:kPersonalIconCell]];
    }
    if ([dicData objectForKey:kPersonalTitleCell]) {
        self.cellTitle.text = [dicData objectForKey:kPersonalTitleCell];
    }
}
@end
