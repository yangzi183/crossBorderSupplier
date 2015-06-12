//
//  flowTableView.m
//  crossShop
//
//  Created by apple on 15/5/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "flowTableView.h"

@implementation flowTableView {
    CGFloat srcollWidth;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)configFlowTable: (CGFloat)withWidth{
    srcollWidth = withWidth;
    [self initSrcollView];
}

- (id)init {
    self = [super init];
    if (self) {
        [self initSrcollView];
    }
    return self;
}

- (void)initSrcollView {
    self.backgroundColor = [UIColor whiteColor];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, srcollWidth, kSCROLLVIEWHEIGHT)];
    //NSLog(@"\r\n x:%f,width:%f,selfwidth:%f, scroll:%f", self.frame.origin.x, screenWidth, self.bounds.size.width, self.frame.size.width);
    scrollView.delegate = self;
    scrollView.clipsToBounds = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.autoresizesSubviews = YES;
    //scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollView.multipleTouchEnabled = NO;
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:scrollView];
}

- (void)setDataArray:(NSArray *)dataArray {
    //NSLog(@"\r\n dataarray:%@", dataArray);
    if (dataArray.count != 0) {
        __block CGFloat x = 0;
        __block UIImage *imgBack = [UIImage imageNamed:@"topic_back"];
       // NSLog(@"\r\n back:%f-%f", imgBack.size.width, imgBack.size.height);
        CGFloat imgWidth = (kSCROLLVIEWWIDTH - 2 * kIMGMARGIN) / 2;
        CGRect viewFrame = CGRectMake(kIMGMARGIN, 0, imgWidth, kSCROLLVIEWHEIGHT);
        [dataArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            //NSLog(@"\r\n obj:%@", obj);
            
            UIImageView *backView = [[UIImageView alloc]initWithFrame:viewFrame];
            backView.frame = CGRectOffset(viewFrame, x, 0);
            backView.image = imgBack;
            CGRect imgFrame = CGRectMake(0, 2, backView.frame.size.width - kBACKMARGIN, imgBack.size.height - 3);
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:imgFrame];
            [imgView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"tmp.png"]];
            [backView addSubview:imgView];
            [scrollView addSubview:backView];
            x += (imgWidth + kIMGMARGIN);
        }];
        CGFloat width = (imgWidth + kIMGMARGIN) * dataArray.count;
        width = x;
        //NSLog(@"\r\n width:%f", width);
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
