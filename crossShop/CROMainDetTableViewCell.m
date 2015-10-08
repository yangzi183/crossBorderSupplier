//
//  CROMainDetTableViewCell.m
//  crossShop
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainDetTableViewCell.h"
#import "CROCommonAPI.h"
#import "networkAPI.h"
@implementation CROMainDetTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, screenWidth, KCELLWIDTH);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDicData:(NSDictionary *)dicData tomorow:(BOOL)tomorow {
    self.tormorowLabel.layer.cornerRadius = 10;
    self.tormorowLabel.layer.borderColor = [CROCommonAPI colorWithHexString:@"#82D6D6"].CGColor;
    self.tormorowLabel.layer.borderWidth = 1.0f;
    if (tomorow) {
        self.tormorowLabel.hidden = NO;
        self.updateLabel.hidden = NO;
    } else {
        self.tormorowLabel.hidden = YES;
        self.updateLabel.hidden = YES;
    }
    if (dicData) {
        _dicData = dicData;
        self.disLabel.text = [dicData objectForKey:kDiscount];
        self.disDateLabel.text = [CROCommonAPI setDateInfoByDouble:[[dicData objectForKey:kDisDate] doubleValue]];
        
        self.title.text = [dicData objectForKey:kTitle];
        self.curPrice.text = [NSString stringWithFormat:@"￥%@", [dicData objectForKey:kCurPrice]];
        self.oriPrice.text = [NSString stringWithFormat:@"￥%@", [dicData objectForKey:kOriPrice]];
        
        NSString *string = self.oriPrice.text;
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
        [attrString addAttribute:NSStrikethroughColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, string.length)];
        [attrString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, string.length)];
        //[attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, string.length)];
        self.oriPrice.attributedText = attrString;

        
        self.oriPrice.lineBreakMode = NSLineBreakByTruncatingTail;
        self.detail.text = [dicData objectForKey:kDetail];
#ifdef kDEBUG_DATA
        [self.coverImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [dicData objectForKey:kCoverImg]]] placeholderImage:[UIImage imageNamed:@"coverImg.png"]];
#else
        [self.coverImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", NET_DOMAIN, [dicData objectForKey:kCoverImg]]] placeholderImage:[UIImage imageNamed:@"coverImg.png"]];
#endif
    }
}


- (IBAction)advanceAct:(id)sender {
}
@end
