//
//  LoginViewController.h
//  crossShop
//
//  Created by mac on 15/6/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
- (IBAction)backAct:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *regBtn;
@property (strong, nonatomic) IBOutlet UILabel *otherLogin;
- (IBAction)forgetPwdAct:(id)sender;
- (IBAction)regAct:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

@end
