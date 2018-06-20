//
//  EditPictureView.h
//  TaoFang
//
//  Created by user on 15/9/17.
//  Copyright (c) 2015年 House365. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EditPictureView;
@protocol EditPictureViewDelegate <NSObject>
@optional
-(void)cancelEditView:(EditPictureView *)editView;
-(void)editView:(EditPictureView *)editView;
-(void)leftRotationEditView:(EditPictureView *)editView;
-(void)rightRotationEditView:(EditPictureView *)editView;
-(void)finishEditView:(EditPictureView *)editView;
@end
@interface EditPictureView : UIView<EditPictureViewDelegate>
@property (nonatomic,assign) id<EditPictureViewDelegate> delegate;
-(id)initWithFrame:(CGRect)frame;
@end
