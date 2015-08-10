//
//  ReceiptListController.h
//  crossShop
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiptListController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
//- (IBAction)addNewReceiptAddrAct:(id)sender;
- (IBAction)backAct:(id)sender;

@end
