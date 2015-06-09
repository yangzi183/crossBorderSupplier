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

@interface CRODetailGoodsHeadCell : UITableViewCell

@property (strong, nonatomic) IBOutlet imgWithTitleView *iconReal;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconPlane;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconExpress;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconSeven;

@property (strong, nonatomic) IBOutlet imgWithIntroView *itemDetail;
@property (strong, nonatomic) IBOutlet imgWithIntroView *buyIntro;
@property (strong, nonatomic) IBOutlet imgWithIntroView *moreQuestion;
@property (strong, nonatomic) IBOutlet UIView *moreView;

@end
