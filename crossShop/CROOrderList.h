//
//  CROOrderList.h
//  crossShop
//
//  Created by mac on 15/6/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CROOrderList : NSObject
@property (strong, nonatomic) NSMutableArray *orderListArray;

+ (CROOrderList *) shareInstance;
- (NSMutableArray *)getAllOrderList;

@end
