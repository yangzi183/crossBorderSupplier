//
//  ModelData.m
//  crossShop
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ModelData.h"
#import <AFHTTPRequestOperationManager.h>


@implementation ModelData {
    
}

+ (void)getModelInfoByBlock:(HTTPRequestArray)complete {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *parameter = @{@"action": @"get_model_title",
                                @"auth": @"ios",
                                @"verify": @"76a8c700b7e1e7c72f82fd19c2df0efb"};
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //NSMutableArray *arrayData = [[NSMutableArray alloc] init];
    [manager POST:NET_MODEL_GET parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObj) {
        //NSLog(@"\r\n responsejson:%@", responseObj);
        complete(responseObj);
        //arrayData = [NSMutableArray arrayWithArray:responseObj];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"\r\n get model error:%@", error);
    }];
}

@end
