//
//  CHLoadView.m
//  环形进度条
//
//  Created by mac on 18/5/2.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CHLoadView.h"

@interface CHLoadView ()

@property (nonatomic, strong) UILabel *loadLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) CAShapeLayer *shape;

@end

@implementation CHLoadView





/// 显示扇形进度条
+ (CHLoadView *)showInView:(UIView *)view
{
    CHLoadView *lv = [[CHLoadView alloc] initWithFrame:view.bounds];
    [view addSubview:lv];
    return lv;
}

- (instancetype)initWithFrame:(CGRect)frame withLineColor:(UIColor *)lineColor withLineWidth:(CGFloat)lineWidth withTextColor:(UIColor *)textColor withTextFontSize:(CGFloat)FontSize{
    if (self = [super initWithFrame:frame]) {
        /// 百分比label
        CGFloat viewWidth = 80;
        _loadLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, viewWidth, 20)];
        _loadLabel.textAlignment = NSTextAlignmentCenter;
        _loadLabel.textColor = textColor;
        _loadLabel.font = [UIFont systemFontOfSize:FontSize];
//        _loadLabel.center = self.center;
        _loadLabel.text = @"0%";
        [self addSubview:_loadLabel];
        
        
        _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, viewWidth, 10)];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.textColor = textColor;
        _dayLabel.font = [UIFont systemFontOfSize:8];
        _dayLabel.text = [NSString stringWithFormat:@"剩余%ld天",self.dayCount];
        [self addSubview:_dayLabel];
        
        
        
        
        CGFloat linewidth = lineWidth; // 线宽
        CGFloat radius = viewWidth/2 - linewidth;
        CGFloat start = -0.5*M_PI;
        CGFloat end = 1.5*M_PI;
        /*
         贝塞尔曲线
         @param ArcCenter 圆的中心
         @param radius 圆的半径
         @param startAngle 开始位置
         @param endAngle 结束位置
         @paramc lockwise 是否顺时针
         */
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(viewWidth/2, viewWidth/2) radius:radius startAngle:start endAngle:end clockwise:YES];
        
        // 划线layer
        _shape = [CAShapeLayer layer];
        _shape.frame = _loadLabel.bounds;
        _shape.lineWidth = linewidth;
        _shape.lineCap = kCALineCapRound;
        _shape.fillColor = [UIColor clearColor].CGColor;
        _shape.strokeColor = lineColor.CGColor;
        _shape.strokeEnd = 0;
        _shape.path = path.CGPath;
        [self.layer addSublayer:_shape];
    }
    return self;
}

/// 设置进度
- (void)setProgress:(CGFloat)progress {
    _progress = progress <= 0 ? 0 : progress;
    _progress = progress >= 1 ? 1 : progress;
    
    // 设置百分比label
    _loadLabel.text = [NSString stringWithFormat:@"%.0f%%",_progress*100.0f];
    
    // 设置layer进度
    _shape.strokeEnd = progress;
    
    if (_progress == 1.0) {
//        [self hide];
    }
}
-(void)setDayCount:(NSInteger)dayCount{
    _dayLabel.text = [NSString stringWithFormat:@"剩余%ld天",dayCount];
}

/// 从父视图移除
- (void)hide {
    self.hidden = YES;
}

-(void)show{
    self.hidden = NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
