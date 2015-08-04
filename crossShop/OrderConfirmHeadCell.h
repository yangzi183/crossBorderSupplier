//
//  OrderConfirmHeadCell.h
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kOrderConfirmHeadCellHeight         75

typedef enum {
    RECEIPT_VIEW_NEW,
    RECEIPT_VIEW_LIST
}RECEIPT_VIEW;

@protocol OrderConfirmHeadCellDelegate <NSObject>

- (void)intoCreateNewReceiptToMode: (RECEIPT_VIEW)mode;

@end

@interface OrderConfirmHeadCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *telephone;
@property (strong, nonatomic) IBOutlet UILabel *address;
- (IBAction)newReceiptAct:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *goodsReceiptNew;
@property (nonatomic) id<OrderConfirmHeadCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *clearView;
- (void)configCellInfo;

@end
