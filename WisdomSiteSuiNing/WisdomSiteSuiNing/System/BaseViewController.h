//
//  BaseViewController.h
//  House365
//
//  Created by luyang on 13-4-7.
//  Copyright (c) 2013年 House365. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TFNavigationBarType){
    
    TFNavigationBarDefault = 0,
    TFNavigationBarWithRightButton = 1,
    TFNavigationBarWithRightImageButton = 2,
    TFNavigationBarWithRightNoLeft = 3,
    TFNavigationBarHouseDetail = 4
};

/*
 页面进入方式：push or present
 */
typedef NS_ENUM(NSUInteger, ViewShowType){
    ViewShowTypePush = 0,
    ViewShowTypePresent = 1
};


@interface BaseViewController : UIViewController

@property(nonatomic,weak) id rootAppDelegate;
@property(nonatomic,assign) ViewShowType showType;
@property(nonatomic,assign) TFNavigationBarType naviBarType;

@property(nonatomic,assign) BOOL needClose; //add by mxw.为什么不采用类来区分，因为我的等页面需要子页面打开，因此在那种情况下是需要打开侧滑功能的


-(void)popViewController;

//title
- (void)setNavTitle:(NSString *)title;
- (void)setNavTitle:(NSString *)title withColor:(UIColor *)color;
- (void)setNavTitle:(NSString *)title titleFont:(UIFont *)font;
- (void)setNavTitleView:(UIView *)titleView;
//左侧返回
- (void)setNavBackButton:(NSString *)btnStr;
- (void)navBackButtonActionAtTag:(NSUInteger)tag;
//右侧按钮
- (void)setNavRightButton:(NSString *)btnStr;
- (void)setNavRightButton:(NSString *)btnStr btnFont:(UIFont *)font;
- (void)setNavRightButton:(NSString *)btnStr color:(UIColor *)color;
- (void)setNavRightButtons:(NSArray *)btnStrs;
- (void)navRightButtonActionAtTag:(NSUInteger)tag;

@end
