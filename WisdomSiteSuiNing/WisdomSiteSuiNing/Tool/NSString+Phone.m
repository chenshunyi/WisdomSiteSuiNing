//
//  NSString+Phone.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/20.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "NSString+Phone.h"

@implementation NSString (Phone)


+ (BOOL)telePhoneCall:(NSString*)telno
{
    if(![[[UIDevice currentDevice] model] isEqual:@"iPhone"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"您的设备不能拨打电话" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
    if (![CustomString isSIMInstalled]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"手机未安装SIM卡" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    
        
        return NO;
    }
    /*
     //私有方法编译不能通过
     if ([CTSIMSupportGetSIMStatus() isEqualToString:kCTSIMSupportSIMStatusNotInserted]) {
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"未安装SIM卡" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
     [alert show];
     [alert release];
     return NO;
     }
     */
    NSString *phoneNum = telno;
    phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"\u8f6c" withString:@","];
    
    NSArray *nums = [phoneNum componentsSeparatedByString:@"/"];
    phoneNum = [nums objectAtIndex:0];
    
    if (phoneNum == nil || [phoneNum isEqualToString:@""]) {
        phoneNum = @"";
    }
    
    NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNum]];
    [[UIApplication sharedApplication] openURL:telURL];
    
    return YES;
}
//拨打电话的方法
+ (BOOL)telePhoneCallWithChecking:(NSString*)telno
{
    if(![[[UIDevice currentDevice] model] isEqual:@"iPhone"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"您的设备不能拨打电话" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
    if (![CustomString isSIMInstalled]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"手机未安装SIM卡" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    /*
     //私有方法编译不能通过
     if ([CTSIMSupportGetSIMStatus() isEqualToString:kCTSIMSupportSIMStatusNotInserted]) {
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"未安装SIM卡" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
     [alert show];
     [alert release];
     return NO;
     }
     */
    NSString *phoneNum = telno;
    phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"\u8f6c" withString:@","];
    
    NSArray *nums = [phoneNum componentsSeparatedByString:@"/"];
    phoneNum = [nums objectAtIndex:0];

    if(![CustomString isMobileNumber:phoneNum]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"电话号码不合法" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
    NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNum]];
    [[UIApplication sharedApplication] openURL:telURL];
    return YES;
}




@end
