//
//  PersonalCenterFootView.m
//  crossShop
//
//  Created by mac on 15/6/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PersonalCenterFootView.h"

@implementation PersonalCenterFootView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *customerIcon = [[UIImageView alloc]initWithFrame:CGRectMake(40, 0, 20, 20)];
        customerIcon.image = [UIImage imageNamed:@"diaper_icon"];
        UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 0, 60, 20)];
    }
    return self;
}
@end
