//
//  OrderConfirmController.h
//  crossShop
//
//  Created by mac on 15/7/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderConfirmHeadCell.h"

@interface OrderConfirmController : UIViewController <UITableViewDelegate, UITableViewDataSource, OrderConfirmHeadCellDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backAct:(id)sender;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end
