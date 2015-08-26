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
#import "ShoppingCartItem.h"

@interface CROMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ShoppingCartItemDelegate>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
//@property (strong, nonatomic) NSMutableDictionary *dicData;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *shoppingCartIcon;

@end
