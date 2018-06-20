//
//  EditPictureView.m
//  TaoFang
//
//  Created by user on 15/9/17.
//  Copyright (c) 2015年 House365. All rights reserved.
//

#import "EditPictureView.h"

@implementation EditPictureView
-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor=[UIColor colorWithRed:52/256.0 green:52/256.0 blue:53/256.0 alpha:1];
        UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.backgroundColor=[UIColor clearColor];
        cancelBtn.frame=CGRectMake(0, 0, frame.size.height, frame.size.height);
        [self addSubview:cancelBtn];
        [cancelBtn setImage:[UIImage imageNamed:@"icon_close_normal.png"] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *leftLine =[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cancelBtn.frame), 0, 0.5,frame.size.height)];
        leftLine.backgroundColor=[UIColor whiteColor];
        [self addSubview:leftLine];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.backgroundColor=[UIColor clearColor];
        sureBtn.frame=CGRectMake(frame.size.width-frame.size.height, 0, frame.size.height, frame.size.height);
        [self addSubview:sureBtn];
        [sureBtn setImage:[UIImage imageNamed:@"icon_check_normal.png"] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(finishBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *rightLine =[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(sureBtn.frame), 0, 0.5,frame.size.height)];
        rightLine.backgroundColor=[UIColor whiteColor];
        [self addSubview:rightLine];
        
        
        float width = (frame.size.width - CGRectGetMaxX(leftLine.frame)-(frame.size.width- CGRectGetMinX(rightLine.frame)))/3.0;
        

        
        UIImageView *editImgV=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftLine.frame)+(width-30)/2, 2, 30, 30)];
        editImgV.image=[UIImage imageNamed:@"icon_crop_normal.png"];
        [editImgV setBackgroundColor:[UIColor clearColor]];
        [self addSubview:editImgV];
        
        UILabel *editLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftLine.frame), CGRectGetMaxY(editImgV.frame), width, frame.size.height-CGRectGetMaxY(editImgV.frame))];
        editLabel.backgroundColor=[UIColor clearColor];
        editLabel.textAlignment=NSTextAlignmentCenter;
        editLabel.text=@"裁剪";
        editLabel.font=[UIFont boldSystemFontOfSize:13];
        editLabel.textColor=[UIColor whiteColor];
        [self addSubview:editLabel];
        
        UIButton*editBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        editBtn.backgroundColor=[UIColor clearColor];
        editBtn.frame=CGRectMake(CGRectGetMaxX(leftLine.frame), 0, width, 50);
        [self addSubview:editBtn];
//        [editBtn setImage:[UIImage imageNamed:@"icon_crop_normal.png"] forState:UIControlStateNormal];
        [editBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
       
        UIImageView *leftRotationImgV=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(editImgV.frame)+width, 2, 30, 30)];
        leftRotationImgV.backgroundColor=[UIColor clearColor];
        leftRotationImgV.image=[UIImage imageNamed:@"icon_trun_left_normal.png"];
        [self addSubview:leftRotationImgV];
        
        UILabel *leftRotationLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(editLabel.frame), CGRectGetMaxY(editImgV.frame), width, frame.size.height-CGRectGetMaxY(editImgV.frame))];
        leftRotationLabel.backgroundColor=[UIColor clearColor];
        leftRotationLabel.textAlignment=NSTextAlignmentCenter;
        leftRotationLabel.text=@"左旋转";
        leftRotationLabel.font=[UIFont boldSystemFontOfSize:13];
        leftRotationLabel.textColor=[UIColor whiteColor];
        [self addSubview:leftRotationLabel];
        
        UIButton *leftRotationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftRotationBtn.backgroundColor=[UIColor clearColor];
        leftRotationBtn.frame=CGRectMake(CGRectGetMaxX(leftLine.frame)+width, 0, width, 50);
        [self addSubview:leftRotationBtn];
//        [leftRotationBtn setImage:[UIImage imageNamed:@"icon_trun_left_normal.png"] forState:UIControlStateNormal];
        [leftRotationBtn addTarget:self action:@selector(leftRotationBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIImageView *rightRotationImgV=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(leftRotationImgV.frame)+width, 2, 30, 30)];
        rightRotationImgV.backgroundColor=[UIColor clearColor];
        rightRotationImgV.image=[UIImage imageNamed:@"icon_trun_right_normal.png"];
        [self addSubview:rightRotationImgV];
        
        UILabel *rightRotationLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftRotationLabel.frame), CGRectGetMaxY(editImgV.frame), width, frame.size.height-CGRectGetMaxY(editImgV.frame))];
        rightRotationLabel.backgroundColor=[UIColor clearColor];
        rightRotationLabel.textAlignment=NSTextAlignmentCenter;
        rightRotationLabel.text=@"右旋转";
        rightRotationLabel.font=[UIFont boldSystemFontOfSize:13];
        rightRotationLabel.textColor=[UIColor whiteColor];
        [self addSubview:rightRotationLabel];
        
        UIButton *rightRotationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightRotationBtn.backgroundColor=[UIColor clearColor];
        rightRotationBtn.frame=CGRectMake(CGRectGetMaxX(leftLine.frame)+2*width, 0, width, 50);
        [self addSubview:rightRotationBtn];
//        [rightRotationBtn setImage:[UIImage imageNamed:@"icon_trun_right_normal.png"] forState:UIControlStateNormal];
        [rightRotationBtn addTarget:self action:@selector(rightRotationBtnClick:) forControlEvents:UIControlEventTouchUpInside];


        
    }
    return self;
}
-(void)cancelBtnCLick:(id)sender
{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelEditView:)]) {
        [self.delegate cancelEditView:self];
    }
    
}
-(void)finishBtnCLick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(finishEditView:)]) {
        [self.delegate finishEditView:self];
    }
}
-(void)editBtnClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(editView:)]) {
        [self.delegate editView:self];
    }
}
-(void)leftRotationBtnClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftRotationEditView:)]) {
        [self.delegate leftRotationEditView:self];
    }
}
-(void)rightRotationBtnClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightRotationEditView:)]) {
        [self.delegate rightRotationEditView:self];
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
