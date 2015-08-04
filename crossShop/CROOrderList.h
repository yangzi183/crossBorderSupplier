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
@property (strong, nonatomic) NSMutableArray *normalList;

+ (CROOrderList *) shareInstance;
- (NSMutableArray *)getAllOrderList;
- (NSMutableArray *)getNormalList;
- (NSMutableArray *)getContentList;
- (NSMutableArray *)getConfirmOrderList;
- (NSMutableArray *)getConfirmContentList;

@end
