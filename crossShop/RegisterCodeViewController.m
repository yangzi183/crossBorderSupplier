//
//  RegisterCodeViewController.m
//  crossShop
//
//  Created by mac on 15/6/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RegisterCodeViewController.h"

#define kTIMECOUNT      10

@interface RegisterCodeViewController () {
    NSTimer *time;
    NSInteger timeCount;
    UITapGestureRecognizer *tap;
}

@end

@implementation RegisterCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sendAgain)];
    self.nextBtn.layer.cornerRadius = 2;
}

- (void)setTime {
    self.timeMachine.text = [NSString stringWithFormat:@"%ds", timeCount];
    time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
}

- (void)countTime {
    timeCount--;
    self.timeMachine.text = [NSString stringWithFormat:@"%ds", timeCount];
    if (timeCount <= 0) {
        [time invalidate];
        time = nil;
        self.timeMachine.text = @"重新发送";
        self.timeMachine.layer.borderColor = [UIColor redColor].CGColor;
        self.timeMachine.layer.borderWidth = 0.5f;
        [self.timeMachine addGestureRecognizer:tap];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    timeCount = kTIMECOUNT;
    [self setTime];
}

- (void)viewDidDisappear:(BOOL)animated {
    [time invalidate];
    time = nil;
}

- (void)sendAgain {
    timeCount = kTIMECOUNT;
    [self.timeMachine removeGestureRecognizer:tap];
    time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
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
    [self performSegueWithIdentifier:@"toPwdView" sender:nil];
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
