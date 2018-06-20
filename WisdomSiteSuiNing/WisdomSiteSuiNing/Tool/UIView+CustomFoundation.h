//
//  UIView+CustomFoundation.h
//  TaoFang
//
//  Created by mxw on 16/1/20.
//  Copyright © 2016年 House365. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CustomFoundation)

@property(nonatomic) CGFloat leftValue;
@property(nonatomic) CGFloat topValue;
@property(nonatomic) CGFloat rightValue;
@property(nonatomic) CGFloat bottomValue;

@property(nonatomic) CGFloat widthValue;
@property(nonatomic) CGFloat heightValue;

@property(nonatomic) CGFloat centerXValue;
@property(nonatomic) CGFloat centerYValue;

@property(nonatomic,readonly) CGFloat screenXValue;
@property(nonatomic,readonly) CGFloat screenYValue;
@property(nonatomic,readonly) CGFloat screenViewXValue;
@property(nonatomic,readonly) CGFloat screenViewYValue;
@property(nonatomic,readonly) CGRect screenFrameValue;

@property(nonatomic) CGPoint originValue;
@property(nonatomic) CGSize sizeValue;

- (void)removeAllSubviews;
- (UIViewController *)viewController;
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;
@end
