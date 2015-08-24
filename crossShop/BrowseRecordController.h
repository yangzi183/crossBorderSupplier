//
//  BrowseRecordController.h
//  crossShop
//
//  Created by mac on 15/8/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseRecordController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backAct:(id)sender;

@property (strong, nonatomic) NSMutableArray *dataArray;
@end
