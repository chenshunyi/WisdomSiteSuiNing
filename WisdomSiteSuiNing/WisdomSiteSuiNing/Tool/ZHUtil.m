//
//  ZHUtil.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/21.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "ZHUtil.h"


#define isRetina ([[UIScreen mainScreen] scale] >= 2.0 ? YES : NO)
#define kLineHeightOrWidth 0.5

@implementation ZHUtil


/*
 * 根据字符串类型的16进制的色值返回相应的颜色
 * 传入参数  "0xFF0000"或者 "FFFFFF"
 * 返回     UIColor
 */
+(UIColor*)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return nil;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6 &&[cString length] != 8) return nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b,a=255.0;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    if ([cString length] == 8)
    {
        range.location = 6;
        NSString *aString = [cString substringWithRange:range];
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
    }
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:((float) a / 255.0f)];
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



+ (UIView *)createLineWithColor:(UIColor *)color widthOrHeight:(float)value isHorizontal:(BOOL)isHorizontal {
    CGFloat width = 0;
    CGFloat height = 0;
    if (isHorizontal) {
        //是横线
        width = value;
        height = isRetina ? kLineHeightOrWidth:1;
    }else {
        width = isRetina ? kLineHeightOrWidth:1;
        height = value;
    }
    CGRect currentFrame = CGRectMake(0, 0, width, height);
    UIView *lineView = [[UIView alloc] initWithFrame:currentFrame];
    if (color) {
        lineView.backgroundColor = color;
    }else {
        lineView.backgroundColor = UIColorFromRGB(0xd9d9d9);
    }
    return lineView;
}


@end
