//
//  ReceiptController.h
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiptController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *normalName;
@property (strong, nonatomic) IBOutlet UITextView *normalAddr;
@property (strong, nonatomic) IBOutlet UILabel *normalPlacehold;

- (IBAction)backAct:(id)sender;

@end
