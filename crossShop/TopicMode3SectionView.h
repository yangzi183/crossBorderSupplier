//
//  TopicMode3SectionView.h
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicMode3SectionView : UICollectionReusableView
@property (strong, nonatomic) IBOutlet UILabel *titleStr;
@property (strong, nonatomic) IBOutlet UIImageView *titleIcon;

- (void)setSectionHeadInfo: (NSDictionary *)dicData;

@end
