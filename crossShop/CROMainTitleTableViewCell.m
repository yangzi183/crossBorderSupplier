//
//  CROMainTitleTableViewCell.m
//  crossShop
//
//  Created by apple on 15/5/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainTitleTableViewCell.h"
#import "ModelData.h"
@implementation CROMainTitleTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, screenWidth, kTitleCellHeight);
    [self initUI];
    CGFloat width = self.frame.size.width - self.marginLeftScroll.constant - self.marginRightScroll.constant;
   // NSLog(@"\r\n awakeFromNibwidth:%f", width);
    if (self.frame.size.width > 320) {
        self.flowHeight.constant = 260;
    }
    [self.flowTable configFlowTable:width];
    [self initData];
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(getTopicViewData:) name:kNOTIFICATION_INTO_TOPIC_VIEW object:nil];
}

- (void)initUI {
    UIImage *diaperImg = [UIImage imageNamed:@"diaper_icon"];
    UIImage *milkImg = [UIImage imageNamed:@"milk_icon"];
    UIImage *foodImg = [UIImage imageNamed:@"food_icon"];
  //  [self.diaper configImg:diaperImg withTitle:@"纸尿裤"];
    [self.milkPower configImg:milkImg withTitle:@"奶粉" widthSize:CGSizeMake(44, 60)];
    [self.diaper configImg:diaperImg withTitle:@"纸尿裤" widthSize:CGSizeMake(44, 60)];
    [self.food configImg:foodImg withTitle:@"辅食" widthSize:CGSizeMake(44, 60)];
    
    UIImage *realImg = [UIImage imageNamed:@"real_icon"];
    UIImage *planeImg = [UIImage imageNamed:@"plane_icon"];
    UIImage *expressImg = [UIImage imageNamed:@"express_icon"];
    UIImage *sevenImg = [UIImage imageNamed:@"seven_icon"];
    [self.iconReal configImg:realImg withTitle:@"正品保障" widthSize:CGSizeMake(60, 60)];
    [self.iconPlane configImg:planeImg withTitle:@"海外直采" widthSize:CGSizeMake(60, 60)];
    [self.iconExpress configImg:expressImg withTitle:@"保税区直邮" widthSize:CGSizeMake(60, 60)];
    [self.iconSeven configImg:sevenImg withTitle:@"7天退货" widthSize:CGSizeMake(60, 60)];
}

- (void)initData {
    flowTableData = [[NSMutableArray alloc]init];
    
    HTTPRequestArray completeBlock = ^(NSMutableArray *array) {
        //NSLog(@"\r\n initData flowTableData:%@", array);
        [self.flowTable setDataArray:array];
        flowTableData = array;
    };
    [ModelData getModelInfoByBlock:completeBlock];
}

- (void)getTopicViewData: (NSNotification *)sender {
    NSNumber *tagNumber = (NSNumber *)[sender object];
    NSDictionary *dicData = [flowTableData objectAtIndex:[tagNumber integerValue]];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_SHOW_TOPIC_VIEW object:dicData];
    NSLog(@"\r\n tagnuber:%ld", [tagNumber integerValue]);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
