//
//  ModelData.h
//  crossShop
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "networkAPI.h"

@interface ModelData : NSObject

+ (void)getModelInfoByBlock:(HTTPRequestArray)complete;

@end
