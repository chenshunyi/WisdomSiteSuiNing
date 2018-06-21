//
//  ThreeTableViewCell.m
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/4.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "ThreeTableViewCell.h"

@interface ThreeTableViewCell ()<UIScrollViewDelegate>{
    UIScrollView*_scrollView;
    NSInteger _num;
}
@property (weak, nonatomic) IBOutlet UIView *bigView;
@property (weak, nonatomic) IBOutlet UIButton *notiButton;
@property(nonatomic,strong)NSTimer*timer;
@property(nonatomic,strong)NSArray*meetArr;



@end

@implementation ThreeTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)reloadCellData:(NSArray *)dataArr  WithMeetingArr:(NSArray*)meetingArr{
    self.meetArr=meetingArr;
    CGFloat scrollViewHeight =30;
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, scrollViewHeight)];
    _scrollView.contentSize=CGSizeMake(ScreenWidth, scrollViewHeight*meetingArr.count);
    _scrollView.pagingEnabled=YES;//分页效果
    _scrollView.bounces=NO;//无边界
    _scrollView.delegate=self;
    [self addSubview:_scrollView];
    
    _num=0;
    
//    for (int i=0; i<meetingArr.count; i++) {
//        
//        MeetingLIstModel*model=[meetingArr objectAtSafeIndex:i];
//        
//        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, scrollViewHeight*i, ScreenWidth, scrollViewHeight)];
//        view.backgroundColor=UIColorFromRGB(0xF6F6F6);
//        [_scrollView addSubview:view];
//        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(0, 0, ScreenWidth, scrollViewHeight);
//        [button addTarget:self action:@selector(notificationButtonCLick:) forControlEvents:UIControlEventTouchUpInside];
//        button.tag = i;
//        [view addSubview:button];
//        
//        UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(24, 6, 19, 17)];
//        imageView.image=[UIImage imageNamed:@"home_notification.png"];
//        [view addSubview:imageView];
//        
//        UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(60, 7, ScreenWidth-24-19-17, 15)];
//        label.text=[NSString stringWithFormat:@"%@",model.nme];
//        label.font=[UIFont systemFontOfSize:13];
//        [view addSubview:label];
//    }
    
    [self addTimer];
    
    CGFloat width =ScreenWidth/3;
    CGFloat height=237/2;
    NSInteger col = 3;
 
    [self.bigView removeAllSubviews];
    
    if (meetingArr.count > 0) {
        self.notiButton.hidden = YES;
    }else{
        self.notiButton.hidden = NO;
    }
    
    for (int i=0; i<dataArr.count; i++) {
        NSDictionary *dataDic = [dataArr objectAtSafeIndex:i];
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(width*(i%col),0+height*(i/col), width, height)];
        [self.bigView addSubview:bgView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = bgView.bounds;
        button.tag = [[dataDic objectForKey:@"type"] integerValue];
        [button addTarget:self action:@selector(buttonActions:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:button];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[dataDic objectForKey:@"pic"]]];
        imageView.center = CGPointMake(width/2, 22+26);
        imageView.bounds = CGRectMake(0, 0, 51, 51);
        [bgView addSubview:imageView];
        
        CGFloat y = CGRectGetMaxY(imageView.frame);//imageView的最大y坐标
        
        UILabel *label = [[UILabel alloc] init];
        label.center = CGPointMake(width/2, y+15+8);
        label.bounds = CGRectMake(0, 0, width, 15);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        label.text = [dataDic objectForKey:@"title"];
        [bgView addSubview:label];
    }
}
#pragma mark 定时器
- (void)addTimer {
    if (!self.timer && self.meetArr.count>0) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
//        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)nextImage {
    NSLog(@"111111");
    _num+=1;
    _scrollView.contentOffset = CGPointMake(0, _num%self.meetArr.count*30);
   
}




//+(CGFloat)cellHeight:(NSArray *)dataArr{
//    return 100;
//}

-(void)notificationButtonCLick:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(notificationButtonAction:)]) {
        [_delegate notificationButtonAction:sender.tag];
    }
}

- (IBAction)buttonActions:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(threeButtonAction:)]) {
        [_delegate threeButtonAction:sender.tag];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
