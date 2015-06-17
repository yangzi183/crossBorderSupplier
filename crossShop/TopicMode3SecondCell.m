//
//  TopicMode3SecondCell.m
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TopicMode3SecondCell.h"

@implementation TopicMode3SecondCell

- (void)setConstraintByIndex: (NSInteger)row {
    if (row % 2 == 0) {
        self.trailConstraint.constant = 1;
        self.leadConstraint.constant = 6;
        self.titleLeading.constant = 15;
    } else {
        self.trailConstraint.constant = 6;
        self.leadConstraint.constant = 1;
        self.titleLeading.constant = 11;
    }
}
@end
