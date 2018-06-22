//
//  CategoryTableViewCell.m
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/7.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "CategoryTableViewCell.h"

@interface CategoryTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@property(nonatomic,strong)NSArray*picArr;
@property(nonatomic,strong)NSArray*titleArr;
@property(nonatomic,strong)NSIndexPath*indexPath;


@end

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)reloadCellData:(NSDictionary *)dataDic{
    self.leftImageView.image=[UIImage imageNamed:[dataDic objectForKey:@"pic"]];
    self.contentLabel.text=[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"title"]];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
