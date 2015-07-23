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
    self.backgroundColor = [UIColor redColor];
    if (number == 0) {
        UILabel *icon = [[UILabel alloc] initWithFrame:CGRectMake(4, 3, 6, 6)];
        icon.text = @"•";
        [self addSubview:icon];
    } else {
        UIButton *numBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2, 7, 7)];
        [numBtn setTitle:[NSString stringWithFormat:@"%d", (int)number] forState:UIControlStateNormal];
        [numBtn setBackgroundImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];
        [self addSubview:numBtn];
        
    }
    NSLog(@"\r\n width:%f", self.frame.size.width);
    CGFloat labelWidth = self.frame.size.width - 10;
    UILabel *contenLabel = [UILabel new];
    
    contenLabel.text = content;
    contenLabel.numberOfLines = 0;
    contenLabel.font = [UIFont systemFontOfSize:13];
    CGSize size = [contenLabel boundingRectWithSize:CGSizeMake(labelWidth, 0)];
    NSLog(@"\r\n height:%f-%f", size.width, size.height);
    contenLabel.frame = CGRectMake(15, 0, size.width, size.height);
    contenLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:contenLabel];
    
}

@end
