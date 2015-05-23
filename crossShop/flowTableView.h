//
//  flowTableView.h
//  crossShop
//
//  Created by apple on 15/5/20.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "commonConfig.h"
#import "SDWebImage/UIImageView+WebCache.h"

#define kSCROLLVIEWMARGINLEFT       10
#define kSCROLLVIEWMARGINTOP        5
#define kSCROLLVIEWHEIGHT           150
#define kIMGMARGIN                  5
#define kSCROLLVIEWWIDTH            scrollView.frame.size.width

@interface flowTableView : UIView <UIScrollViewDelegate> {
    UIScrollView *scrollView;
}
@property (strong, nonatomic) NSArray *dataArray;

@end
