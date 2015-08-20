//
//  CategoryGoods.h
//  crossShop
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CROMainTitleTableViewCell.h"

@interface CategoryGoods : NSObject

+ (NSArray *)getBrandsByCategory:(CATEGORY_TYPE)categoryType;
+ (NSArray *)getGoodsByBrandId: (NSInteger)brandId;

@end
