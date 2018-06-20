//
//  CustomString.h
//  TaoFang
//
//  Created by mxw on 16/1/18.
//  Copyright © 2016年 House365. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomString : NSObject

+ (BOOL)isEmptyString:(NSString *)_str;
+ (BOOL)isEmptyStringBySpace:(NSString*)_str;
+ (BOOL)isNotEmptyString:(NSString *)_str;
+ (BOOL)isMobileNumber:(NSString *)text;
// 判断设备是否安装sim卡
+ (BOOL)isSIMInstalled;
@end
