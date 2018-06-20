//
//  MBProgressHUD+YJ.h
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/7.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (YJ)


/**
 提示信息  无图  1.5秒之后消失

 @param messge 提示语
 */
+ (void)showMessage:(NSString *)messge;

/**
 提示信息  无图  1.5秒之后消失

 @param messge 提示语
 @param view 父视图
 */
+ (void)showMessage:(NSString *)messge toView:(UIView *)view;

/**
 提示信息  1.5秒之后消失
 
 @param success 成功提示语
 */
+ (void)showSuccess:(NSString *)success;
/**
 提示信息  1.5秒之后消失
 
 @param success 成功提示语
 @param view 父视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;


/**
 提示信息  1.5秒之后消失

 @param error 错误提示语
 */
+ (void)showError:(NSString *)error;

/**
 提示信息  1.5秒之后消失

 @param error 错误提示语
 @param view 父视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;


//有菊花的加载信息
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message;
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;



@end
