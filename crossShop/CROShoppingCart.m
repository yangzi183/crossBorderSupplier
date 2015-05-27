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
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"test1" ofType:@"js"];
   // NSString *jsonStr = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"\r\n jsonStr:%@", jsonStr);
    SBJson4ValueBlock parserBlock = ^(id item, BOOL *stop) {
        if ([item isKindOfClass:[NSArray class]]) {
            self.goodsArray = [NSMutableArray arrayWithArray:item];
            //NSLog(@"\r\n array:%@", item);
        }
    };
    SBJson4ErrorBlock parserError = ^(NSError *error) {
        NSLog(@"\r\n error:%@", error);
    };
    SBJson4Parser *jsonParser = [SBJson4Parser parserWithBlock:parserBlock allowMultiRoot:NO unwrapRootArray:NO errorHandler:parserError];
    
    [jsonParser parse:[NSData dataWithContentsOfFile:jsonPath]];
    
    return self.goodsArray;
}

@end
