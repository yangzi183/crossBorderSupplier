//
//  ModelData.m
//  crossShop
//
//  Created by mac on 15/8/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ModelData.h"
#import <AFHTTPRequestOperationManager.h>
#import <SBJson4Parser.h>
#import "CROCommonAPI.h"

@implementation ModelData {
    
}

+ (void)getModelInfoByBlock:(HTTPRequestArray)complete {
#ifndef kDEBUG_DATA
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
        NSLog(@"\r\n get getModelInfoByBlock error:%@", error);
    }];
#else
    __block NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"test6" ofType:@"js"];
    // NSString *jsonStr = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"\r\n jsonStr:%@", jsonStr);
    SBJson4ValueBlock parserBlock = ^(id item, BOOL *stop) {
        if ([item isKindOfClass:[NSArray class]]) {
            dataArray = [NSMutableArray arrayWithArray:item];
            complete(dataArray);
            //NSLog(@"\r\n array:%@", item);
        }
    };
    SBJson4ErrorBlock parserError = ^(NSError *error) {
        NSLog(@"\r\n error:%@", error);
    };
    SBJson4Parser *jsonParser = [SBJson4Parser parserWithBlock:parserBlock allowMultiRoot:NO unwrapRootArray:NO errorHandler:parserError];
    
    [jsonParser parse:[NSData dataWithContentsOfFile:jsonPath]];
#endif
}

+ (void)getAllGoodsWithBlock:(HTTPRequestDic)complete page:(NSInteger)page{
#ifndef kDEBUG_DATA
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *parameter = @{@"action": @"get_goods_info",
                                @"auth": @"ios",
                                @"verify": @"787aa0142464da1473b86c72064647a5",
                                @"page":[NSNumber numberWithInteger:page],
                                @"perpage":@"20"};
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    [manager POST:NET_ALL_GOODS_GET parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObj) {
        //NSLog(@"\r\n responsejson:%@", responseObj);
        complete(responseObj);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"\r\n get getAllGoodsWithBlock error:%@", error);
    }];
#else
    __block NSDictionary *dataDic = [[NSDictionary alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"getAllGoods" ofType:@"js"];
    // NSString *jsonStr = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"\r\n jsonStr:%@", jsonStr);
    SBJson4ValueBlock parserBlock = ^(id item, BOOL *stop) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            dataDic = [NSDictionary dictionaryWithDictionary:item];
            complete(dataDic);
            //NSLog(@"\r\n dataDic:%@", dataDic);
        }
    };
    SBJson4ErrorBlock parserError = ^(NSError *error) {
        NSLog(@"\r\n error:%@", error);
    };
    SBJson4Parser *jsonParser = [SBJson4Parser parserWithBlock:parserBlock allowMultiRoot:NO unwrapRootArray:NO errorHandler:parserError];
    
    [jsonParser parse:[NSData dataWithContentsOfFile:jsonPath]];
#endif
}

+ (void)getGoodsDetailInfoWithBlock: (HTTPRequestDic)complete goodId:(NSString *)goodsId {
#ifndef kDEBUG_DATA
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *parameter = @{@"action": @"get_goods_detail",
                                @"auth": @"ios",
                                @"verify": @"5e1a6e81151f25c8ba4c3310cbc9b744",
                                @"goods_id":goodsId};
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    [manager POST:NET_GOOD_INFO_GET parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObj) {
        //NSLog(@"\r\n responsejson:%@", responseObj);
        complete(responseObj);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"\r\n get getGoodsDetailInfoWithBlock error:%@", error);
    }];
#else 
    __block NSDictionary *dataDic = [[NSDictionary alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"getGoodsDetail" ofType:@"js"];
    // NSString *jsonStr = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"\r\n jsonStr:%@", jsonStr);
    SBJson4ValueBlock parserBlock = ^(id item, BOOL *stop) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            dataDic = [NSDictionary dictionaryWithDictionary:item];
            complete(dataDic);
            //NSLog(@"\r\n dataDic:%@", dataDic);
        }
    };
    SBJson4ErrorBlock parserError = ^(NSError *error) {
        NSLog(@"\r\n error:%@", error);
    };
    SBJson4Parser *jsonParser = [SBJson4Parser parserWithBlock:parserBlock allowMultiRoot:NO unwrapRootArray:NO errorHandler:parserError];
    
    [jsonParser parse:[NSData dataWithContentsOfFile:jsonPath]];
#endif
}
@end
