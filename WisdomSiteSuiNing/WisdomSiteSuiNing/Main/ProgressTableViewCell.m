//
//  ProgressTableViewCell.m
//  环形进度条
//
//  Created by chenshunyi on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ProgressTableViewCell.h"
#import "CHLoadView.h"

@interface ProgressTableViewCell (){
    
    CHLoadView *_loadView;
    
}

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *openTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *closeTimeLabel;

@property (strong, nonatomic) IBOutlet UILabel *currentPeopleNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *totlaPeopleNumLabel;


@property (strong, nonatomic) IBOutlet UIView *progressView;


@end

@implementation ProgressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)reloadCellData:(id*)data{
    
    self.progressView.layer.cornerRadius = 60;
    self.progressView.layer.masksToBounds = YES;
    
    if (!_loadView) {
        _loadView = [[CHLoadView alloc] initWithFrame:CGRectMake(20, 20, 80, 80) withLineColor:[UIColor colorWithRed:67/255.0 green:177/255.0 blue:245/255.0 alpha:1] withLineWidth:3 withTextColor:[UIColor colorWithRed:67/255.0 green:177/255.0 blue:245/255.0 alpha:1] withTextFontSize:20];
        _loadView.layer.cornerRadius = 40;//半径
        _loadView.layer.masksToBounds = YES;//是否裁剪
        _loadView.userInteractionEnabled = NO;//关闭用户交互性
        _loadView.backgroundColor = [UIColor colorWithRed:230/255.0 green:247/255.0 blue:252/255.0 alpha:1];
        
        _loadView.progress=0.52;
        _loadView.dayCount=102;//剩余102天
        
        [self.progressView addSubview:_loadView];
    }
    
    
    
}
- (IBAction)buttonAction:(UIButton *)sender {
    if (_delegate &&[_delegate respondsToSelector:@selector(backButtonAction)]) {
        [_delegate backButtonAction];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
