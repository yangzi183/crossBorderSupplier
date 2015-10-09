//
//  ShoppingCartItem.m
//  crossShop
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ShoppingCartItem.h"

@implementation ShoppingCartItem {
    UILabel *numberLabel;
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
        UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 2, 24, 24)];
        iconImg.image = [UIImage imageNamed:@"shopping_cart_icon"];
        UIImageView *redImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, -7, 20, 22)];
        redImg.image = [UIImage imageNamed:@"red_icon"];
        [self addSubview:iconImg];
        [self addSubview:redImg];
        numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 22)];
        numberLabel.font = [UIFont systemFontOfSize:13];
        numberLabel.textColor = [UIColor whiteColor];
        numberLabel.textAlignment = NSTextAlignmentCenter;
        NSInteger number = [self getNumberItems];
        numberLabel.text = [NSString stringWithFormat:@"%d", (int)number];
        if (number != 0) {
            [redImg addSubview:numberLabel];
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapShoppingCart)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapShoppingCart {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tapShoppingCartView)]) {
        [self.delegate tapShoppingCartView];
    }
}

- (NSInteger)getNumberItems {
    return 11;
}
@end
