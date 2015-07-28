//
//  DetailGoodsViewController.h
//  crossShop
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRODetailGoodsHeadCell.h"
#import "DetailGoodsImageCell.h"
#import "DetailGoodsIntroCell.h"
#import "DetailGoodsQuestionCell.h"
#import "DetailGoodsBrandCell.h"
#import "DetailGoodsIntroDetailCell.h"
#import "DetailGoodsModeCell.h"
#import "DetailGoodsRecommendCell.h"
#import "commonConfig.h"
#import "DetailGoodsSectionHeadCell.h"

#define kDetailSectionHeaderHeight          40
typedef enum {
    SELECT_IMAGE = 0,
    SELECT_INTRO,
    SELECT_QUESTION
}ISSELECTDETAILITEM;

@interface DetailGoodsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, imgWithIntroViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *dicDetailData;

@property (strong, nonatomic) NSArray *itemImgArray;

@end
