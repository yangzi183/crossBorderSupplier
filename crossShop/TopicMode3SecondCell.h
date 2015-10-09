//
//  TopicMode3SecondCell.h
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicMode3SecondCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleLeading;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *trailConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leadConstraint;
@property (strong, nonatomic) IBOutlet UILabel *oriLabel;
- (void)setConstraintByIndex: (NSInteger)row;
@end
