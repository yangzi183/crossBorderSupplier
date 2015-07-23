//
//  DetailGoodsQuestionCell.h
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "labelWithImgView.h"

#define kDetailGoodsQuestionCellHeight          600
@interface DetailGoodsQuestionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet labelWithImgView *labelImg1;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImg2;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImg3;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgRev1;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgRev2;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgRev3;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgRev4;
@property (strong, nonatomic) IBOutlet UIButton *buyBtn;
@property (strong, nonatomic) IBOutlet UIButton *revokeBtn;
- (void)configView;

- (IBAction)buyAct:(id)sender;

- (IBAction)revokeAct:(id)sender;
@end
