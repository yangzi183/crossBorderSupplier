//
//  TopicMode2Controller.h
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicMode2HeadCell.h"
#import "TopicMode2ItemCell.h"

@interface TopicMode2Controller : UITableViewController
- (IBAction)backView:(id)sender;
@property (strong, nonatomic) NSString *model_id;

@end
