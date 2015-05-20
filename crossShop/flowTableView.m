//
//  flowTableView.m
//  crossShop
//
//  Created by apple on 15/5/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "flowTableView.h"

@implementation flowTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSrcollView];
    }
    return self;
}

- (void)initSrcollView {
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth - 2 * kSCROLLVIEWMARGINLEFT, kSCROLLVIEWHEIGHT)];
    scrollView.delegate = self;
    scrollView.clipsToBounds = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.autoresizesSubviews = NO;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollView.multipleTouchEnabled = NO;
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    scrollView.pagingEnabled = YES;
    [self addSubview:scrollView];
}

- (void)setDataArray:(NSArray *)dataArray {
    if (dataArray.count != 0) {
        __block CGFloat x = 0;
        CGFloat imgWidth = (kSCROLLVIEWWIDTH - 2 * kIMGMARGIN) / 2;
        CGRect viewFrame = CGRectMake(kIMGMARGIN, 0, imgWidth, kSCROLLVIEWHEIGHT);
        [dataArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:viewFrame];
            imgView.frame = CGRectOffset(viewFrame, x, 0);
            [imgView sd_setImageWithURL:[NSURL URLWithString:obj] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                ;
            }];
            [scrollView addSubview:imgView];
            x += (imgWidth + kIMGMARGIN);
        }];
        
        CGFloat width = (imgWidth + kIMGMARGIN) * dataArray.count;
        width = x;
        scrollView.contentSize = CGSizeMake(width, scrollView.frame.size.height);
    }
    _dataArray = dataArray;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scView {
    NSInteger index = scView.contentOffset.x / scView.frame.size.width;
    if (index < [self.dataArray count]) {

        //NSLog(@"\r\n scrollx:%f-%ld-%@", scrollViewCtl.contentOffset.x, index, self.titleList[index]);
    } else {
        NSLog(@"\r\n magazine list is empty or selected cell is invalid.");
    }
    
}

@end
