//
//  RegisterPwdViewController.m
//  crossShop
//
//  Created by mac on 15/6/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RegisterPwdViewController.h"
#import "LoginViewController.h"
@interface RegisterPwdViewController ()

@end

@implementation RegisterPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finishAct:(id)sender {
    
    UINavigationController *navController = self.navigationController;
    for (UIViewController *controller in navController.viewControllers) {
        if ([controller isKindOfClass:[LoginViewController class]]) {
            [navController popToViewController:controller animated:YES];
        }
    }
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
