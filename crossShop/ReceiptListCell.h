//
//  ReceiptListCell.h
//  crossShop
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kReceiptListCellHeight          82

@interface ReceiptListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *telephone;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UIButton *selectBtn;

@end
