//
//  BaseViewController.m
//  House365
//
//  Created by luyang on 13-4-7.
//  Copyright (c) 2013年 House365. All rights reserved.
//

#import "BaseViewController.h"

//ios10使用字符串生降序判断错误，需要转换成数字比大小，modify by xingxianping,2016-9-20
#define IOS7_OR_LATER   ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0)//( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

@implementation BaseViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self supportedInterfaceOrientations];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    if (IOS7_OR_LATER) {
        [self preferredStatusBarStyle];
        
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    }
    else
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = NO;
        if (!self.needClose) {
            self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
        }
    }
#endif
    [self setNavBackButton:@"common_btn_topback"];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    if ( IOS7_OR_LATER )
    {
        if (![self isEqual:[[self.navigationController viewControllers] objectAtSafeIndex:0]]) {
            if (self.needClose) {
                self.navigationController.interactivePopGestureRecognizer.enabled = NO;
            }
            else {
                self.navigationController.interactivePopGestureRecognizer.enabled = YES;
            }
        }else {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
#endif
    
//    NSLog(@"侧滑%@____%d",[NSString stringWithUTF8String:object_getClassName(self)],self.navigationController.interactivePopGestureRecognizer.enabled);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

#pragma mark 返回
-(void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 中间标题
//中间titleView
- (void)setNavTitle:(NSString *)title{
    if (self.navigationItem) {
        [self setNavTitleView:nil];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        if (IOS7_OR_LATER) {
            
            NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
            self.navigationController.navigationBar.titleTextAttributes = dict;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont boldSystemFontOfSize:18.0];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.text = title;
            self.navigationItem.titleView = label;
            [label sizeToFit];
            return;
        }
#endif
        UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
        titleLb.backgroundColor = [UIColor clearColor];
        titleLb.font = [UIFont boldSystemFontOfSize:18.0];
        titleLb.textColor = [UIColor whiteColor];
        titleLb.textAlignment = UITextAlignmentCenter;
        titleLb.text = title;
        [self setNavTitleView:titleLb];
    }
}
- (void)setNavTitle:(NSString *)title withColor:(UIColor *)color
{
    if (self.navigationItem) {
        [self setNavTitleView:nil];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        if (IOS7_OR_LATER) {
            
            NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
            self.navigationController.navigationBar.titleTextAttributes = dict;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont boldSystemFontOfSize:18.0];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = color;
            label.text = title;
            self.navigationItem.titleView = label;
            [label sizeToFit];
            return;
        }
#endif
        UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
        titleLb.backgroundColor = [UIColor clearColor];
        titleLb.font = [UIFont boldSystemFontOfSize:18.0];
        titleLb.textColor = [UIColor whiteColor];
        titleLb.textAlignment = UITextAlignmentCenter;
        titleLb.text = title;
        [self setNavTitleView:titleLb];
    }
}

- (void)setNavTitle:(NSString *)title titleFont:(UIFont *)font {
    if (self.navigationItem) {
        [self setNavTitleView:nil];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        if (IOS7_OR_LATER) {
            
            NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
            self.navigationController.navigationBar.titleTextAttributes = dict;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.backgroundColor = [UIColor clearColor];
            label.font = font;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.text = title;
            self.navigationItem.titleView = label;
            [label sizeToFit];
            return;
        }
#endif
        UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
        titleLb.backgroundColor = [UIColor clearColor];
        titleLb.font = font;
        titleLb.textColor = [UIColor whiteColor];
        titleLb.textAlignment = UITextAlignmentCenter;
        titleLb.text = title;
        [self setNavTitleView:titleLb];
    }
}

- (void)setNavTitleView:(UIView *)titleView
{
    if (self.navigationItem) {
        self.navigationItem.titleView = titleView;
    }
}

#pragma mark - 左侧返回
- (void)setNavBackButton:(NSString *)btnStr{
    if (self.navigationItem) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 38, 38);
        UIImage *image = [UIImage imageNamed:btnStr];
        if (!image) {
            btn.titleLabel.font = [UIFont systemFontOfSize:18.0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitle:btnStr forState:UIControlStateNormal];
        }else{
            [btn setImage:image forState:UIControlStateNormal];
        }
        [btn addTarget: self action: @selector(navBackButtonAction:) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem*back=[[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = back;
    }
}

- (void)navBackButtonAction:(id)sender{
    UIControl *ctrl = (UIControl *)sender;
    NSUInteger tag = ctrl.tag + 1;
    [self navBackButtonActionAtTag:tag];
}

- (void)navBackButtonActionAtTag:(NSUInteger)tag{
    //tag从1开始
    if (self.showType == ViewShowTypePresent)
        [self dismissModalViewControllerAnimated:YES];
    else
        [self popViewController];
}

//右侧按钮
- (void)setNavRightButton:(NSString *)btnStr
{
    if (!btnStr) {
        self.navigationItem.rightBarButtonItem = nil;
        return;
    }
    if (self.navigationItem) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15, 5, 38, 38);
        UIImage *image = [UIImage imageNamed:btnStr];
        if (!image) {
            btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitle:btnStr forState:UIControlStateNormal];
        }else{
            [btn setImage:image forState:UIControlStateNormal];
        }
        [btn addTarget: self action: @selector(navRightButtonActionAtTag:) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem*right=[[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.rightBarButtonItem = right;
    }
}
- (void)setNavRightButton:(NSString *)btnStr color:(UIColor *)color{
    if (!btnStr) {
        self.navigationItem.rightBarButtonItem = nil;
        return;
    }
    if (self.navigationItem) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15, 5, 38, 38);
        UIImage *image = [UIImage imageNamed:btnStr];
        if (!image) {
            btn.titleLabel.font = [UIFont systemFontOfSize:18.0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitle:btnStr forState:UIControlStateNormal];
        }else{
            [btn setImage:image forState:UIControlStateNormal];
        }
        [btn addTarget: self action: @selector(navRightButtonActionAtTag:) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem*right=[[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.rightBarButtonItem = right;
    }
}

- (void)setNavRightButton:(NSString *)btnStr btnFont:(UIFont *)font
{
    if (!btnStr) {
        self.navigationItem.rightBarButtonItem = nil;
        return;
    }
    if (self.navigationItem) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15, 5, 38, 38);
        UIImage *image = [UIImage imageNamed:btnStr];
        if (!image) {
            btn.titleLabel.font= font;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitle:btnStr forState:UIControlStateNormal];
        }else{
            [btn setImage:image forState:UIControlStateNormal];
        }
        [btn addTarget: self action: @selector(navRightButtonActionAtTag:) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem*right=[[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.rightBarButtonItem = right;
    }
}

- (void)setNavRightButtons:(NSArray *)btnStrs
{
    if (btnStrs.count < 1 || !self.navigationItem) {
        return;
    }
    NSMutableArray *btnItems = [NSMutableArray array];
    CGFloat width = 0.0;
    for (int i = 0; i < btnStrs.count; i ++) {
        NSString *btnStr = [btnStrs objectAtSafeIndex:i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15, 5, 38, 38);
        UIImage *image = [UIImage imageNamed:btnStr];
        if (!image) {
            btn.titleLabel.font= [UIFont systemFontOfSize:18.0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitle:btnStr forState:UIControlStateNormal];
        }else{
            [btn setImage:image forState:UIControlStateNormal];
        }
        [btn addTarget: self action: @selector(navRightButtonActionAtTag:) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem*right=[[UIBarButtonItem alloc]initWithCustomView:btn];
        
        
        [btnItems addObject:right];
        
    }
    self.navigationItem.rightBarButtonItems = btnItems;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    if (IOS7_OR_LATER) {
        return;
    }
#endif
    
    //调整titleView
    UIView *titleView = self.navigationItem.titleView;
    UINavigationBar *navBar = self.navigationController.navigationBar;
    CGRect tf = titleView.frame;
    CGRect nf = navBar.frame;
    CGFloat rw = nf.size.width - 2*(width + 20);
    if (rw < tf.size.width) {
        tf.size.width = rw;
        titleView.frame = tf;
        self.navigationItem.titleView = titleView;
    }
}

- (void)navRightButtonAction:(id)sender
{
    UIControl *ctrl = (UIControl *)sender;
    NSUInteger tag = ctrl.tag + 1;
    [self navRightButtonActionAtTag:tag];
}
- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
   return UIInterfaceOrientationPortrait;
}
- (void)navRightButtonActionAtTag:(NSUInteger)tag
{
    //字类实现
    //tag从1开始
}

- (UIStatusBarStyle )preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
