//
//  imgWithIntroView.m
//  crossShop
//
//  Created by mac on 15/6/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "imgWithIntroView.h"
#import "CROCommonAPI.h"

@implementation imgWithIntroView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)configImg: (UIImage *)iconImg withTitle:(NSString *)title widthSize:(CGSize)toSize{
    
    [self setBackgroundColor:[UIColor clearColor]];
    UIImageView *iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake((toSize.width - kIntroImgWidth) / 2, kIntroImgMargin, kIntroImgWidth, kIntroImgHeight)];
    iconImgView.image = iconImg;
    [self addSubview:iconImgView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, iconImgView.frame.size.height + kIntroImgMargin * 2, toSize.width, 20)];
    //NSLog(@"\r\n title:%@, sizewidth:%f", title, self.frame.size.width);
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.textColor = [CROCommonAPI colorWithHexString:@"#9B9B9B"];
    [self addSubview:titleLabel];
}

@end
