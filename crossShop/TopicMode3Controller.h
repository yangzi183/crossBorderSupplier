//
//  TopicMode3Controller.h
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicMode3HeadCell.h"
#import "TopicMode3FirstCell.h"
#import "TopicMode3SecondCell.h"
#import "ShoppingCartItem.h"

@interface TopicMode3Controller : UICollectionViewController <UICollectionViewDelegateFlowLayout, ShoppingCartItemDelegate>
- (IBAction)backAct:(id)sender;

@property (strong, nonatomic) NSString *model_id;
@end
