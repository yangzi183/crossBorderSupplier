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
- (void)configImg: (UIImage *)iconImg withTitle:(NSString *)title widthSize:(CGSize)toSize withTag:(NSInteger)setTag{
    
    [self setBackgroundColor:[UIColor clearColor]];
    UIImageView *iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake((toSize.width - kIntroImgWidth) / 2, kIntroImgMargin, kIntroImgWidth, kIntroImgHeight)];
    iconImgView.image = iconImg;
    //[self addSubview:iconImgView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, toSize.width, 20)];
    //NSLog(@"\r\n title:%@, sizewidth:%f", title, self.frame.size.width);
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:13];;
    
    //titleLabel.textColor = [CROCommonAPI colorWithHexString:@"#9B9B9B"];
    [self addSubview:titleLabel];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, toSize.height - 2, toSize.width, 2)];
    self.lineView.backgroundColor = [CROCommonAPI colorWithHexString:@"#82D6D6"];
    [self addSubview:self.lineView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeDetail)];
    [self addGestureRecognizer:tapGesture];
    self.tag = setTag;
}

- (void)changeDetail {
    NSLog(@"\r\n changetag:%ld", (long)self.tag);
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeDetailCellWithTag:)]) {
        [self.delegate changeDetailCellWithTag:self.tag];
    }
}

@end
