//
//  DetailGoodsQuestionCell.m
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DetailGoodsQuestionCell.h"
#import "CROCommonAPI.h"
#import "ReturnGoodsViewController.h"

@implementation DetailGoodsQuestionCell

- (void)awakeFromNib {
    // Initialization code
    
    self.buyBtn.layer.borderColor = [CROCommonAPI colorWithHexString:@"#82D6D6"].CGColor;
    self.buyBtn.layer.borderWidth = 1.0f;
    self.buyBtn.layer.cornerRadius = 10;
    self.revokeBtn.layer.borderColor = [CROCommonAPI colorWithHexString:@"#82D6D6"].CGColor;
    self.revokeBtn.layer.borderWidth = 1.0f;
    self.revokeBtn.layer.cornerRadius = 10;
    
}

- (void)configView {
    NSLog(@"\r\n cell.width:%f", self.frame.size.width);
    CGSize size = self.frame.size;
    [self.labelImg1 setContent:@"您拍下商品后，首先会由海关对商品进行清关，清关需要2-3个工作日。" number:0 size:size];
    [self.labelImg2 setContent:@"清关后商品即交由国内快递进行物流运输，物流时间根据收货地址远近会在1-5天不等。" number:0 size:size];
    [self.labelImg3 setContent:@"一般来说，拍下商品7天左右您的商品便到达您家啦！" number:0 size:size];
    
    [self.labelImgRev1 setContent:@"如果您收到的商品符合布丁海购的退货条件，请拨打客服热线联系我们的客服为您进行受理。" number:0 size:size];
    [self.labelImgRev2 setContent:@"客服会与您核实商品状况和确认退货需求，然后具体安排退货事宜。" number:0 size:size];
    [self.labelImgRev3 setContent:@"退货的处理一般在您联系客服后一周内完成。" number:0 size:size];
    [self.labelImgRev4 setContent:@"因海关流程监管需要，目前只能支持退货，暂不支持换货。" number:0 size:size];
    
    [self.labelImgReturn1 setContent:@"在运输过程中发生破损、泄露、损坏等情况。" number:1 size:size];
    [self.labelImgReturn2 setContent:@"收到的商品与所拍商品不符，商品发错的情况。" number:2 size:size];
    [self.labelImgReturn3 setContent:@"商品已过保质期。" number:3 size:size];
    [self.labelImgReturn4 setContent:@"运输时间超过30天仍未到货，经物流核实后可退款。" number:4 size:size];
    [self.labelImgReturn5 setContent:@"因个人原因需要退货，经验收未使用，不影响二次销售。" number:5 size:size];
    
    [self.labelImgNot6 setContent:@"商品已经使用，影响二次销售。" number:1 size:size];
    [self.labelImgNot1 setContent:@"非本网站购买的商品。" number:2 size:size];
    [self.labelImgNot2 setContent:@"超过7天退货周期，未提交的退货申请便不再支持退货。" number:3 size:size];
    [self.labelImgNot3 setContent:@"在运输中商品的轻微磨损，如不影响正常使用的情况。" number:4 size:size];
    [self.labelImgNot4 setContent:@"打包商品中的某一件，不能支持部分退货。" number:5 size:size];
    [self.labelImgNot5 setContent:@"商品在使用过程中，因使用不当造成的损失，不可列入退货范围。" number:6 size:size];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buyAct:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toBuyProcessView)]) {
        [self.delegate toBuyProcessView];
    }
}

- (IBAction)revokeAct:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toReturnGoodsView)]) {
        [self.delegate toReturnGoodsView];
    }
}
@end
