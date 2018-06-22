//
//  PersonTableViewCell.m
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/7.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "PersonTableViewCell.h"

@interface PersonTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *zhileiLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;


@end

@implementation PersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)reloadCelldata:(id)model{
//    if (model) {//model 存在的情况
//        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"my_photo.png"]];
//        self.headImageView.layer.cornerRadius=35;
//        self.headImageView.layer.masksToBounds = YES;//是否裁剪边缘部分
//        self.zhileiLabel.text=model.tit;
//        self.nameLabel.text=model.username;
//        self.yearLabel.text=model.age;
//
//        NSString *addressStr = [CustomString isNotEmptyString:model.adr]?model.adr:@"";
//
//        self.locationLabel.text=[NSString stringWithFormat:@"%@",addressStr];
//
//
//    }else{
//        self.headImageView.image=[UIImage imageNamed:@""];
//        self.zhileiLabel.text=@"";
//        self.nameLabel.text=@"";
//        self.yearLabel.text=@"";
//        self.locationLabel.text=@"";
//
//    }
    self.headImageView.image=[UIImage imageNamed:@"my_photo.png"];
    self.zhileiLabel.text=@"测项员";
    self.nameLabel.text=@"黄星";
    self.yearLabel.text=@"25岁";
    self.locationLabel.text=@"江苏苏州";
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
