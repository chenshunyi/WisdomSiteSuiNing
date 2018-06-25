//
//  HeadTableViewCell.m
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/10.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "HeadTableViewCell.h"


@interface  HeadTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *headButton;

@end


@implementation HeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)reloadCelldata:(id)data Withimage:(UIImage*)image{
    self.headButton.layer.cornerRadius=50;
    self.headButton.layer.masksToBounds = YES;//是否裁剪边缘部分
    
//    NSString *avatarStr = [CustomString isNotEmptyString:avatarUrl]?avatarUrl:@"";
//    [self.headButton sd_setImageWithURL:[NSURL URLWithString:avatarStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"my_photo.png"]];
    
//    NSString *avatarStr = [CustomString isNotEmptyString:avatarUrl]?avatarUrl:@"";
//    [self.headButton sd_setImageWithURL:[NSURL URLWithString:avatarStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"my_photo.png"]];
 
    if (!image) {
         [self.headButton setImage:[UIImage imageNamed:@"my_photo.png"] forState:UIControlStateNormal];
        
    }else{
       [self.headButton setImage:image forState:UIControlStateNormal];
    }
}

//更换头像
- (IBAction)headButtonAction:(UIButton *)sender {
    if (self.changeHeadImageBlock) {
        self.changeHeadImageBlock(sender.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
