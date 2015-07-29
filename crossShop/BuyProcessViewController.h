//
//  BuyProcessViewController.h
//  crossShop
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dottedLineBorderView.h"

@interface BuyProcessViewController : UIViewController
@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView1;
@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView2;
@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView3;
@property (strong, nonatomic) IBOutlet dottedLineBorderView *dottedLineView4;

- (IBAction)backAct:(id)sender;

@end
