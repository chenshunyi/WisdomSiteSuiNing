//
//  CustomString.m
//  TaoFang
//
//  Created by mxw on 16/1/18.
//  Copyright © 2016年 House365. All rights reserved.
//

#import "CustomString.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation CustomString

+ (BOOL)isEmptyString:(NSString *)_str
{
    if (![_str isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if ([_str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([_str isEqualToString:@""]) {
        return YES;
    }
    if (_str == nil) {
        return YES;
    }
    if (_str == NULL) {
        return YES;
    }
    if ((NSNull*)_str == [NSNull null]) {
        return YES;
    }
    return [self isEmptyStringBySpace:_str];
    return NO;
}

//全是空格
+ (BOOL)isEmptyStringBySpace:(NSString*)_str
{
    //全是空格不可完成提交
    if ([[_str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isNotEmptyString:(NSString *)_str; {
    if (![_str isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    if ([_str isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    if ([_str isEqualToString:@""]) {
        return NO;
    }
    if (_str == nil) {
        return NO;
    }
    if (_str == NULL) {
        return NO;
    }
    if ((NSNull*)_str == [NSNull null]) {
        return NO;
    }
    BOOL isHasSpace = [self isEmptyStringBySpace:_str];
    return !isHasSpace;
}

//判断手机号2016-8-11 csy
+(BOOL)isMobileNumber:(NSString *)text
{
    //手机号码，11位
    NSString *Regex = @"^\\d{11}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [phoneTest evaluateWithObject:text];
    
    //    NSString * MOBILE = @"^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$";
    //        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //
    //    if (([regextestmobile evaluateWithObject:text] == YES))
    //    {
    //        return YES;
    //    }
    //    else
    //    {
    //        return NO;
    //    }
    
}

// 判断设备是否安装sim卡
+ (BOOL)isSIMInstalled
{
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        //        NSLog(@"No sim present Or No cellular coverage or phone is on airplane mode.");
        return NO;
    }
    return YES;
}


@end
