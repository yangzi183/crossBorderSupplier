//
//  imgWithTitleView.h
//  crossShop
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CROCommonAPI.h"

#define kIconImgWidth               30
#define kIconImgHeight              30
#define kIconImgMargin              5

@interface imgWithTitleView : UIView

- (void)configImg: (UIImage *)iconImg withTitle:(NSString *)title widthSize:(CGSize)toSize;

@end
