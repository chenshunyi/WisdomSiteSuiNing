//
//  PECropView.h
//  PhotoCropEditor
//
//  Created by kishikawa katsumi on 2013/05/19.
//  Copyright (c) 2013 kishikawa katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface PECropView : UIView

@property (nonatomic) UIImage *image;
@property (nonatomic, readonly) UIImage *croppedImage;
@property (nonatomic) CGFloat aspectRatio;
@property (nonatomic) CGRect cropRect;
@property (nonatomic,assign) BOOL isRotationLeft;
@property (nonatomic,assign) BOOL isRotationRight;
-(UIImage *)getRotationImage;
@end
