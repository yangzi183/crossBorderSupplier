//
//  OrderListCell.h
//  crossShop
//
//  Created by mac on 15/6/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "itemIconWithBackImg.h"

#define kOrderListCellHeight            81
@interface OrderListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UILabel *itemPrice;
@property (strong, nonatomic) IBOutlet UILabel *itemCount;

@property (strong, nonatomic) IBOutlet itemIconWithBackImg *itemImg;

- (void)setOrderItemInfoByDic: (NSDictionary *)dicData;

@end
