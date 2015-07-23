//
//  DetailGoodsQuestionCell.m
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DetailGoodsQuestionCell.h"
#import "CROCommonAPI.h"

@implementation DetailGoodsQuestionCell

- (void)awakeFromNib {
    // Initialization code
    [self.labelImg1 setContent:@"您拍下商品后，首先会由海关对商品进行清关，清关需要2-3个工作日。" number:0];
    [self.labelImg2 setContent:@"清关后商品即交由国内快递进行物流运输，物流时间根据收货地址远近会在1-5天不等。" number:0];
    [self.labelImg3 setContent:@"一般来说，拍下商品7天左右您的商品便到达您家啦！" number:0];
    
    [self.labelImgRev1 setContent:@"如果您收到的商品符合布丁海购的退货条件，请拨打客服热线联系我们的客服为您进行受理。" number:0];
    [self.labelImgRev2 setContent:@"客服会与您核实商品状况和确认退货需求，然后具体安排退货事宜。" number:0];
    [self.labelImgRev3 setContent:@"退货的处理一般在您联系客服后一周内完成。" number:0];
    [self.labelImgRev4 setContent:@"因海关流程监管需要，目前只能支持退货，暂不支持换货。" number:0];
    
    self.buyBtn.layer.borderColor = [CROCommonAPI colorWithHexString:@"#82D6D6"].CGColor;
    self.buyBtn.layer.borderWidth = 1.0f;
    self.buyBtn.layer.cornerRadius = 10;
    self.revokeBtn.layer.borderColor = [CROCommonAPI colorWithHexString:@"#82D6D6"].CGColor;
    self.revokeBtn.layer.borderWidth = 1.0f;
    self.revokeBtn.layer.cornerRadius = 10;
    
}

- (void)configView {
    [self.labelImg1 setContent:@"您拍下商品后，首先会由海关对商品进行清关，清关需要2-3个工作日。" number:0];
    [self.labelImg2 setContent:@"清关后商品即交由国内快递进行物流运输，物流时间根据收货地址远近会在1-5天不等。" number:0];
    [self.labelImg3 setContent:@"一般来说，拍下商品7天左右您的商品便到达您家啦！" number:0];
    
    [self.labelImgRev1 setContent:@"如果您收到的商品符合布丁海购的退货条件，请拨打客服热线联系我们的客服为您进行受理。" number:0];
    [self.labelImgRev2 setContent:@"客服会与您核实商品状况和确认退货需求，然后具体安排退货事宜。" number:0];
    [self.labelImgRev3 setContent:@"退货的处理一般在您联系客服后一周内完成。" number:0];
    [self.labelImgRev4 setContent:@"因海关流程监管需要，目前只能支持退货，暂不支持换货。" number:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buyAct:(id)sender {
}

- (IBAction)revokeAct:(id)sender {
}
@end
