//
//  ReceiptListCell.m
//  crossShop
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ReceiptListCell.h"
#import "ModelData.h"

@implementation ReceiptListCell

- (void)awakeFromNib {
    // Initialization code
    [self.selectBtn setImage:[UIImage imageNamed:@"item_select_true"] forState:UIControlStateSelected];
    [self.selectBtn setImage:[UIImage imageNamed:@"item_select_false"] forState:UIControlStateNormal];
    self.selectBtn.selected = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    //self.selectBtn.selected = YES;
    // Configure the view for the selected state
}

- (void)configCellByDic:(NSDictionary *)dicData {
    self.username.text = [dicData objectForKey:kReceiptUser];
    self.telephone.text = [dicData objectForKey:kReceiptTel];
    self.address.text = [dicData objectForKey:kReceiptAddr];
}

- (IBAction)selectReceiptAct:(id)sender {
    
}

@end
