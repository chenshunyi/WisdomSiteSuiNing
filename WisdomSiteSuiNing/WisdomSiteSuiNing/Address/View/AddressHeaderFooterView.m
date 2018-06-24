//
//  AddressHeaderFooterView.m
//  WisdomSiteSuiNing
//
//  Created by chenshunyi on 2018/6/24.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "AddressHeaderFooterView.h"

@interface AddressHeaderFooterView ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *sanjiaoImgView;

@property (assign, nonatomic) NSInteger section;


@end

@implementation AddressHeaderFooterView

-(void)reloadHeaderFooterView:(NSDictionary *)data withUnfolder:(BOOL)unfolder withSection:(NSInteger)section{
    
    self.section = section;
    
    self.titleLabel.text = [data objectForKey:@"title"];
    
    //先让三角按钮恢复原样 和 添加按钮隐藏
    self.sanjiaoImgView.transform =CGAffineTransformIdentity;
    //如果该区是展开状态，三角按钮再旋转90度
    if (unfolder) { //展开状态
        self.sanjiaoImgView.transform =CGAffineTransformMakeRotation(M_PI_2);
    }
    
    
    
    
}

-(IBAction)buttonActions:(UIButton *)sender{
    if (self.unfolderButtonClickBlock) {
        self.unfolderButtonClickBlock(self.section);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
