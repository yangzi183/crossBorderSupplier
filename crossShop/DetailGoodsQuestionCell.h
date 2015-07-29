//
//  DetailGoodsQuestionCell.h
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "labelWithImgView.h"

#define kDetailGoodsQuestionCellHeight          1000

@protocol DetailGoodsQuestionCellDelegate <NSObject>

- (void)toReturnGoodsView;
- (void)toBuyProcessView;

@end

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
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgReturn1;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgReturn2;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgReturn3;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgReturn4;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgReturn5;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgNot1;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgNot2;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgNot3;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgNot4;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgNot5;
@property (strong, nonatomic) IBOutlet labelWithImgView *labelImgNot6;

@property (assign, nonatomic) id <DetailGoodsQuestionCellDelegate> delegate;
- (void)configView;

- (IBAction)buyAct:(id)sender;

- (IBAction)revokeAct:(id)sender;
@end
