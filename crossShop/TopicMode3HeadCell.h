//
//  TopicMode3HeadCell.h
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+textFrame.h"

@interface TopicMode3HeadCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

- (void)setContentString: (NSString *)contentStr;
@end
