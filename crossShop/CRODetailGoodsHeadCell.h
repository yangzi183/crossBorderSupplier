//
//  CRODetailGoodsHeadCell.h
//  crossShop
//
//  Created by mac on 15/6/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imgWithTitleView.h"
#import "imgWithIntroView.h"

#define DETAIL_CELL_HEAD_HEIGHT     430

@interface CRODetailGoodsHeadCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *discount;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *curPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *oriPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *labelLabel;
@property (strong, nonatomic) IBOutlet UILabel *dispatchLabel;
@property (strong, nonatomic) IBOutlet UILabel *taxLabel;
@property (strong, nonatomic) IBOutlet UILabel *freightLabel;
@property (strong, nonatomic) IBOutlet UIImageView *coverImg;

@end
