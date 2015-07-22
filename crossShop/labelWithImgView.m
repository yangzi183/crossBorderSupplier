//
//  labelWithImgView.m
//  crossShop
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "labelWithImgView.h"

@implementation labelWithImgView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setContent: (NSString *)content number: (NSInteger)number {
    self.backgroundColor = [UIColor clearColor];
    if (number == 0) {
        UILabel *icon = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, 4, 4)];
        icon.text = @"•";
        [self addSubview:icon];
    } else {
        UIButton *numBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2, 7, 7)];
        [numBtn setTitle:[NSString stringWithFormat:@"%d", (int)number] forState:UIControlStateNormal];
        [numBtn setBackgroundImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];
        [self addSubview:numBtn];
        
    }
    CGFloat labelWidth = self.frame.size.width - 10;
    UILabel *contenLabel = [UILabel new];
    
    contenLabel.text = content;
    contenLabel.numberOfLines = 0;
    contenLabel.font = [UIFont systemFontOfSize:13];
    CGSize size = [contenLabel boundingRectWithSize:CGSizeMake(labelWidth, 0)];
    NSLog(@"\r\n height:%f-%f", size.width, size.height);
    contenLabel.frame = CGRectMake(15, 0, labelWidth, size.height);
    [self addSubview:contenLabel];
    
}

@end
