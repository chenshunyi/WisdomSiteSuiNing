//
//  ProgressTableViewCell.h
//  环形进度条
//
//  Created by chenshunyi on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ProgressTableViewCellDelegate <NSObject>

//  cell中的button的点击事件方法，在协议中定义
-(void)backButtonAction;

@end

@interface ProgressTableViewCell : UITableViewCell

@property (nonatomic,weak) id<ProgressTableViewCellDelegate> delegate;


-(void)reloadCellData:(id*)data;



@end
