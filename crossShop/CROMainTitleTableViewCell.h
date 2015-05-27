//
//  CROMainTitleTableViewCell.h
//  crossShop
//
//  Created by apple on 15/5/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imgWithTitleView.h"
#import "flowTableView.h"

#define kTitleCellHeight        425
@interface CROMainTitleTableViewCell : UITableViewCell {
    NSMutableArray *flowTableData;
}

@property (weak, nonatomic) IBOutlet imgWithTitleView *diaper;
@property (weak, nonatomic) IBOutlet imgWithTitleView *milkPower;
@property (weak, nonatomic) IBOutlet imgWithTitleView *food;
@property (strong, nonatomic) IBOutlet flowTableView *flowTable;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconReal;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconPlane;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconExpress;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconSeven;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginLeftScroll;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginRightScroll;

@end