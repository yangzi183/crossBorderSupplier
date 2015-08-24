//
//  OrderDetailItemCell.h
//  crossShop
//
//  Created by mac on 15/7/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kOrderDetailItemCellHeight          89

@interface OrderDetailItemCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *xLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *coverImg;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
