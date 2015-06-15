//
//  TopicMode3SectionView.m
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TopicMode3SectionView.h"

@implementation TopicMode3SectionView

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSectionHeadInfo: (NSMutableDictionary *)dicData {
    NSLog(@"\r\n dic:%@", dicData);
    NSString *imgName = [dicData objectForKey:@"image"];
    NSString *title = [dicData objectForKey:@"title"];
    self.titleIcon.image = [UIImage imageNamed:imgName];
    self.titleStr.text = title;
}

@end
