//
//  flowTableView.m
//  crossShop
//
//  Created by apple on 15/5/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "flowTableView.h"
#import "networkAPI.h"
@implementation flowTableView {
    CGFloat srcollWidth;
    CGFloat img_height;
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
    if (withWidth >= 360) {
        img_height = 260;
    } else {
        img_height = kSCROLLVIEWHEIGHT;
    }
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
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, srcollWidth, img_height)];
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
        NSLog(@"\r\n width:%f,kSCROLLVIEWWIDTH:%f", imgWidth, kSCROLLVIEWWIDTH);
        CGRect viewFrame = CGRectMake(kIMGMARGIN, 0, imgWidth, img_height);
        [dataArray enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //NSLog(@"\r\n index:%u,obj:%@", idx, obj);
            NSString *obj = [NSString stringWithFormat:@"%@%@", NET_DOMAIN, [dic objectForKey:@"model_img"]];
            UIImageView *backView = [[UIImageView alloc]initWithFrame:viewFrame];
            backView.frame = CGRectOffset(viewFrame, x, 0);
            backView.image = imgBack;
            CGRect imgFrame = CGRectMake(0, 2, backView.frame.size.width - kBACKMARGIN, backView.frame.size.height - 3);
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:imgFrame];
            [imgView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"tmp.png"]];
            imgView.layer.cornerRadius = 6;
            imgView.layer.masksToBounds = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTopicImage:)];
            backView.userInteractionEnabled = YES;
            [backView addGestureRecognizer:tapGesture];
            tapGesture.view.tag = idx;
            
            [backView addSubview:imgView];
            [scrollView addSubview:backView];
            x += (imgWidth + kIMGMARGIN);
            
        }];
        CGFloat width = (imgWidth + kIMGMARGIN) * dataArray.count;
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
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_INTO_TOPIC_VIEW object:[NSNumber numberWithInteger:tag]];
    NSLog(@"\r\n you click number %ld iamge", tag);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"\r\n begin");
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
