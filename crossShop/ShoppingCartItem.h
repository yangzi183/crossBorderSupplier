//
//  ShoppingCartItem.h
//  crossShop
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSHOPPING_CART_ITEM_WIDTH       30
#define kSHOPPING_CART_ITEM_HEIGHT      30

@protocol ShoppingCartItemDelegate <NSObject>

- (void)tapShoppingCartView;

@end

@interface ShoppingCartItem : UIView

@property (assign, nonatomic) id <ShoppingCartItemDelegate> delegate;
@end
