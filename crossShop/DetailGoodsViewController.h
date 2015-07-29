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

@interface DetailGoodsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, imgWithIntroViewDelegate, DetailGoodsQuestionCellDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *dicDetailData;

@property (strong, nonatomic) NSArray *itemImgArray;

@property (strong, nonatomic) IBOutlet UIButton *buyBtn;

@property (strong, nonatomic) IBOutlet UIImageView *imgIcon;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *reduceBtn;
@property (strong, nonatomic) IBOutlet UIButton *plusBtn;
@property (strong, nonatomic) IBOutlet UITextField *editTxt;
@property (strong, nonatomic) IBOutlet UIImageView *imgBack;
@property (strong, nonatomic) IBOutlet UILabel *realNumLabel;
@property (strong, nonatomic) IBOutlet UIView *clearBackView;
@property (strong, nonatomic) IBOutlet UIView *buyView;

- (IBAction)reduceCount:(id)sender;
- (IBAction)plusCount:(id)sender;
- (IBAction)buyAct:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *addShoppingCartBtn;
@property (strong, nonatomic) IBOutlet UIButton *paymentBtn;
- (IBAction)addShoppingCartAct:(id)sender;
- (IBAction)paymentAct:(id)sender;
- (IBAction)backAct:(id)sender;
@end
