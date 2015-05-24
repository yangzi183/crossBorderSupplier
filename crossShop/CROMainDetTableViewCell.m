//
//  CROMainDetTableViewCell.m
//  crossShop
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainDetTableViewCell.h"

@implementation CROMainDetTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, screenWidth, KCELLWIDTH);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDicData:(NSDictionary *)dicData {
    if (dicData) {
        _dicData = dicData;
        self.disLabel.text = [dicData objectForKey:kDiscount];
        self.disDateLabel.text = [dicData objectForKey:kDisDate];
        self.title.text = [dicData objectForKey:kTitle];
        self.curPrice.text = [dicData objectForKey:kCurPrice];
        self.oriPrice.text = [dicData objectForKey:kOriPrice];
        self.detail.text = [dicData objectForKey:kDetail];
        [self.coverImg sd_setImageWithURL:[NSURL URLWithString:[dicData objectForKey:kCoverImg]] placeholderImage:[UIImage imageNamed:@"coverImg.png"]];
    }
}

- (IBAction)advanceAct:(id)sender {
}
@end
