//
//  DetailGoodsIntroCell.h
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dottedLineBorderView.h"
#import "LBorderView.h"

#define kDetailGoodsIntroCellHeight         360
@interface DetailGoodsIntroCell : UITableViewCell
@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView;

@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView2;
@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView3;
@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView4;
- (void)updateViewToConstraint;

@end
