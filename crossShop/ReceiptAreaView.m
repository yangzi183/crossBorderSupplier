//
//  ReceiptAreaView.m
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ReceiptAreaView.h"

@implementation ReceiptAreaView

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
        UIPickerView *pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 80)];
        pickView.delegate = self;
        
    }
    return self;
}



@end
