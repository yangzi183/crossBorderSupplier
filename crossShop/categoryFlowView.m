//
//  categoryFlowView.m
//  crossShop
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "categoryFlowView.h"
#import "commonConfig.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation categoryFlowView {
    UIScrollView *scrollView;
    CGFloat srcollWidth;
    NSMutableArray *imgArray;
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
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kCategoryScrollViewTop, srcollWidth, kCategoryScrollViewHeight)];
    //NSLog(@"\r\n x:%f,width:%f,selfwidth:%f, scroll:%f", self.frame.origin.x, screenWidth, self.bounds.size.width, self.frame.size.width);
    scrollView.delegate = self;
    scrollView.clipsToBounds = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.autoresizesSubviews = YES;
    //scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollView.multipleTouchEnabled = NO;
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    scrollView.pagingEnabled = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:scrollView];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setDataArray:(NSArray *)dataArray {
    //NSLog(@"\r\n dataarray:%@", dataArray);
    imgArray = [[NSMutableArray alloc] init];
    if (dataArray.count != 0) {
        __block CGFloat x = 0;
        __block UIImage *imgBack = [UIImage imageNamed:@"topic_back"];
        // NSLog(@"\r\n back:%f-%f", imgBack.size.width, imgBack.size.height);
        //CGFloat imgWidth = (kSCROLLVIEWWIDTH - 2 * kIMGMARGIN) / 2;
        CGRect viewFrame = CGRectMake(kCategoryScrollMargin, 0, kCategoryScrollImgWidth, kCategoryScrollViewHeight);
        [dataArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            //NSLog(@"\r\n index:%u,obj:%@", idx, obj);
            
            UIImageView *backView = [[UIImageView alloc]initWithFrame:viewFrame];
            backView.frame = CGRectOffset(viewFrame, x, 0);
            backView.image = imgBack;
            //CGRect imgFrame = CGRectMake(0, 2, backView.frame.size.width - kBACKMARGIN, backView.frame.size.height - 3);
            //UIImageView *imgView = [[UIImageView alloc]initWithFrame:imgFrame];
            [backView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"tmp.png"]];
            backView.layer.cornerRadius = 2;
            backView.layer.masksToBounds = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTopicImage:)];
            backView.userInteractionEnabled = YES;
            [backView addGestureRecognizer:tapGesture];
            //backView.tag = idx + 1000;
            tapGesture.view.tag = idx;
            [imgArray addObject:backView];
            //[backView addSubview:imgView];
            [scrollView addSubview:backView];
            x += (kCategoryScrollImgWidth + kCategoryScrollMargin);
            
        }];
        CGFloat width = (kCategoryScrollImgWidth + kCategoryScrollMargin) * dataArray.count;
        width = x;
        //NSLog(@"\r\n width:%f", width);
        [scrollView setCanCancelContentTouches:YES];
        scrollView.contentSize = CGSizeMake(width, scrollView.frame.size.height);
    }
    _dataArray = dataArray;
}

- (void)clickTopicImage: (id)sender {
    
    UITapGestureRecognizer *tapView = (UITapGestureRecognizer *)sender;
    NSInteger tag = tapView.view.tag;
    for (int i = 0; i < imgArray.count; i++) {
        UIImageView *backImgView = [imgArray objectAtIndex:i];
        NSLog(@"\r\n backimgtag:%ld", backImgView.tag);
        if (backImgView.tag != tag) {
            backImgView.layer.borderColor = [UIColor clearColor].CGColor;
            backImgView.layer.borderWidth = 0;
        } else {
            backImgView.layer.borderWidth = 0.8;
            backImgView.layer.borderColor = [UIColor redColor].CGColor;
        }
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_INFO_CATEGORY_VIEW_CHANGE object:[NSNumber numberWithInteger:tag]];
    NSLog(@"\r\n you click number %ld iamge", tag);
}

@end
