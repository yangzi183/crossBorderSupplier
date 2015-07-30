//
//  orderFootView.m
//  crossShop
//
//  Created by mac on 15/6/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "orderFootView.h"
#import "CROCommonAPI.h"
#import "commonConfig.h"

@implementation orderFootView {
    UILabel *countPrice;
    UIButton *payNowBtn;
    UIButton *receiptBtn;
    UIButton *delOrderBtn;
    UIButton *cancelBtn;
    UIView *footLine;
    UIView *lineView;
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
        self.backgroundColor = [UIColor whiteColor];
        countPrice = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 17 - 45, 7, 45, 20)];
        countPrice.font = [UIFont systemFontOfSize:15];
        countPrice.textColor = [CROCommonAPI colorWithHexString:@"#8C8C8C"];
        UILabel *symbol = [[UILabel alloc] initWithFrame:CGRectMake(countPrice.frame.origin.x - 16, 8, 15, 20)];
        symbol.font = [UIFont systemFontOfSize:16];
        symbol.text = @"￥";
        symbol.textColor = countPrice.textColor;
        UILabel *priceTitle = [[UILabel alloc] initWithFrame:CGRectMake(symbol.frame.origin.x - 30, 8, 33, 20)];
        priceTitle.text = @"共计:";
        priceTitle.font = [UIFont systemFontOfSize:14];
        priceTitle.textColor = countPrice.textColor;
        [self addSubview:countPrice];
        [self addSubview:symbol];
        [self addSubview:priceTitle];
        lineView = [[UIView alloc] initWithFrame:CGRectMake(0, countPrice.frame.origin.y + 27, self.frame.size.width, 1)];
        lineView.backgroundColor = [CROCommonAPI colorWithHexString:kThinLineColor];
        [self addSubview:lineView];
        
        payNowBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 102, lineView.frame.origin.y + 11, 85, 35)];
        payNowBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [payNowBtn setTitle:@"立即付款" forState:UIControlStateNormal];
        [payNowBtn setTitleColor:[CROCommonAPI colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        payNowBtn.layer.backgroundColor = [CROCommonAPI colorWithHexString:@"82D6D6"].CGColor;
        [payNowBtn addTarget:self action:@selector(payNowAct) forControlEvents:UIControlEventTouchUpInside];
        
        receiptBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 102, lineView.frame.origin.y + 11, 85, 35)];
        receiptBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [receiptBtn setTitle:@"确认收货" forState:UIControlStateNormal];
        [receiptBtn setTitleColor:[CROCommonAPI colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        receiptBtn.layer.backgroundColor = [CROCommonAPI colorWithHexString:@"82D6D6"].CGColor;
        [receiptBtn addTarget:self action:@selector(receiptAct) forControlEvents:UIControlEventTouchUpInside];

        delOrderBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 102, lineView.frame.origin.y + 11, 85, 35)];
        delOrderBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [delOrderBtn setTitle:@"删除订单" forState:UIControlStateNormal];
        [delOrderBtn setTitleColor:[CROCommonAPI colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        delOrderBtn.layer.backgroundColor = [CROCommonAPI colorWithHexString:@"D3D3D3"].CGColor;
        [delOrderBtn addTarget:self action:@selector(delOrderAct) forControlEvents:UIControlEventTouchUpInside];

        cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 102 - 95, lineView.frame.origin.y + 11, 85, 35)];
        cancelBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [cancelBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[CROCommonAPI colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        cancelBtn.layer.backgroundColor = [CROCommonAPI colorWithHexString:@"D3D3D3"].CGColor;
        [cancelBtn addTarget:self action:@selector(cancelAct) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:payNowBtn];
        [self addSubview:receiptBtn];
        [self addSubview:delOrderBtn];
        [self addSubview:cancelBtn];
        
        footLine = [[UIView alloc] initWithFrame:CGRectMake(0, cancelBtn.frame.origin.y + 45, self.frame.size.width, kThickLineHeight)];
        footLine.backgroundColor = [CROCommonAPI colorWithHexString:kThickLineColor];
        //NSLog(@"\r\n footy:%f", footLine.frame.origin.y);
        [self addSubview:footLine];
    }
    return self;
}

- (void)configFootViewWithPrice: (NSString *)price mode:(ORDER_LIST_MODE)mode {
    countPrice.text = price;
    lineView.hidden = NO;
    switch (mode) {
        case ORDER_TO_BE_PAID:
            payNowBtn.hidden = NO;
            receiptBtn.hidden = YES;
            delOrderBtn.hidden = YES;
            cancelBtn.hidden = NO;
            break;
            
        case ORDER_TO_BE_SHIPPED:
            payNowBtn.hidden = YES;
            receiptBtn.hidden = YES;
            delOrderBtn.hidden = YES;
            cancelBtn.hidden = YES;
            lineView.hidden = YES;
            footLine.frame = CGRectOffset(footLine.frame, 0, -51);
            break;
            
        case ORDER_IS_DELIVERED:
            payNowBtn.hidden = YES;
            receiptBtn.hidden = NO;
            delOrderBtn.hidden = YES;
            cancelBtn.hidden = YES;
            break;
        
        case ORDER_IS_FAILURE:
            payNowBtn.hidden = YES;
            receiptBtn.hidden = YES;
            delOrderBtn.hidden = NO;
            cancelBtn.hidden = YES;
            break;
        
        case ORDER_DONE:
            payNowBtn.hidden = YES;
            receiptBtn.hidden = YES;
            delOrderBtn.hidden = NO;
            cancelBtn.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (void)payNowAct {
    NSLog(@"\r\n func:%s", __func__);
}

- (void)receiptAct {
        NSLog(@"\r\n func:%s", __func__);
}

- (void)delOrderAct {
        NSLog(@"\r\n func:%s", __func__);
}

- (void)cancelAct {
        NSLog(@"\r\n func:%s", __func__);
}

@end
