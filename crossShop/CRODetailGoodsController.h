//
//  CRODetailGoodsController.h
//  crossShop
//
//  Created by mac on 15/6/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRODetailGoodsHeadCell.h"
#import "DetailGoodsImageCell.h"
#import "DetailGoodsIntroCell.h"
#import "DetailGoodsQuestionCell.h"

typedef enum {
    SELECT_IMAGE = 0,
    SELECT_INTRO,
    SELECT_QUESTION
}ISSELECTDETAILITEM;

@interface CRODetailGoodsController : UITableViewController <imgWithIntroViewDelegate>

@property (strong, nonatomic) NSDictionary *dicDetailData;

@property (strong, nonatomic) NSArray *itemImgArray;
@end
