//
//  CROOrderList.m
//  crossShop
//
//  Created by mac on 15/6/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROOrderList.h"
#import <SBJson4.h>

static CROOrderList *CROOrderListInstance;
@implementation CROOrderList

+ (CROOrderList *) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CROOrderListInstance = [[CROOrderList alloc]init];
    });
    return CROOrderListInstance;
}

- (NSMutableArray *)getAllOrderList {
    self.orderListArray = [[NSMutableArray alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"test3" ofType:@"js"];
    
    SBJson4ValueBlock parserBlock = ^(id item, BOOL *stop) {
        if ([item isKindOfClass:[NSArray class]]) {
            self.orderListArray = [NSMutableArray arrayWithArray:item];
            //NSLog(@"\r\n array:%@", item);
        }
    };
    SBJson4ErrorBlock parserError = ^(NSError *error) {
        NSLog(@"\r\n error:%@", error);
    };
    SBJson4Parser *jsonParser = [SBJson4Parser parserWithBlock:parserBlock allowMultiRoot:NO unwrapRootArray:NO errorHandler:parserError];
    
    [jsonParser parse:[NSData dataWithContentsOfFile:jsonPath]];
    
    return self.orderListArray;
}

- (NSMutableArray *)getNormalList {
    self.normalList = [[NSMutableArray alloc] initWithObjects:@"下单时间", @"商品总价", @"物流费用", @"关税", @"使用代金券", @"活动优惠", @"应付总额", @"支付方式", nil];
    return self.normalList;
}

- (NSMutableArray *)getContentList {
    NSString *orderTime = [self getOrderDate];
    NSMutableArray *contentArray = [[NSMutableArray alloc] initWithObjects:orderTime, @"￥445", @"￥19", @"￥33", @"-￥15", @"-￥10", @"￥466", nil];
    return contentArray;
}

- (NSString *)getOrderDate {
    return @"2015/1/15 23:22";
}



@end
