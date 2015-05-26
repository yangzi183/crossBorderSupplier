//
//  CROGoodsItem.h
//  crossShop
//
//  Created by apple on 15/5/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CROGoodsItem : NSObject

@property (strong, nonatomic) NSString *itemTitle;
@property (strong, nonatomic) NSString *itemImgUrl;
@property (strong, nonatomic) NSString *itemIconUrl;
@property (nonatomic) NSInteger oriPrice;
@property (nonatomic) NSInteger curPrice;
@property (strong, nonatomic) NSString *itemID;

@end
