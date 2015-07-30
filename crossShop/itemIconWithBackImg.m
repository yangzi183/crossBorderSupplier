//
//  itemIconWithBackImg.m
//  crossShop
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "itemIconWithBackImg.h"
#import "CROCommonAPI.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "commonConfig.h"

@implementation itemIconWithBackImg {
    UIImageView *imgView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/*- (id)init {
    self = [super init];
    if (self) {
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [CROCommonAPI colorWithHexString:@"#f5f6f6"].CGColor;
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - kITEMICONWITHBACKIMG_IMG_WIDTH) / 2, (self.frame.size.height - kITEMICONWITHBACKIMG_IMG_HEIGHT) / 2, kITEMICONWITHBACKIMG_IMG_WIDTH, kITEMICONWITHBACKIMG_IMG_HEIGHT)];
        [self addSubview:imgView];
    }
    return self;
}*/

- (void)setItemImgWithUrl:(NSString *)url {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [CROCommonAPI colorWithHexString:kThickLineColor].CGColor;
    
    if (!imgView) {
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - kITEMICONWITHBACKIMG_IMG_WIDTH) / 2, (self.frame.size.height - kITEMICONWITHBACKIMG_IMG_HEIGHT) / 2, kITEMICONWITHBACKIMG_IMG_WIDTH, kITEMICONWITHBACKIMG_IMG_HEIGHT)];
        [self addSubview:imgView];
    }
    NSLog(@"\r\n url:%@", url);
    [imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"orderItem.png"]];
}

@end
