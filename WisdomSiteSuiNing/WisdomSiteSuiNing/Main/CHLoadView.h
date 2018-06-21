//
//  CHLoadView.h
//  环形进度条
//
//  Created by mac on 18/5/2.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHLoadView : UIView


// 加载进度
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) NSInteger dayCount;

+(CHLoadView*)showInView:(UIView *)view;
- (instancetype)initWithFrame:(CGRect)frame withLineColor:(UIColor *)lineColor withLineWidth:(CGFloat)lineWidth withTextColor:(UIColor *)textColor withTextFontSize:(CGFloat)FontSize;
- (void)hide;
- (void)show;

@end
