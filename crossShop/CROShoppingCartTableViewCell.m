//
//  CROShoppingCartTableViewCell.m
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingCartTableViewCell.h"
#import "CROShoppingAlertView.h"

@implementation CROShoppingCartTableViewCell {
    BOOL isSelected;
    NSInteger goodCount;
    NSInteger goodPrice;
    NSInteger goodOriPrice;
    NSString *goodsID;
}

- (void)awakeFromNib {
    // Initialization code
    
    [self changeCellMode:false];
    self.imgSellOut.hidden = YES;
    self.selectBtn.selected = NO;
    isSelected = self.selectBtn.selected;
    [self.selectBtn setImage:[UIImage imageNamed:@"item_select_true"] forState:UIControlStateSelected];
    [self.selectBtn setImage:[UIImage imageNamed:@"item_select_false"] forState:UIControlStateNormal];
    //[self.selectBtn addTarget:self action:@selector(addGoods) forControlEvents:UIControlEventTouchUpInside];
    goodCount = 0;
    goodPrice = 0;
    goodOriPrice = 0;
    [self addGoods];
}

- (void)addGoods {
    isSelected = !isSelected;
    self.selectBtn.selected = isSelected;
    //NSLog(@"\r\n isselected:%d", isSelected);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellByDicData: (NSDictionary *)dicData {
    if ([dicData objectForKey:@"itemCover"]) {
        [self.itemImg setItemImgWithUrl:[dicData objectForKey:@"itemCover"]];
    }
    if ([dicData objectForKey:@"itemName"]) {
        self.titleLabel.text = [dicData objectForKey:@"itemName"];
    }
    if ([dicData objectForKey:@"itemCount"]) {
        NSString *strNum = [NSString stringWithFormat:@"%@", [dicData objectForKey:@"itemCount"]];
        //NSLog(@"\r\n class:%@, strNum:%@", [[dicData objectForKey:@"itemCount"] class], strNum);
        goodCount = [(NSNumber *)[dicData objectForKey:@"itemCount"] integerValue];
        self.realNumLabel.text = strNum;
        self.editTxt.text = strNum;
    }
    if ([dicData objectForKey:@"itemPrice"]) {
        NSString *strNum = [NSString stringWithFormat:@"%@", [dicData objectForKey:@"itemPrice"]];
        self.priceLabel.text = strNum;
        goodPrice = [(NSNumber *)[dicData objectForKey:@"itemPrice"] integerValue];
    }
    if ([dicData objectForKey:@"itemOriPrice"]) {
        goodOriPrice = [(NSNumber *)[dicData objectForKey:@"itemOriPrice"] integerValue];
    }
    goodsID = [dicData objectForKey:@"itemID"];
    [self checkCount];
}

- (IBAction)selectAct:(id)sender {
    [self selectGoodIfSelected:!isSelected];
}

- (void)selectGoodIfSelected: (BOOL)isSel {
    isSelected = isSel;
    self.selectBtn.selected = isSelected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(calculatePriceIfSelect:oriPrice:mode:goodId:)]) {
        NSInteger goodPriceReal = goodPrice * goodCount;
        NSInteger goodOriPriceReal = goodOriPrice * goodCount;
        if (isSelected == true) {
            [self.delegate calculatePriceIfSelect:goodPriceReal oriPrice:goodOriPriceReal mode:true goodId:goodsID];
        } else {
            [self.delegate calculatePriceIfSelect:goodPriceReal oriPrice:goodOriPriceReal mode:false goodId:goodsID];
        }
    }
}

- (void)changeCellMode: (BOOL)isEdit {
    if (isEdit == true) {
        self.xLabel.hidden = YES;
        self.realNumLabel.hidden = YES;
        self.reduceBtn.hidden = NO;
        self.editTxt.hidden = NO;
        self.plusBtn.hidden = NO;
        self.deleteBtn.hidden = NO;
    } else {
        self.xLabel.hidden = NO;
        self.realNumLabel.hidden = NO;
        self.reduceBtn.hidden = YES;
        self.editTxt.hidden = YES;
        self.plusBtn.hidden = YES;
        self.deleteBtn.hidden = YES;
    }
    self.realNumLabel.text = [NSString stringWithFormat:@"%ld", (long)goodCount];
}

- (BOOL)checkCount {
    if (goodCount <= 1) {
        [self.reduceBtn setImage:[UIImage imageNamed:@"item_reduce_false"] forState:UIControlStateNormal];
        return false;
    } else {
        [self.reduceBtn setImage:[UIImage imageNamed:@"item_reduce_true"] forState:UIControlStateNormal];
        return true;
    }
}

- (IBAction)reduceCount:(id)sender {
    if (goodCount > 1) {
        goodCount--;
        if (isSelected == true) {
            [self calculateTotalPrice:false];
        }
    }
    [self checkCount];
    self.editTxt.text = [NSString stringWithFormat:@"%ld", (long)goodCount];
}

- (IBAction)plusCount:(id)sender {
    goodCount++;
    self.editTxt.text = [NSString stringWithFormat:@"%ld", (long)goodCount];
    [self.reduceBtn setImage:[UIImage imageNamed:@"item_reduce_true"] forState:UIControlStateNormal];
    if (isSelected == true) {
        [self calculateTotalPrice:true];
    }
}

- (IBAction)deleteGoodsAct:(id)sender {
    CROShoppingAlertView *delView = [[CROShoppingAlertView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:delView];
    //[self addSubview:delView];
    
}

- (void)calculateTotalPrice: (BOOL)mode {
    if (self.delegate && [self.delegate respondsToSelector:@selector(calculatePrice:oriPrice:)]) {
        if (mode == true) {
            [self.delegate calculatePrice:goodPrice oriPrice:goodOriPrice];
        } else {
            [self.delegate calculatePrice:(-goodPrice) oriPrice:(-goodOriPrice)];
        }
    }
}

@end
