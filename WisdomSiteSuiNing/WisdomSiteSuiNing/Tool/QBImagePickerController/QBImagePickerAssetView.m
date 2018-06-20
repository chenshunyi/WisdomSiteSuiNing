/*
 Copyright (c) 2013 Katsuma Tanaka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "QBImagePickerAssetView.h"

// Views
#import "QBImagePickerVideoInfoView.h"

@interface QBImagePickerAssetView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) QBImagePickerVideoInfoView *videoInfoView;
@property (nonatomic, strong) UIImageView *overlayImageView;

@property (nonatomic, assign) BOOL  isSelect;

- (UIImage *)thumbnail;
- (UIImage *)tintedThumbnail;

@end

@implementation QBImagePickerAssetView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self) {
        /* Initialization */
        // Image View
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:imageView];
        self.imageView = imageView;
        
        // Video Info View
        QBImagePickerVideoInfoView *videoInfoView = [[QBImagePickerVideoInfoView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 17, self.bounds.size.width, 17)];
        videoInfoView.hidden = YES;
        videoInfoView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        
        [self addSubview:videoInfoView];
        self.videoInfoView = videoInfoView;
        
        // Overlay Image View
        UIImageView *overlayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width-30, 6, 24, 24)];
        overlayImageView.contentMode = UIViewContentModeScaleAspectFill;
        overlayImageView.clipsToBounds = YES;
        overlayImageView.image = [UIImage imageNamed:@"yzsq_icon_choose2"];
        overlayImageView.hidden = NO;
        overlayImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:overlayImageView];
        self.overlayImageView = overlayImageView;
        
        self.isSelect = NO;
    }
    
    return self;
}

- (void)setAsset:(ALAsset *)asset
{
    _asset = asset;
    
    // Set thumbnail image
    self.imageView.image = [self thumbnail];
    
    if([self.asset valueForProperty:ALAssetPropertyType] == ALAssetTypeVideo) {
        double duration = [[asset valueForProperty:ALAssetPropertyDuration] doubleValue];
        
        self.videoInfoView.hidden = NO;
        self.videoInfoView.duration = round(duration);
    } else {
        self.videoInfoView.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected
{
//    if (selected == false && _NotCancelSelected) {
//        return;
//    }
    
    if(self.allowsMultipleSelection) {
        if (selected) {
            self.overlayImageView.image = [UIImage imageNamed:@"yzsq_icon_choose"];
        }
        else
        {
            self.overlayImageView.image = [UIImage imageNamed:@"yzsq_icon_choose2"];
        }
        
        self.isSelect = selected;
//        self.overlayImageView.hidden = !selected;
        
        if (_NotCancelSelected) {
            self.overlayImageView.image = [UIImage imageNamed:@"img_choose_grey"];
        }
    }
}

- (BOOL)selected
{
    return self.isSelect;
//    return !self.overlayImageView.hidden;
}

- (void)setNotCancelSelected:(BOOL)NotCancelSelected
{
    if (NotCancelSelected) {
        self.overlayImageView.image = [UIImage imageNamed:@"img_choose_grey"];
    }
    else
    {
        if ([self selected]) {
            self.overlayImageView.image = [UIImage imageNamed:@"yzsq_icon_choose"];
        }
        else
        {
            self.overlayImageView.image = [UIImage imageNamed:@"yzsq_icon_choose2"];
        }

    }
    
    _NotCancelSelected = NotCancelSelected;
}

#pragma mark - Touch Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([self.delegate assetViewCanBeSelected:self] && !self.allowsMultipleSelection) {
        self.imageView.image = [self tintedThumbnail];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_NotCancelSelected) {
        return;
    }

    if([self.delegate assetViewCanBeSelected:self]) {
        self.selected = !self.selected;
        
        if(self.allowsMultipleSelection) {
            self.imageView.image = [self thumbnail];
        } else {
            self.imageView.image = [self tintedThumbnail];
        }
        
        [self.delegate assetView:self didChangeSelectionState:self.selected];
    } else {
        if(self.allowsMultipleSelection && self.selected) {
            self.selected = !self.selected;
            self.imageView.image = [self thumbnail];
            
            [self.delegate assetView:self didChangeSelectionState:self.selected];
        } else {
            self.imageView.image = [self thumbnail];
        }
        
        [self.delegate assetView:self didChangeSelectionState:self.selected];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.imageView.image = [self thumbnail];
}


#pragma mark - Instance Methods

- (UIImage *)thumbnail
{
    return [UIImage imageWithCGImage:[self.asset thumbnail]];
}

- (UIImage *)tintedThumbnail
{
    UIImage *thumbnail = [self thumbnail];
    
    UIGraphicsBeginImageContext(thumbnail.size);
    
    CGRect rect = CGRectMake(0, 0, thumbnail.size.width, thumbnail.size.height);
    [thumbnail drawInRect:rect];
    
    [[UIColor colorWithWhite:0 alpha:0.5] set];
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceAtop);
    
    UIImage *tintedThumbnail = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return tintedThumbnail;
}

@end
