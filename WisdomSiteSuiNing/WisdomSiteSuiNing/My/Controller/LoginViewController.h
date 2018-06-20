//
//  LoginViewController.h
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/20.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property(nonatomic,copy)void (^loginBackBlock)(BOOL isSucess);

@end
