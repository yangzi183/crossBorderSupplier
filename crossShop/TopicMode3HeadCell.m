//
//  TopicMode3HeadCell.m
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TopicMode3HeadCell.h"


@implementation TopicMode3HeadCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setHeadInfoByDic: (NSDictionary *)dicData width: (CGFloat)width{
    NSString *content = [dicData objectForKey:@"content"];
    CGPoint point = CGPointMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y);
    self.contentLabel.text = content;
    CGSize size = [self.contentLabel boundingRectWithSize:CGSizeMake(width, 0)];

}

@end
