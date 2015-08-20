//
//  CategoryGoods.m
//  crossShop
//
//  Created by mac on 15/8/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CategoryGoods.h"

@implementation CategoryGoods

+ (NSArray *)getBrandsByCategory:(CATEGORY_TYPE)categoryType {
    switch (categoryType) {
        case CATEGORY_FOOD: {
            NSArray *cateArray = [NSArray arrayWithObjects:@"http://img4q.duitang.com/uploads/item/201202/12/20120212145057_yKtnj.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/12/20120212145048_cjYNR.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", nil];
            return cateArray;
        }
        case CATEGORY_MILK: {
            NSArray *cateArray = [NSArray arrayWithObjects:@"http://img4q.duitang.com/uploads/item/201202/12/20120212145057_yKtnj.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/12/20120212145048_cjYNR.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", nil];
            return cateArray;
        }
        case CATEGORY_DIAPER: {
            NSArray *cateArray = [NSArray arrayWithObjects:@"http://img4q.duitang.com/uploads/item/201202/12/20120212145057_yKtnj.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/12/20120212145048_cjYNR.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", nil];
            return cateArray;
        }
        default:
        {
            NSArray *cateArray = [NSArray arrayWithObjects:@"http://img4q.duitang.com/uploads/item/201202/12/20120212145057_yKtnj.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/12/20120212145048_cjYNR.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", nil];
            return cateArray;
        }
    }
    
}

+ (NSArray *)getGoodsByBrandId: (NSInteger)brandId {
    NSInteger numBrand = brandId % 7;
    switch (numBrand) {
        case 1:{
            NSArray *goodsArray = [NSArray arrayWithObjects:@"test1", nil];
            return goodsArray;
        }
        case 2:{
            NSArray *goodsArray = [NSArray arrayWithObjects:@"test1", @"test1", nil];
            return goodsArray;
        }
        case 3:{
            NSArray *goodsArray = [NSArray arrayWithObjects:@"test1", @"test1", @"test1", nil];
            return goodsArray;
        }
        case 4:{
            NSArray *goodsArray = [NSArray arrayWithObjects:@"test1", @"test1", @"test1", @"test1", nil];
            return goodsArray;
        }
        case 5:{
            NSArray *goodsArray = [NSArray arrayWithObjects:@"test1", @"test1", @"test1", @"test1", @"test1",nil];
            return goodsArray;
        }
        case 6:{
            NSArray *goodsArray = [NSArray arrayWithObjects:@"test1", @"test1", @"test1", @"test1", @"test1", @"test1", nil];
            return goodsArray;
        }
        
        default:{
            NSArray *goodsArray = [NSArray arrayWithObjects:@"test1", nil];
            return goodsArray;
        }
    }
    
}
@end
