//
//  CROCommonAPI.h
//  crossShop
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kDEBUG_DATA     1
@interface CROCommonAPI : NSObject

+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view;
+ (NSString *)setDateInfoByDouble: (double)dDate;

@end
