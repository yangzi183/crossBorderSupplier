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
#import "CROMainTitleTableViewCell.h"

@interface CROMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSMutableArray *mainData;

@end
