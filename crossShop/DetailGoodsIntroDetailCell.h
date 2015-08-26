//
//  DetailGoodsIntroDetailCell.h
//  crossShop
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DETAIL_CELL_INTRO_HEIGHT     480

@interface DetailGoodsIntroDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *intro_anaphylactic;
@property (strong, nonatomic) IBOutlet UILabel *intro_pro_place;
@property (strong, nonatomic) IBOutlet UILabel *intro_spec;
@property (strong, nonatomic) IBOutlet UILabel *intro_age;
@property (strong, nonatomic) IBOutlet UILabel *intro_stroe;
@property (strong, nonatomic) IBOutlet UILabel *intro_date;
@property (strong, nonatomic) IBOutlet UILabel *intro_guide;

@property (strong, nonatomic) IBOutlet UILabel *brand;
@end
