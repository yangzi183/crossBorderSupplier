//
//  PersonalCenterController.h
//  crossShop
//
//  Created by mac on 15/6/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalCenterHeadView.h"
#import "PersonalCenterCell.h"

@interface PersonalCenterController : UITableViewController <PersonalCenterHeadViewDelegate>
- (IBAction)backAct:(id)sender;

@end
