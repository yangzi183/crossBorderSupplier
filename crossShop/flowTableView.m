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
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, srcollWidth, self.frame.size.height)];
    //NSLog(@"\r\n x:%f,width:%f,selfwidth:%f, scroll:%f", self.frame.origin.x, screenWidth, self.bounds.size.width, self.frame.size.width);
    scrollView.delegate = self;
    scrollView.clipsToBounds = YES;
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
        CGFloat imgWidth = (kSCROLLVIEWWIDTH - 2 * kIMGMARGIN) / 2;
        CGRect viewFrame = CGRectMake(kIMGMARGIN, 0, imgWidth, kSCROLLVIEWHEIGHT);
        [dataArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            //NSLog(@"\r\n obj:%@", obj);
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:viewFrame];
            imgView.frame = CGRectOffset(viewFrame, x, 0);
            /*[imgView sd_setImageWithURL:[NSURL URLWithString:obj] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                ;
            }];*/
            [imgView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"tmp.png"]];
            [scrollView addSubview:imgView];
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
