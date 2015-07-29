//
//  dottedLineBorderView.m
//  crossShop
//
//  Created by mac on 15/7/22.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "dottedLineBorderView.h"
#import "LBorderView.h"

@implementation dottedLineBorderView {
    UILabel *titleLabel;
    UILabel *contentLabel;
    
    LBorderView *dotView;
    UIButton *btn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setTitle:(NSString *)title content:(NSString *)content imgTitle:(NSString *)imgTitle toSize:(CGSize)size{
    self.backgroundColor = [UIColor blueColor];
    if (!dotView) {
        dotView = [[LBorderView alloc] initWithFrame:CGRectMake(5, 0, size.width, size.height)];
        dotView.borderType = BorderTypeDashed;
        dotView.dashPattern = 1;
        dotView.spacePattern = 2;
        dotView.borderWidth = 1;
        dotView.cornerRadius = 30;
        [self addSubview:dotView];
    }
    
    if (!titleLabel) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(27, 12, 150, 20)];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:titleLabel];
    }
    
    if (!contentLabel) {
        CGFloat contentHeight = (size.height > 60) ? 32 : 17;
        contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(27, 32, size.width - 22, contentHeight)];
        contentLabel.text = content;
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:13];
        contentLabel.textColor = [CROCommonAPI colorWithHexString:@"#9B9B9B"];
        [self addSubview:contentLabel];
    }
    
    if (imgTitle != nil) {
        if (!btn) {
            btn = [[UIButton alloc] initWithFrame:CGRectMake(-5, (size.height - 25) / 2, 25, 25)];
            btn.titleLabel.text = @"1123";
            [btn setTitle:imgTitle forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"food_icon"] forState:UIControlStateNormal];
            [self addSubview:btn];
        }
    }
    
    self.backgroundColor = [UIColor clearColor];
}

@end
