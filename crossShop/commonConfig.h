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

#endif
