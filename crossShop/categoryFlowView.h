//
//  categoryFlowView.h
//  crossShop
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCategoryScrollViewHeight       40
#define kCategoryScrollViewTop          10
#define kCategoryScrollImgWidth         63
#define kCategoryScrollMargin           7
#define kNOTIFICATION_INFO_CATEGORY_VIEW_CHANGE         @"categoryViewChange"
@interface categoryFlowView : UIView <UIScrollViewDelegate>

@property (strong, nonatomic) NSArray *dataArray;

- (void)configFlowTable: (CGFloat)withWidth;

@end
