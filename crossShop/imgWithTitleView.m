//
//  imgWithTitleView.m
//  crossShop
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "imgWithTitleView.h"

@implementation imgWithTitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configImg: (UIImage *)iconImg withTitle:(NSString *)title {
    NSLog(@"\r\n width:%f", self.frame.size.width);
    [self setBackgroundColor:[UIColor clearColor]];
    UIImageView *iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kIconImgMargin, kIconImgMargin, 30, 30)];
    iconImgView.image = iconImg;
    [self addSubview:iconImgView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, iconImgView.frame.size.height + kIconImgMargin * 2, 40, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor blackColor];
    [self addSubview:titleLabel];
}

@end
