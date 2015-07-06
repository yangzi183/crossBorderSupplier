//
//  OrderConfirmHeadCell.h
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OrderConfirmHeadCellDelegate <NSObject>

- (void)intoCreateNewReceipt;

@end

@interface OrderConfirmHeadCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *telephone;
@property (strong, nonatomic) IBOutlet UILabel *address;
- (IBAction)newReceiptAct:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *goodsReceiptNew;
@property (nonatomic) id<OrderConfirmHeadCellDelegate> delegate;

- (void)configCellInfo;

@end
