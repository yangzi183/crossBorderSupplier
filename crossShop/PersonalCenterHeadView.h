//
//  PersonalCenterHeadView.h
//  crossShop
//
//  Created by mac on 15/6/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CROCommonAPI.h"

#define kIconPersonWidth                70
#define kIconPersonHeight               80
#define kPersonLoginBtnWidth            80
#define kPersonLoginBtnHeight           22

@protocol PersonalCenterHeadViewDelegate <NSObject>

- (void)segueIntoLoginView;

@end

@interface PersonalCenterHeadView : UIView

@property (nonatomic, assign) id<PersonalCenterHeadViewDelegate> delegate;
@end
