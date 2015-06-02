//
//  CROShoppingCartViewController.h
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CROShoppingCart.h"
#import "CROShoppingCartTableViewCell.h"

@interface CROShoppingCartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *shopBootomView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableViewTopMargin;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backBtn;
- (IBAction)backAct:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editBtn;
- (IBAction)editAct:(id)sender;


@property (strong, nonatomic) NSMutableArray *dataArray;
@end
