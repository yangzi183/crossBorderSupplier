//
//  ModelData.h
//  crossShop
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "networkAPI.h"


#define kReceiptUser    @"username"
#define kReceiptTel     @"telephone"
#define kReceiptAddr    @"address"
#define kReceipt        @"receipt"
@interface ModelData : NSObject

+ (void)getModelInfoByBlock:(HTTPRequestArray)complete;
+ (void)getAllGoodsWithBlock:(HTTPRequestArray)complete page:(NSInteger)page;
+ (void)getGoodsDetailInfoWithBlock: (HTTPRequestDic)complete goodId:(NSString *)goodsId;
+ (void)getReceiptsList: (HTTPRequestArray)complete;

@end
