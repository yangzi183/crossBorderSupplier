//
//  OrderDetailNormalCell.h
//  crossShop
//
//  Created by mac on 15/7/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kOrderDetailNormalCellHeight        31

typedef enum {
    ORDER_MODE_CONFIRM,
    ORDER_MODE_DETAIL,
    ORDER_MODE_LOGISTICS
}ORDER_DETAIL_NORMAL_CELL_MODE;

@interface OrderDetailNormalCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *contentImg;
@property (strong, nonatomic) IBOutlet UIImageView *dutyImg;
@property (strong, nonatomic) IBOutlet UIView *bottomLineView;
- (void)setContentInfoByIndex: (NSInteger)index toMode:(ORDER_DETAIL_NORMAL_CELL_MODE)mode;
@end
