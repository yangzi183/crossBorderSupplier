//
//  DetailGoodsModeCell.h
//  crossShop
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imgWithTitleView.h"
#import "imgWithIntroView.h"

#define DETAIL_CELL_MODE_HEIGHT     170

typedef enum {
    ITEMDETAIL = 10,
    BUYINTRO,
    MOREQUESTION
}INTROIMAGENAME;

@interface DetailGoodsModeCell : UITableViewCell

@property (strong, nonatomic) IBOutlet imgWithTitleView *iconReal;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconPlane;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconExpress;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconSeven;

@property (strong, nonatomic) IBOutlet imgWithIntroView *itemDetail;
@property (strong, nonatomic) IBOutlet imgWithIntroView *buyIntro;
@property (strong, nonatomic) IBOutlet imgWithIntroView *moreQuestion;
@property (strong, nonatomic) IBOutlet UIView *moreView;

@end
