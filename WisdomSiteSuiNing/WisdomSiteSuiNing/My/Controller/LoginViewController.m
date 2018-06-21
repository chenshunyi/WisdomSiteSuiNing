

//
//  LoginViewController.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()<UITextFieldDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *pswTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.userTextField.delegate=self;
    self.pswTextField.delegate=self;
    [self.pswTextField setSecureTextEntry:YES];//设置成密码的形式
    
    [self setNavBackButton:nil];
    self.needClose=YES;
    
    [self registerNotification];//注册键盘通知
}

-(void)registerNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}
//键盘将要出现
-(void)keyboardWillShow:(NSNotification*)note{
    NSDictionary*info=[note userInfo];
    CGSize keyboardSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    if (self.pswTextField.isFirstResponder) {//当密码的输入框作为第一相应者的时候
        CGRect frame=self.pswTextField.superview.frame;
        CGFloat y =frame.origin.y+25+keyboardSize.height-ScreenHeight;
        if (y>0) {
            self.view.frame=CGRectMake(0, -y, ScreenWidth, ScreenHeight);
        }else{
            self.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        }
    }
}
//键盘隐藏
-(void)keyboardWillHide:(NSNotification*)note{
    self.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
}


- (IBAction)buttonAction:(UIButton *)sender {
    
    if ([self.userTextField.text isEqualToString:@"sys"]&&[self.pswTextField.text isEqualToString:@"123"]) {
         [MBProgressHUD showMessage:@"登录成功"];
        
        NSUserDefaults *user_d = [NSUserDefaults standardUserDefaults];
        [user_d setObject:self.userTextField.text forKey:@"name"];
        [user_d setObject:self.pswTextField.text forKey:@"psw"];
        [user_d synchronize];//同步
        [[NSNotificationCenter defaultCenter]postNotificationName:loginSucess object:self];
        
        if (self.loginBackBlock) {
            self.loginBackBlock(YES);
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
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
