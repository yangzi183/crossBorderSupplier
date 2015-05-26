//
//  CROShoppingCart.h
//  crossShop
//
//  Created by apple on 15/5/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CROGoodsItem.h"

@interface CROShoppingCart : NSObject

@property (strong, nonatomic) NSMutableArray *goodsArray;

- (NSMutableArray *)getAllGoods;
@end
