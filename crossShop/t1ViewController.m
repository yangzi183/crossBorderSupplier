//
//  t1ViewController.m
//  crossShop
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "t1ViewController.h"
#import "ModelData.h"
#import <SBJson4Parser.h>
@interface t1ViewController ()

@end

@implementation t1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.flowTable configFlowTable:self.view.frame.size.width];
    // Do any additional setup after loading the view.
    /*HTTPRequestArray completeBlock = ^(NSMutableArray *array) {
        [self.flowTable setDataArray:array];
    };
    [ModelData getModelInfoByBlock:completeBlock];*/
    NSMutableArray *arraydata = [self getAllGoods];
    [self.flowTable setDataArray:arraydata];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)getAllGoods {
    __block NSMutableArray *goodsArray = [[NSMutableArray alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"test6" ofType:@"js"];
    // NSString *jsonStr = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"\r\n jsonStr:%@", jsonStr);
    SBJson4ValueBlock parserBlock = ^(id item, BOOL *stop) {
        if ([item isKindOfClass:[NSArray class]]) {
            goodsArray = [NSMutableArray arrayWithArray:item];
            //NSLog(@"\r\n array:%@", item);
        }
    };
    SBJson4ErrorBlock parserError = ^(NSError *error) {
        NSLog(@"\r\n error:%@", error);
    };
    SBJson4Parser *jsonParser = [SBJson4Parser parserWithBlock:parserBlock allowMultiRoot:NO unwrapRootArray:NO errorHandler:parserError];
    
    [jsonParser parse:[NSData dataWithContentsOfFile:jsonPath]];
    
    return goodsArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
