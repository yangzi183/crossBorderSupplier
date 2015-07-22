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
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setTitle:(NSString *)title content:(NSString *)content imgTitle:(NSString *)imgTitle {
    LBorderView *dotView = [[LBorderView alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width, self.frame.size.height)];
    dotView.borderType = BorderTypeDashed;
    dotView.dashPattern = 1;
    dotView.spacePattern = 2;
    dotView.borderWidth = 1;
    dotView.cornerRadius = 30;
    [self addSubview:dotView];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(27, 12, 150, 20)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:15];
    
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(27, 32, self.frame.size.width - 22, 17)];
    contentLabel.text = content;
    contentLabel.font = [UIFont systemFontOfSize:13];
    contentLabel.textColor = [CROCommonAPI colorWithHexString:@"#9B9B9B"];
    
    if (imgTitle != nil) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(-5, (self.frame.size.height - 25) / 2, 25, 25)];
        btn.titleLabel.text = @"1123";
        [btn setTitle:imgTitle forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"food_icon"] forState:UIControlStateNormal];
        [self addSubview:btn];
    }
    
    [self addSubview:titleLabel];
    [self addSubview:contentLabel];
    self.backgroundColor = [UIColor clearColor];
}

@end
