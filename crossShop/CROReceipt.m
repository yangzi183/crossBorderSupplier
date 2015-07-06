//
//  CROReceipt.m
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROReceipt.h"
#import <SBJson4.h>

static CROReceipt *CROReceiptInstance;
@implementation CROReceipt

+ (CROReceipt *) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CROReceiptInstance = [[CROReceipt alloc]init];
    });
    return CROReceiptInstance;
}

- (NSMutableArray *)getAllReceipts {
    self.receiptArray = [[NSMutableArray alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"test41" ofType:@"js"];
    // NSString *jsonStr = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"\r\n jsonStr:%@", jsonStr);
    SBJson4ValueBlock parserBlock = ^(id item, BOOL *stop) {
        if ([item isKindOfClass:[NSArray class]]) {
            self.receiptArray = [NSMutableArray arrayWithArray:item];
            //NSLog(@"\r\n array:%@", item);
        }
    };
    SBJson4ErrorBlock parserError = ^(NSError *error) {
        NSLog(@"\r\n error:%@", error);
    };
    SBJson4Parser *jsonParser = [SBJson4Parser parserWithBlock:parserBlock allowMultiRoot:NO unwrapRootArray:NO errorHandler:parserError];
    
    [jsonParser parse:[NSData dataWithContentsOfFile:jsonPath]];
    
    return self.receiptArray;
}

@end
