//
//  commonConfig.h
//  crossShop
//
//  Created by apple on 15/5/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#ifndef crossShop_commonConfig_h
#define crossShop_commonConfig_h


#define screenWidth     [UIScreen mainScreen].bounds.size.width
#define screenHeight    [UIScreen mainScreen].bounds.size.height

#define kNOTIFICATION_INTO_TOPIC_VIEW           @"intoTopicView"
#define kNOTIFICATION_SHOW_TOPIC_VIEW           @"showTopicView"
#define kThickLineHeight                        6

#define kThickLineColor                         @"F5F6F6"
#define kThinLineColor                          @"F5F6F6"

#define willLoadToRemoveLine barLineView = [CROCommonAPI findHairlineImageViewUnder:self.navigationController.navigationBar]; \
barLineView.hidden = YES;

#define willLoadToSetThickGrayLine  lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, screenWidth, kThickLineHeight)]; \
lineView.backgroundColor = [CROCommonAPI colorWithHexString:@"#f5f6f6"]; \
[self.navigationController.navigationBar addSubview:lineView]; \

#define willDisappearToAddLine barLineView = [CROCommonAPI findHairlineImageViewUnder:self.navigationController.navigationBar]; \
barLineView.hidden = NO;

#define willDisappearToRemoveThickGrayLine   [lineView removeFromSuperview];

#define willLoadAddOrderLine    lineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, screenWidth, 2)];  \
lineImgView.image = [UIImage imageNamed:@"order_title_line"]; \
[self.navigationController.navigationBar addSubview:lineImgView]; 

#define willDisappearRemoveOrderLine        [lineImgView removeFromSuperview];

#define kWhiteBackWidth         260
#define kWhiteBackHeight        120
#define kLabelHeight            20
#define kMargin                 15
#define kMarginBtn              8
#define kBtnHeight              30
#define kBtnY                   60

#endif
