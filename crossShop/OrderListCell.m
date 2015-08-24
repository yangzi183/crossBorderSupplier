//
//  OrderListCell.m
//  crossShop
//
//  Created by mac on 15/6/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderListCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "CROCommonAPI.h"

@implementation OrderListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    if (selected == true) {
        NSLog(@"\r\n select item id:%@", self.itemId);
    }
}

- (IBAction)payNowAct:(id)sender {
}
- (IBAction)cancel:(id)sender {
}

- (IBAction)deleteOrderAct:(id)sender {
}

- (IBAction)confirmGoodsAct:(id)sender {
}

- (void)setOrderItemInfoByDic: (NSDictionary *)dicData {
    //self.borderImg.layer.borderColor = [CROCommonAPI colorWithHexString:@"#E8E8E8"].CGColor;
    //self.borderImg.layer.borderWidth = 0.4;
    //NSLog(@"\r\n dic:%@", dicData);
    if ([dicData objectForKey:@"id"]) {
        self.itemId = [dicData objectForKey:@"id"];
    }
    
    if ([dicData objectForKey:@"title"]) {
        self.itemTitle.text = [dicData objectForKey:@"title"];
    }
    if ([dicData objectForKey:@"price"]) {
        self.itemPrice.text = [NSString stringWithFormat:@"%ld", (long)[(NSNumber *)[dicData objectForKey:@"price"] integerValue]];
    }
    if ([dicData objectForKey:@"count"]) {
        self.itemCount.text = [NSString stringWithFormat:@"%ld", (long)[(NSNumber *)[dicData objectForKey:@"count"] integerValue]];
    }
    if ([dicData objectForKey:@"item_image_url"]) {
        [self.itemImg setItemImgWithUrl:[dicData objectForKey:@"item_image_url"]];
    }
}
@end
