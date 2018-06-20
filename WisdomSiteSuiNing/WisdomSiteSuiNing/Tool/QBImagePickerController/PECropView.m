//
//  PECropView.m
//  PhotoCropEditor
//
//  Created by kishikawa katsumi on 2013/05/19.
//  Copyright (c) 2013 kishikawa katsumi. All rights reserved.
//
#import "PECropView.h"
#import "PECropRectView.h"
#define Border 10.f
static const CGFloat MarginTop = 37.0f;
static const CGFloat MarginBottom = MarginTop;
static const CGFloat MarginLeft = 20.0f;
static const CGFloat MarginRight = MarginLeft;

@interface PECropView () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
{
    UIRotationGestureRecognizer *rotationGestureRecognizer;
    UIImageOrientation  imageOrientation;
    CGFloat rotationIndex;
}
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIView *zoomingView;
@property (nonatomic) UIImageView *imageView;

@property (nonatomic) PECropRectView *cropRectView;
@property (nonatomic) UIView *topOverlayView;
@property (nonatomic) UIView *leftOverlayView;
@property (nonatomic) UIView *rightOverlayView;
@property (nonatomic) UIView *bottomOverlayView;

@property (nonatomic) CGRect insetRect;
@property (nonatomic) CGRect editingRect;
@property (nonatomic,assign)UIImageOrientation  imageOrientation;

@property (nonatomic, getter = isResizing) BOOL resizing;
@property (nonatomic) UIInterfaceOrientation interfaceOrientation;

@end

@implementation PECropView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [UIColor clearColor];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.delegate = self;
        self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.maximumZoomScale = 20.0f;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.bounces = NO;
        self.scrollView.bouncesZoom = NO;
        self.scrollView.clipsToBounds = NO;
        [self addSubview:self.scrollView];
        
        rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
        rotationGestureRecognizer.delegate = self;
        [self.scrollView addGestureRecognizer:rotationGestureRecognizer];
        
        self.cropRectView = [[PECropRectView alloc] init];
        self.cropRectView.delegate = self;
        [self addSubview:self.cropRectView];
        
        self.topOverlayView = [[UIView alloc] init];
        self.topOverlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
        [self addSubview:self.topOverlayView];
        
        self.leftOverlayView = [[UIView alloc] init];
        self.leftOverlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
        [self addSubview:self.leftOverlayView];
        
        self.rightOverlayView = [[UIView alloc] init];
        self.rightOverlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
        [self addSubview:self.rightOverlayView];
        
        self.bottomOverlayView = [[UIView alloc] init];
        self.bottomOverlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
        [self addSubview:self.bottomOverlayView];
    }
    
    return self;
}

#pragma mark -

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [self.cropRectView hitTest:[self convertPoint:point toView:self.cropRectView] withEvent:event];
    if (hitView) {
        return hitView;
    }
    CGPoint locationInImageView = [self convertPoint:point toView:self.zoomingView];
    CGPoint zoomedPoint = CGPointMake(locationInImageView.x * self.scrollView.zoomScale, locationInImageView.y * self.scrollView.zoomScale);
    if (CGRectContainsPoint(self.zoomingView.frame, zoomedPoint)) {
        return self.scrollView;
    }
    
    return [super hitTest:point withEvent:event];
}
- (void)setIsRotationLeft:(BOOL)isRotationLeft
{
    _isRotationLeft=isRotationLeft;
    if (_isRotationLeft)
    {
     [self handleRotation:rotationGestureRecognizer];
    }
    
}
-(void)setIsRotationRight:(BOOL)isRotationRight
{
    _isRotationRight=isRotationRight;
    if (_isRotationRight)
    {
      [self handleRotation:rotationGestureRecognizer];
    }
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.image) {
        return;
    }
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
        self.editingRect = CGRectInset(self.bounds, MarginLeft, MarginTop);
    } else {
        self.editingRect = CGRectInset(self.bounds, MarginLeft, MarginLeft);
    }
    
    if (!self.imageView) {
        if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
            self.insetRect = CGRectInset(self.bounds, MarginLeft, MarginTop);
        } else {
            self.insetRect = CGRectInset(self.bounds, MarginLeft, MarginLeft);
        }
        
        [self setupImageView];
    }
    if (!self.isResizing) {
        [self layoutCropRectViewWithCropRect:self.scrollView.frame];
        
        if (self.interfaceOrientation != interfaceOrientation) {
            [self zoomToCropRect:self.scrollView.frame];
        }
    }
    
    self.interfaceOrientation = interfaceOrientation;
}

- (void)layoutCropRectViewWithCropRect:(CGRect)cropRect
{
//    self.cropRectView.frame = cropRect;
    self.cropRectView.frame = CGRectMake(cropRect.origin.x-Border, cropRect.origin.y-Border, cropRect.size.width+2*Border, cropRect.size.height+2*Border);
    [self layoutOverlayViewsWithCropRect:cropRect];
}

- (void)layoutOverlayViewsWithCropRect:(CGRect)cropRect
{
    self.topOverlayView.frame = CGRectMake(0.0f,
                                           0.0f,
                                           CGRectGetWidth(self.bounds),
                                           CGRectGetMinY(cropRect));
    self.leftOverlayView.frame = CGRectMake(0.0f,
                                            CGRectGetMinY(cropRect),
                                            CGRectGetMinX(cropRect),
                                            CGRectGetHeight(cropRect));
    self.rightOverlayView.frame = CGRectMake(CGRectGetMaxX(cropRect),
                                             CGRectGetMinY(cropRect),
                                             CGRectGetWidth(self.bounds) - CGRectGetMaxX(cropRect),
                                             CGRectGetHeight(cropRect));
    self.bottomOverlayView.frame = CGRectMake(0.0f,
                                              CGRectGetMaxY(cropRect),
                                              CGRectGetWidth(self.bounds),
                                              CGRectGetHeight(self.bounds) - CGRectGetMaxY(cropRect));
}

- (void)setupImageView
{
    CGRect cropRect = AVMakeRectWithAspectRatioInsideRect(self.image.size, self.insetRect);
    
    self.scrollView.frame = cropRect;
    self.scrollView.contentSize = cropRect.size;
    
    self.zoomingView = [[UIView alloc] initWithFrame:self.scrollView.bounds];
    self.zoomingView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:self.zoomingView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.zoomingView.bounds];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = self.image;
    [self.zoomingView addSubview:self.imageView];
}

#pragma mark -

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    [self.imageView removeFromSuperview];
    self.imageView = nil;
    
    [self.zoomingView removeFromSuperview];
    self.zoomingView = nil;
    
    [self setNeedsLayout];
}

- (void)setAspectRatio:(CGFloat)aspectRatio
{
    CGRect cropRect = self.zoomingView.frame;
    CGFloat width = CGRectGetWidth(cropRect);
    CGFloat height = CGRectGetHeight(cropRect);
    if (width < height) {
        width = height * aspectRatio;
    } else {
        height = width * aspectRatio;
    }
    cropRect.size = CGSizeMake(width, height);
    [self zoomToCropRect:cropRect];
}

- (CGFloat)aspectRatio
{
    CGRect cropRect = self.scrollView.frame;
    CGFloat width = CGRectGetWidth(cropRect);
    CGFloat height = CGRectGetHeight(cropRect);
    return width / height;
}

- (void)setCropRect:(CGRect)cropRect
{
    [self zoomToCropRect:cropRect];
}

- (CGRect)cropRect
{
    return self.scrollView.frame;
}

- (UIImage *)croppedImage
{
    CGRect cropRect = [self convertRect:self.scrollView.frame toView:self.zoomingView];
    CGSize size = self.image.size;
    
    CGFloat ratio = 1.0f;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad || UIInterfaceOrientationIsPortrait(orientation)) {
        ratio = CGRectGetWidth(AVMakeRectWithAspectRatioInsideRect(self.image.size, self.insetRect)) / size.width;
    } else {
        ratio = CGRectGetHeight(AVMakeRectWithAspectRatioInsideRect(self.image.size, self.insetRect)) / size.height;
    }
    
    CGRect zoomedCropRect = CGRectMake(cropRect.origin.x / ratio,
                                       cropRect.origin.y / ratio,
                                       cropRect.size.width / ratio,
                                       cropRect.size.height / ratio);
    
    UIImage *rotatedImage = [self rotatedImageWithImage:self.image transform:self.imageView.transform];
    
    CGImageRef croppedImage = CGImageCreateWithImageInRect(rotatedImage.CGImage, zoomedCropRect);
    UIImage *image = [UIImage imageWithCGImage:croppedImage scale:1.0f orientation:rotatedImage.imageOrientation];
    CGImageRelease(croppedImage);
    
    return image;
}
- (UIImage *)rotatedImageWithImage:(UIImage *)image transform:(CGAffineTransform)transform
{
    CGSize size = image.size;
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, size.width / 2, size.height / 2);
    CGContextConcatCTM(context, transform);
    CGContextTranslateCTM(context, size.width / -2, size.height / -2);
    [image drawInRect:CGRectMake(0.0f, 0.0f, size.width,  size.height)];
    
    UIImage *rotatedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return rotatedImage;
}

- (CGRect)cappedCropRectInImageRectWithCropRectView:(PECropRectView *)cropRectView
{
    CGRect cropRect = cropRectView.frame;
    
    CGRect rect = [self convertRect:cropRect toView:self.scrollView];
    if (CGRectGetMinX(rect) < CGRectGetMinX(self.zoomingView.frame)) {
        cropRect.origin.x = CGRectGetMinX([self.scrollView convertRect:self.zoomingView.frame toView:self]);
        cropRect.size.width = CGRectGetMaxX(rect);
    }
    if (CGRectGetMinY(rect) < CGRectGetMinY(self.zoomingView.frame)) {
        cropRect.origin.y = CGRectGetMinY([self.scrollView convertRect:self.zoomingView.frame toView:self]);
        cropRect.size.height = CGRectGetMaxY(rect);
    }
    if (CGRectGetMaxX(rect) > CGRectGetMaxX(self.zoomingView.frame)) {
        cropRect.size.width = CGRectGetMaxX([self.scrollView convertRect:self.zoomingView.frame toView:self]) - CGRectGetMinX(cropRect);
    }
    if (CGRectGetMaxY(rect) > CGRectGetMaxY(self.zoomingView.frame)) {
        cropRect.size.height = CGRectGetMaxY([self.scrollView convertRect:self.zoomingView.frame toView:self]) - CGRectGetMinY(cropRect);
    }
    
    return cropRect;
}

- (void)automaticZoomIfEdgeTouched:(CGRect)cropRect
{
    if (CGRectGetMinX(cropRect) < CGRectGetMinX(self.editingRect) - 5.0f ||
        CGRectGetMaxX(cropRect) > CGRectGetMaxX(self.editingRect) + 5.0f ||
        CGRectGetMinY(cropRect) < CGRectGetMinY(self.editingRect) - 5.0f ||
        CGRectGetMaxY(cropRect) > CGRectGetMaxY(self.editingRect) + 5.0f) {
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [self zoomToCropRect:self.cropRectView.frame];
                         } completion:^(BOOL finished) {
                             
                         }];
    }
}

#pragma mark -

- (void)cropRectViewDidBeginEditing:(PECropRectView *)cropRectView
{
    self.resizing = YES;
}

- (void)cropRectViewEditingChanged:(PECropRectView *)cropRectView
{
    CGRect cropRect = [self cappedCropRectInImageRectWithCropRectView:cropRectView];
    
    [self layoutCropRectViewWithCropRect:cropRect];
    
    [self automaticZoomIfEdgeTouched:cropRect];
}

- (void)cropRectViewDidEndEditing:(PECropRectView *)cropRectView
{
    self.resizing = NO;
    [self zoomToCropRect:self.cropRectView.frame];
}

- (void)zoomToCropRect:(CGRect)toRect
{
    if (CGRectEqualToRect(self.scrollView.frame, toRect)) {
        return;
    }
    
    CGFloat width = CGRectGetWidth(toRect);
    CGFloat height = CGRectGetHeight(toRect);
    
    CGFloat scale = MIN(CGRectGetWidth(self.editingRect) / width, CGRectGetHeight(self.editingRect) / height);
    
    CGFloat scaledWidth = width * scale;
    CGFloat scaledHeight = height * scale;
    CGRect cropRect = CGRectMake((CGRectGetWidth(self.bounds) - scaledWidth) / 2,
                                 (CGRectGetHeight(self.bounds) - scaledHeight) / 2,
                                 scaledWidth,
                                 scaledHeight);
    
    CGRect zoomRect = [self convertRect:toRect toView:self.zoomingView];
    zoomRect.size.width = CGRectGetWidth(cropRect) / (self.scrollView.zoomScale * scale);
    zoomRect.size.height = CGRectGetHeight(cropRect) / (self.scrollView.zoomScale * scale);
    
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.scrollView.bounds = cropRect;
                         [self.scrollView zoomToRect:zoomRect animated:NO];
                         
                         [self layoutCropRectViewWithCropRect:cropRect];
                     } completion:^(BOOL finished) {
                         
                     }];
}

#pragma mark -
-(UIImage *)getRotationImage
{
    UIImage *image=[self image:self.image rotation:self.imageOrientation];
    return image;
}
- (void)handleRotation:(UIRotationGestureRecognizer *)gestureRecognizer
{
    CGFloat rotation = gestureRecognizer.rotation;
    if (_isRotationLeft)
    {
         _isRotationLeft=NO;
         rotation+=-1* M_PI_2;
        rotationIndex--;
    }
    if (_isRotationRight)
    {
        _isRotationRight=NO;
        rotation+=1* M_PI_2;
        rotationIndex++;
    }
    if (rotationIndex>=0)
    {
        if (rotationIndex==1)
        {
            self.imageOrientation=UIImageOrientationRight;
        }
        else if (rotationIndex==2)
        {
            self.imageOrientation=UIImageOrientationDown;
        }
        else if (rotationIndex==3)
        {
            self.imageOrientation=UIImageOrientationLeft;
        }
        else if (rotationIndex==4)
        {
            self.imageOrientation=UIImageOrientationUp;
        }
        if (rotationIndex==4)
        {
            rotationIndex=0;
        }
    }
    else if(rotationIndex<=0)
    {
        if (rotationIndex==-1)
        {
            self.imageOrientation=UIImageOrientationLeft;
        }
        else if (rotationIndex==-2)
        {
            self.imageOrientation=UIImageOrientationDown;
        }
        else if (rotationIndex==-3)
        {
            self.imageOrientation=UIImageOrientationRight;
        }
        else if (rotationIndex==-4)
        {
            self.imageOrientation=UIImageOrientationUp;
        }
        if (rotationIndex==-4)
        {
            rotationIndex=0;
        }
        
    }
    CGAffineTransform transform = CGAffineTransformRotate(self.imageView.transform, rotation);
    self.imageView.transform = transform;
    gestureRecognizer.rotation = 0.0f;
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.cropRectView.showsGridMinor = YES;
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded ||
               gestureRecognizer.state == UIGestureRecognizerStateCancelled ||
               gestureRecognizer.state == UIGestureRecognizerStateFailed) {
        self.cropRectView.showsGridMinor = NO;
    }
}
- (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation
{
    UIImage *newPic=nil;
    switch (orientation) {
        case UIImageOrientationLeft:
            newPic=[UIImage imageWithCGImage:image.CGImage scale:1.0 orientation:UIImageOrientationLeft];
            break;
        case UIImageOrientationRight:
           newPic=[UIImage imageWithCGImage:image.CGImage scale:1.0 orientation:UIImageOrientationRight];
            break;
        case UIImageOrientationDown:
           newPic=[UIImage imageWithCGImage:image.CGImage scale:1.0 orientation:UIImageOrientationDown];
            break;
        default:
            newPic=[UIImage imageWithCGImage:image.CGImage scale:1.0 orientation:UIImageOrientationUp];
            break;
    }
    return newPic;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.zoomingView;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGPoint contentOffset = scrollView.contentOffset;
    *targetContentOffset = contentOffset;
}

@end
