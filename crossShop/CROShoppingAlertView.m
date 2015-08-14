//
//  CROShoppingAlertView.m
//  crossShop
//
//  Created by mac on 15/6/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingAlertView.h"

@implementation CROShoppingAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
        backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
        [self addSubview:backView];
        
        UIView *whiteBack = [[UIView alloc] initWithFrame:CGRectMake((screenWidth - kWhiteBackWidth) / 2, (screenHeight - kWhiteBackHeight) / 2, kWhiteBackWidth, kWhiteBackHeight)];
        whiteBack.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, kWhiteBackWidth, kLabelHeight)];
        titleLabel.text = @"是否将商品移除购物车?";
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [CROCommonAPI colorWithHexString:@"9b9b9b"];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [whiteBack addSubview:titleLabel];
        
        CGFloat btnWidth = (whiteBack.frame.size.width - kMargin * 2 - kMarginBtn) / 2;
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(kMargin, kBtnY, btnWidth, kBtnHeight)];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.layer.cornerRadius = 0;
        [cancelBtn addTarget:self action:@selector(cancelDel) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setTitleColor:[CROCommonAPI colorWithHexString:@"9b9b9b"] forState:UIControlStateNormal];
        cancelBtn.layer.borderColor = [CROCommonAPI colorWithHexString:@"9b9b9b"].CGColor;
        cancelBtn.layer.borderWidth = 0.8f;
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        UIButton *confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(kMargin + cancelBtn.frame.size.width + kMarginBtn, kBtnY, btnWidth, kBtnHeight)];
        [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        [confirmBtn setTitleColor:[CROCommonAPI colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        confirmBtn.layer.backgroundColor = [CROCommonAPI colorWithHexString:@"82d6d6"].CGColor;
        [confirmBtn addTarget:self action:@selector(confirmDel) forControlEvents:UIControlEventTouchUpInside];
        confirmBtn.layer.cornerRadius = 0;
        confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [whiteBack addSubview:cancelBtn];
        [whiteBack addSubview:confirmBtn];
        [backView addSubview:whiteBack];
    }
    return self;
}

- (void)cancelDel {
    [self removeFromSuperview];
}

- (void)confirmDel {
    [self removeFromSuperview];
}





@end
