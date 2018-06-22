
//
//  AddrDetailTableViewCell.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/20.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "AddrDetailTableViewCell.h"

@interface AddrDetailTableViewCell (){
}
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation AddrDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)reloadCellData:(id)cellData withHeadImageUrl:(NSString *)imageUrl{
    
//    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_model.avatar] placeholderImage:[UIImage imageNamed:@"default.jpg"]];
    self.headImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default.jpg"]];
    
//    self.nameLabel.text=[NSString stringWithFormat:@"%@",_model.tit];
//    self.phoneLabel.text=[NSString stringWithFormat:@"%@",_model.phone];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
