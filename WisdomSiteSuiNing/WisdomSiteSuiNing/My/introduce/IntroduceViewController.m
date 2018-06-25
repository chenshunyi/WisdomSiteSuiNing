//
//  IntroduceViewController.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/12.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "IntroduceViewController.h"

@interface IntroduceViewController ()
@property (strong, nonatomic) IBOutlet UITextView *introduceTextView;

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title=@"系统介绍";
    
    
    
    self.introduceTextView.text=@"'智慧工地'APP是在互联网、大数据时代下,基于互联网、云计算、移动通讯等技术、研发的一款建筑施工现代化掌上工地系统(包括手机端和PC端).它围绕建筑施工现场'人、机、料、环'五大因素,采用先进的高科技信息话处理技术,为建筑管理方提供系统解决问题的应用平台";
    self.introduceTextView.userInteractionEnabled=NO;

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
