//
//  CROMainViewController.h
//  crossShop
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imgWithTitleView.h"
#import "flowTableView.h"
#import "CROMainDetTableViewCell.h"

@interface CROMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet imgWithTitleView *diaper;
@property (weak, nonatomic) IBOutlet imgWithTitleView *milkPower;
@property (weak, nonatomic) IBOutlet imgWithTitleView *food;
@property (strong, nonatomic) IBOutlet flowTableView *flowTable;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconReal;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconPlane;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconExpress;
@property (strong, nonatomic) IBOutlet imgWithTitleView *iconSeven;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contentSizeWidth;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScroll;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSMutableArray *mainData;

@end
