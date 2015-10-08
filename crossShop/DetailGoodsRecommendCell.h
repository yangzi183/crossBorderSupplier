//
//  DetailGoodsRecommendCell.h
//  crossShop
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DETAIL_CELL_RECOMMEND_HEIGHT     140

@interface DetailGoodsRecommendCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UIImageView *recoImg;

@end
