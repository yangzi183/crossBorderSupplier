//
//  PersonalCenterCell.h
//  crossShop
//
//  Created by mac on 15/6/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPersonalIconCell               @"icon"
#define kPersonalTitleCell              @"title"
@interface PersonalCenterCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellIcon;
@property (strong, nonatomic) IBOutlet UILabel *cellTitle;

- (void)setCellInfoByDic: (NSDictionary *)dicData;
@end
