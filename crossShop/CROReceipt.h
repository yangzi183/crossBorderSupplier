//
//  CROReceipt.h
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CROReceipt : NSObject

@property (strong, nonatomic) NSMutableArray *receiptArray;

+ (CROReceipt *) shareInstance;
- (NSMutableArray *)getAllReceipts;

@end
