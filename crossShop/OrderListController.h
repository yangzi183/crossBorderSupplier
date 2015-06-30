//
//  OrderListController.h
//  crossShop
//
//  Created by mac on 15/6/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListCell.h"

@interface OrderListController : UITableViewController
- (IBAction)backAct:(id)sender;

@property (strong, nonatomic) NSMutableArray *dataArray;
@end
