//
//  imgWithIntroView.h
//  crossShop
//
//  Created by mac on 15/6/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kIntroImgWidth               15
#define kIntroImgHeight              15
#define kIntroImgMargin              5

@interface imgWithIntroView : UIView

- (void)configImg: (UIImage *)iconImg withTitle:(NSString *)title widthSize:(CGSize)toSize;

@end
