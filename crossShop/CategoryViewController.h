//
//  CategoryViewController.h
//  crossShop
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CROMainTitleTableViewCell.h"
#import "categoryFlowView.h"
#import "ShoppingCartItem.h"

@interface CategoryViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, ShoppingCartItemDelegate>

@property (nonatomic, assign) CATEGORY_TYPE categoryViewType;
@property (strong, nonatomic) IBOutlet categoryFlowView *categoryFlow;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
