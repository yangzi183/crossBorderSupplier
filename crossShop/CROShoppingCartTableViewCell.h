//
//  CROShoppingCartTableViewCell.h
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImage/UIImageView+WebCache.h"
#import "CROCommonAPI.h"

@protocol CROShoppingCartTableViewCellDelegate <NSObject>

- (void)calculatePrice: (NSInteger)totalPrice oriPrice:(NSInteger)oriPrice;
- (void)calculatePriceIfSelect: (NSInteger)totalPrice oriPrice:(NSInteger)oriPrice mode:(BOOL)mode goodId:(NSString *)goodId;
@end

@interface CROShoppingCartTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *selectBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imgIcon;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *xLabel;
@property (strong, nonatomic) IBOutlet UILabel *realNumLabel;
@property (strong, nonatomic) IBOutlet UIButton *reduceBtn;
@property (strong, nonatomic) IBOutlet UIButton *plusBtn;
@property (strong, nonatomic) IBOutlet UITextField *editTxt;
@property (strong, nonatomic) IBOutlet UIButton *deleteBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imgSellOut;

@property (strong, nonatomic) IBOutlet UIImageView *imgBack;
- (void)changeCellMode: (BOOL)isEdit;
- (IBAction)reduceCount:(id)sender;
- (IBAction)plusCount:(id)sender;

- (void)configCellByDicData: (NSDictionary *)dicData;
- (IBAction)selectAct:(id)sender;

@property (nonatomic, assign) id<CROShoppingCartTableViewCellDelegate> delegate;
@end
