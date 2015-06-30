//
//  orderFootView.h
//  crossShop
//
//  Created by mac on 15/6/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ORDER_TO_BE_PAID,
    ORDER_TO_BE_SHIPPED,
    ORDER_IS_FAILURE,
    ORDER_IS_DELIVERED,
    ORDER_DONE
}ORDER_LIST_MODE;

@interface orderFootView : UIView

@property (strong, nonatomic) NSString *totalPrice;
@property (nonatomic) NSInteger orderType;
- (void)configFootViewWithPrice: (NSString *)price mode:(ORDER_LIST_MODE)mode;

@end
