//
//  CROShoppingCart.m
//  crossShop
//
//  Created by apple on 15/5/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingCart.h"

static CROShoppingCart *CROShoppingCartInstance;
@implementation CROShoppingCart

+ (CROShoppingCart *) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CROShoppingCartInstance = [[CROShoppingCart alloc]init];
    });
    return CROShoppingCartInstance;
}

- (NSMutableArray *)getAllGoods {
    self.goodsArray = [[NSMutableArray alloc]init];
    NSDictionary *goodsDic = [[NSDictionary alloc]init];
    NSArray *arrayWithDispatch = goodsDic[@"dispatchs"];
    
    return self.goodsArray;
}

@end
