//
//  AppDelegate.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSUserDefaults*user_d=[NSUserDefaults standardUserDefaults];
    NSString*name=[user_d objectForKey:@"name"];
    NSString*psw=[user_d objectForKey:@"psw"];
    
    if ([CustomString isNotEmptyString:name]&&[CustomString isNotEmptyString:psw]) {//有账号和密码
        TabBarViewController*vc=[[TabBarViewController alloc]init];
        self.window.rootViewController=vc;
    }else{//登录页面
        LoginViewController*loginVC=[[LoginViewController alloc]init];
//        loginVC.hidesBottomBarWhenPushed=YES;
        __weak typeof(self)this =self;
        [loginVC setLoginBackBlock:^(BOOL isSucess) {
            TabBarViewController*vc=[[TabBarViewController alloc]init];
            this.window.rootViewController=vc;
        }];
        
        self.window.rootViewController=loginVC;
    }
    //测试专用
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

#pragma mark --自定义导航栏背景
@implementation UINavigationBar (CustomImage)

- (UIImage *)barBackground
{
    UIImage *bg = nil;
   
    bg = [FMUImage imageWithColor:UIColorFromRGB(0x03BCF8) andSize:CGSizeMake(ScreenWidth, 84)];
    return bg;
}

- (void)didMoveToSuperview
{
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault];
    }
}

//this doesn't work on iOS5 but is needed for iOS4 and earlier
- (void)drawRect:(CGRect)rect
{
    //draw image
    [[self barBackground] drawInRect:rect];
}

@end


