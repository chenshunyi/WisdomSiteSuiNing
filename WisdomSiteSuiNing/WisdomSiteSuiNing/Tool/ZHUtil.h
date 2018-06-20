//
//  ZHUtil.h
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/21.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHUtil : NSObject

//颜色
+(UIColor*)colorWithHexString:(NSString *)stringToConvert;
//字符串解析成JSON字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//细线
+ (UIView *)createLineWithColor:(UIColor *)color widthOrHeight:(float)value isHorizontal:(BOOL)isHorizontal ;
@end
