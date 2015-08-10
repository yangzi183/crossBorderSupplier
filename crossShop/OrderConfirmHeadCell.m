//
//  OrderConfirmHeadCell.m
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderConfirmHeadCell.h"
#import "CROReceipt.h"

@implementation OrderConfirmHeadCell {
    UITapGestureRecognizer *tap;
    NSMutableArray *receipts;
    RECEIPT_VIEW mode;
}

- (void)awakeFromNib {
    // Initialization code
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(intoReceiptsView)];
    [self.clearView addGestureRecognizer:tap];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)newReceiptAct:(id)sender {
}

- (void)intoReceiptsView {
    NSLog(@"\r\n intoReceiptsView:%@", receipts);
    if (self.delegate && [self.delegate respondsToSelector:@selector(intoCreateNewReceiptToMode:)]) {
        [self.delegate intoCreateNewReceiptToMode:mode];
    }
}

- (void)configCellInfo {
    self.goodsReceiptNew.layer.borderColor = [UIColor blackColor].CGColor;
    self.goodsReceiptNew.layer.borderWidth = 0.7f;
    self.goodsReceiptNew.layer.cornerRadius = 5;
    CROReceipt *receiptInstance = [CROReceipt shareInstance];
    receipts = [receiptInstance getAllReceipts];
    NSLog(@"\r\n receipts:%@", receipts);
    if (receipts.count > 1) {
        self.goodsReceiptNew.hidden = NO;
        self.username.hidden = YES;
        self.telephone.hidden = YES;
        self.address.hidden = YES;
        mode = RECEIPT_VIEW_NEW;
    } else {
        self.goodsReceiptNew.hidden = YES;
        self.username.hidden = NO;
        self.telephone.hidden = NO;
        self.address.hidden = NO;
        mode = RECEIPT_VIEW_LIST;
    }
}

@end
