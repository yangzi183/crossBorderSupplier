//
//  LoginViewController.m
//  crossShop//
//  Created by mac on 15/6/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "CROCommonAPI.h"
#import "RegisterPhoneController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.otherLogin.layer.borderWidth = 0.5f;
    self.otherLogin.layer.borderColor = [CROCommonAPI colorWithHexString:@"#f5f6f6"].CGColor;
    self.otherLogin.layer.cornerRadius = 15;
    self.loginBtn.layer.cornerRadius = 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toRegPhoneView"]) {
        [segue.destinationViewController setTitleStr:@"注册"];
    } else {
        [segue.destinationViewController setTitleStr:@"忘记密码"];
    }
}


- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)forgetPwdAct:(id)sender {
    [self performSegueWithIdentifier:@"toRegPhoneViewPwd" sender:nil];
}

- (IBAction)regAct:(id)sender {
    [self performSegueWithIdentifier:@"toRegPhoneView" sender:nil];
}
@end
