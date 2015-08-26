//
//  CROMainDetTableViewCell.h
//  crossShop
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "commonConfig.h"
#import "SDWebImage/UIImageView+WebCache.h"

#define KCELLWIDTH          445

#define kDiscount       @"discount"
#define kDisDate        @"date"
#define kCoverImg       @"cover_img"
#define kTitle          @"title"
#define kCurPrice       @"price_cur"
#define kOriPrice       @"price_ori"
#define kDetail         @"detail"
#define kItemID         @"id"

@interface CROMainDetTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *discount;
@property (strong, nonatomic) IBOutlet UIImageView *disDate;
@property (strong, nonatomic) IBOutlet UIImageView *coverImg;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *curPrice;
@property (strong, nonatomic) IBOutlet UILabel *oriPrice;
@property (strong, nonatomic) IBOutlet UILabel *detail;
@property (strong, nonatomic) IBOutlet UILabel *disLabel;
- (IBAction)advanceAct:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *disDateLabel
;
@property (strong, nonatomic) IBOutlet UILabel *updateLabel;
@property (strong, nonatomic) IBOutlet UIButton *tormorowLabel;
@property (strong, nonatomic) NSDictionary *dicData;
@property (strong, nonatomic) NSString *itemID;
- (void)setDicData:(NSDictionary *)dicData tomorow:(BOOL)tomorow;
@end
