//
//  MBProgressHUD+YJ.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/7.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "MBProgressHUD+YJ.h"

@implementation MBProgressHUD (YJ)

/**
 *  =======显示信息
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]];
    if (image) {
        hud.mode = MBProgressHUDModeCustomView;//自定义view模式
        // 设置图片
        hud.customView = [[UIImageView alloc] initWithImage:image];
    }else{
        hud.mode = MBProgressHUDModeText;//hub模式 纯文本
    }
    hud.label.textColor = [UIColor whiteColor];//字体颜色
//    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;//黑色加重
    hud.label.font = [UIFont systemFontOfSize:17.0];//字体大小
    hud.userInteractionEnabled= NO;//是否可以点击
    hud.bezelView.backgroundColor = [UIColor blackColor];    //背景颜色
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}
/**
 *  =======显示 提示信息无图片
 *  @param messge 信息内容
 */
+(void)showMessage:(NSString *)messge{
    [self show:messge icon:@"" view:nil];
}
/**
 *  =======显示 提示信息无图片
 *  @param messge 信息内容
 */
+(void)showMessage:(NSString *)messge toView:(UIView *)view{
    [self show:messge icon:@"" view:view];
}

/**
 *  =======显示 提示信息有图片
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

/**
 *  =======显示 提示信息有图片
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

/**
 *  =======显示错误信息
 */
+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}
/**
 *  显示提示 + 菊花
 *  @param message 信息内容
 *  @return 直接返回一个MBProgressHUD， 需要手动关闭(  ?
 */
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message
{
    return [self showLoadingMessage:message toView:nil];
}

/**
 *  显示一些信息
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.label.textColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeIndeterminate;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    hud.contentColor = [UIColor whiteColor];
    
//    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;//黑色加重
    
    hud.bezelView.backgroundColor = [UIColor blackColor];    //背景颜色
    
    return hud;
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
/**
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    
    [self hideHUDForView:view animated:YES];
}


@end
