//
//  PersonalCenterHeadView.m
//  crossShop
//
//  Created by mac on 15/6/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PersonalCenterHeadView.h"

@implementation PersonalCenterHeadView {
    UIImageView *iconPerson;
}

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
        self.backgroundColor = [CROCommonAPI colorWithHexString:@"#F5F5F5"];
        iconPerson = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - kIconPersonWidth) / 2, 10, kIconPersonWidth, kIconPersonHeight)];
        iconPerson.image = [UIImage imageNamed:@"red_icon"];
        UIButton *lgBtn = [[UIButton alloc]initWithFrame:CGRectMake((frame.size.width - kPersonLoginBtnWidth) / 2, kIconPersonHeight + 20, kPersonLoginBtnWidth, kPersonLoginBtnHeight)];
        lgBtn.layer.borderColor = [UIColor grayColor].CGColor;
        lgBtn.layer.borderWidth = 0.5f;
        [lgBtn setTitle:@"请登录" forState:UIControlStateNormal];
        [lgBtn setTitleColor:[CROCommonAPI colorWithHexString:@"#939393"] forState:UIControlStateNormal];
        lgBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [lgBtn addTarget:self action:@selector(intoLoginView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:iconPerson];
        [self addSubview:lgBtn];
    }
    return self;
}

- (void)intoLoginView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(segueIntoLoginView)]) {
        [self.delegate segueIntoLoginView];
    }
}

@end
