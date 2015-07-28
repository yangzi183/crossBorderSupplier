//
//  labelWithImgView.m
//  crossShop
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "labelWithImgView.h"

@implementation labelWithImgView {
    UILabel *icon;
    UIButton *numBtn;
    UILabel *contenLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setContent: (NSString *)content number: (NSInteger)number size:(CGSize)toSize{
    self.backgroundColor = [UIColor clearColor];
    if (number == 0) {
        if (!icon) {
            icon = [[UILabel alloc] initWithFrame:CGRectMake(4, 3, 6, 6)];
            icon.text = @"•";
            [self addSubview:icon];
        }
    } else {
        if (!numBtn) {
            numBtn = [[UIButton alloc] initWithFrame:CGRectMake(2, 3, 10, 10)];
            [numBtn setTitle:[NSString stringWithFormat:@"%d", (int)number] forState:UIControlStateNormal];
            //[numBtn setBackgroundImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];
            numBtn.backgroundColor = [UIColor redColor];
            numBtn.titleLabel.font = [UIFont systemFontOfSize:10];
            [self addSubview:numBtn];
            //NSLog(@"\r\n number:%d", (int)number);
        }
    }
    //NSLog(@"\r\n width:%f", toSize.width);
    CGFloat labelWidth = toSize.width - 40;
    NSLog(@"\r\n labelwidth:%f", labelWidth);
    if (!contenLabel) {
        contenLabel = [UILabel new];
        
        contenLabel.text = content;
        contenLabel.numberOfLines = 0;
        contenLabel.font = [UIFont systemFontOfSize:13];
        CGSize size = [contenLabel boundingRectWithSize:CGSizeMake(labelWidth, 0)];
        contenLabel.frame = CGRectMake(15, 0, labelWidth, size.height);
        contenLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:contenLabel];
    }
}

@end
