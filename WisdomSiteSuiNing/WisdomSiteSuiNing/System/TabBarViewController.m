
//
//  TabBarViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "TabBarViewController.h"
#import "MyViewController.h"
#import "MainViewController.h"
#import "AddressViewController.h"
#import "WorkViewController.h"
#import "UndetailViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    MainViewController*mainVC=[[MainViewController alloc]init];
    UndetailViewController*undealVC=[[UndetailViewController alloc]init];
    WorkViewController*workVC=[[WorkViewController alloc]init];
    AddressViewController*addressVC=[[AddressViewController alloc]init];
    MyViewController*myVC=[[MyViewController alloc]init];
    
    UINavigationController*navMain=[[UINavigationController alloc]initWithRootViewController:mainVC];
    navMain.title=@"首页";
    navMain.tabBarItem.image=[UIImage imageNamed:@"home_normal.png"];
    navMain.tabBarItem.selectedImage=[UIImage imageNamed:@"home_press.png"];
    navMain.view.backgroundColor=[UIColor grayColor];
    
    UINavigationController*navUndeal=[[UINavigationController alloc]initWithRootViewController:undealVC];
    navUndeal.title=@"待办";
    navUndeal.tabBarItem.image=[UIImage imageNamed:@"schedule_normal.png"];
    navUndeal.tabBarItem.selectedImage=[UIImage imageNamed:@"schedule_press.png"];
    navUndeal.view.backgroundColor=[UIColor grayColor];
    
    UINavigationController *navWork = [[UINavigationController alloc]initWithRootViewController:workVC];
    navWork.title = @"工作";
    navWork.tabBarItem.image=[UIImage imageNamed:@"work_normal.png"];
    navWork.tabBarItem.selectedImage=[UIImage imageNamed:@"work_press.png"];
    navWork.view.backgroundColor=[UIColor grayColor];
    
    UINavigationController *navAddress = [[UINavigationController alloc]initWithRootViewController:addressVC];
    navAddress.title = @"通讯录";
    navAddress.tabBarItem.image=[UIImage imageNamed:@"address_normal.png"];
    navAddress.tabBarItem.selectedImage=[UIImage imageNamed:@"address_press.png"];
    navAddress.view.backgroundColor=[UIColor grayColor];
    
    UINavigationController *navMy = [[UINavigationController alloc]initWithRootViewController:myVC];
    navMy.title = @"个人";
    navMy.tabBarItem.image=[UIImage imageNamed:@"self_normal.png"];
    navMy.tabBarItem.selectedImage=[UIImage imageNamed:@"self_press.png"];
    navMy.view.backgroundColor=[UIColor grayColor];
    
    //设置控制器文字
    self.viewControllers=@[navMain,navUndeal,navWork,navAddress,navMy];
    self.tabBar.barTintColor=UIColorFromRGB(0xF6F6F6);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
