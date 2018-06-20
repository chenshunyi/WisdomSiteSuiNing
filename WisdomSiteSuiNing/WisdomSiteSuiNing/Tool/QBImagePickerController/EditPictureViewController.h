//
//  EditPictureViewController.h
//  TaoFang
//
//  Created by user on 15/9/22.
//  Copyright (c) 2015年 House365. All rights reserved.
//

#import "BaseViewController.h"

@protocol EditPictureViewControllerDelegate <NSObject>

-(void)croppedImageFinish:(NSDictionary *)finishDic;

@end

@interface EditPictureViewController : BaseViewController
@property (nonatomic,strong) id<EditPictureViewControllerDelegate>delegate;

@property (nonatomic,retain) UIImage *image;
@property (nonatomic,copy) NSString *urlStr;
@property (nonatomic,assign) NSInteger  index;
@property (nonatomic,copy) NSString *imgType;
@end
