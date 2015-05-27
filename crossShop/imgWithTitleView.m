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

- (void)configImg: (UIImage *)iconImg withTitle:(NSString *)title widthSize:(CGSize)toSize{
    
    [self setBackgroundColor:[UIColor clearColor]];
    UIImageView *iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake((toSize.width - 30) / 2, kIconImgMargin, 30, 30)];
    iconImgView.image = iconImg;
    [self addSubview:iconImgView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, iconImgView.frame.size.height + kIconImgMargin * 2, toSize.width, 20)];
    //NSLog(@"\r\n title:%@, sizewidth:%f", title, self.frame.size.width);
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:10];
    titleLabel.textColor = [CROCommonAPI colorWithHexString:@"#9B9B9B"];
    [self addSubview:titleLabel];
}

@end
