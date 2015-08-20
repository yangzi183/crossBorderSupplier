//
//  RegisterPhoneController.m
//  crossShop
//
//  Created by mac on 15/6/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RegisterPhoneController.h"

@interface RegisterPhoneController ()

@end

@implementation RegisterPhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nextBtn.layer.cornerRadius = 2;
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

- (IBAction)nextAct:(id)sender {
    [self performSegueWithIdentifier:@"toCodeView" sender:nil];
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTitleStr:(NSString *)titleStr {
    self.navigationController.title = titleStr;
    self.navigationItem.title = titleStr;
}
@end
