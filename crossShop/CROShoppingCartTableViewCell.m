//
//  CROShoppingCartTableViewCell.m
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingCartTableViewCell.h"

@implementation CROShoppingCartTableViewCell {
    BOOL isSelected;
    NSInteger goodCount;
}

- (void)awakeFromNib {
    // Initialization code
    
    [self changeCellMode:false];
    self.imgBack.layer.borderColor = [CROCommonAPI colorWithHexString:@"#f7f7f7"].CGColor;
    self.imgBack.layer.borderWidth = 0.5f;
    self.imgSellOut.hidden = YES;
    self.selectBtn.selected = NO;
    isSelected = self.selectBtn.selected;
    [self.selectBtn setImage:[UIImage imageNamed:@"item_select_true"] forState:UIControlStateSelected];
    [self.selectBtn setImage:[UIImage imageNamed:@"item_select_false"] forState:UIControlStateNormal];
    [self.selectBtn addTarget:self action:@selector(addGoods) forControlEvents:UIControlEventTouchUpInside];
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
        [self.imgIcon sd_setImageWithURL:[NSURL URLWithString:[dicData objectForKey:@"itemCover"]] placeholderImage:[UIImage imageNamed:@"shoppingCart.png"]];
    }
    if ([dicData objectForKey:@"itemName"]) {
        self.titleLabel.text = [dicData objectForKey:@"itemName"];
    }
    if ([dicData objectForKey:@"itemCount"]) {
        NSString *strNum = [NSString stringWithFormat:@"%@", [dicData objectForKey:@"itemCount"]];
        //NSLog(@"\r\n class:%@, strNum:%@", [[dicData objectForKey:@"itemCount"] class], strNum);
        goodCount = [(NSNumber *)[dicData objectForKey:@"itemCount"] integerValue];
        self.realNumLabel.text = strNum;
    }
    if ([dicData objectForKey:@"itemPrice"]) {
        NSString *strNum = [NSString stringWithFormat:@"%@", [dicData objectForKey:@"itemPrice"]];
        //NSLog(@"\r\n class:%@", [[dicData objectForKey:@"itemPrice"] class]);
        self.priceLabel.text = strNum;
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
}

- (IBAction)reduceCount:(id)sender {
    
}

- (IBAction)plusCount:(id)sender {
}

@end
