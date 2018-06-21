
//
//  MainBannerTableViewCell.m
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/21.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import "MainBannerTableViewCell.h"

#define PICHEIGHT  215

@interface MainBannerTableViewCell ()<UIScrollViewDelegate>{
    NSInteger _num;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer*timer;
@property(nonatomic,strong)NSArray*picsArr;


@end


@implementation MainBannerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)reloadCellWithPicArr:(NSArray *)picArr{
    if (picArr.count>0) {
        self.picsArr=picArr;
        self.scrollView.contentSize=CGSizeMake(picArr.count*ScreenWidth, PICHEIGHT);
        self.scrollView.delegate=self;
        self.scrollView.bounces=NO;//无边界
        self.scrollView.pagingEnabled=YES;//设置分页效果
        self.scrollView.showsHorizontalScrollIndicator=NO;//滑条不出现
        
        _num=0;
        
        for (int i=0; i<picArr.count; i++) {
            UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
            [button setAdjustsImageWhenHighlighted:NO];//去掉button的点击效果
            button.frame = CGRectMake(ScreenWidth*i, 0, ScreenWidth, PICHEIGHT);
            button.tag = i;
            [button setImage:[UIImage imageNamed:[picArr objectAtIndex:i]] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:button];
        }
        
    }
    [self addTimer];
}
#pragma mark --- 定时器
- (void)addTimer {
    if (!self.timer && self.picsArr.count>0) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}
-(void)nextImage{
    NSLog(@"定时器打开了");
    
    if (_num<4) {
        _num+=1;
    }else{
        _num=0;
    }
    self.scrollView.contentOffset=CGPointMake(_num*ScreenWidth, 0);
    self.pageControl.currentPage=_num;
}
-(void)removeTimer{//移除定时器
    [self.timer invalidate];
    self.timer=nil;
}
#pragma mark  --  UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{//结束的时候
    NSInteger page= scrollView.contentOffset.x/ScreenWidth;
    _num=page;
    self.pageControl.currentPage=page;
    [self addTimer];
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{//当图片即将开始被拖拽时 我们将定时器移除
    [self removeTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{// 当图片已经完成被拖拽时 我们还需加上定时器
    [self addTimer];
}

-(void)buttonAction:(UIButton *)sender{
    if (self.buttonActionBlock) {
        self.buttonActionBlock(sender.tag);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
