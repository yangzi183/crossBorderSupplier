//
//  CROCommonAPI.m
//  crossShop
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROCommonAPI.h"

@implementation CROCommonAPI

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            NSLog(@"不合规范的颜色值:%@",hexString);
            return [UIColor clearColor];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

+ (NSString *)setDateInfoByDouble: (double)dDate {

    NSDate *datestr = [NSDate dateWithTimeIntervalSince1970:dDate];
    NSCalendar * cal = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents * component = [cal components:unitFlags fromDate:datestr];
    
    //NSInteger year = [component year];
    NSInteger month = [component month];
    NSInteger day = [component day];
    NSString *monthStr;
    switch (month) {
        case 1:
            monthStr = @"Jan.";
            break;
            
        case 2:
            monthStr = @"Feb.";
            break;
            
        case 3:
            monthStr = @"Mar.";
            break;
            
        case 4:
            monthStr = @"Apr.";
            break;
            
        case 5:
            monthStr = @"May.";
            break;
            
        case 6:
            monthStr = @"Jun.";
            break;
            
        case 7:
            monthStr = @"Jul.";
            break;
            
        case 8:
            monthStr = @"Aug.";
            break;
            
        case 9:
            monthStr = @"Sep.";
            break;
            
        case 10:
            monthStr = @"Oct.";
            break;
            
        case 11:
            monthStr = @"Nov.";
            break;
            
        case 12:
            monthStr = @"Dec.";
            break;
            
        default:
            break;
    }
    NSString *dateStr = [NSString stringWithFormat:@"%@%02ld", monthStr, (long)day];
    return dateStr;
}

@end
