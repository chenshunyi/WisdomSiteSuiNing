//
//  ThreeTableViewCell.h
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/4.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ThreeTableViewCellDelegate <NSObject>

//  cell中的button的点击事件方法，在协议中定义
-(void)threeButtonAction:(NSInteger)tag;

-(void)notificationButtonAction:(NSInteger)tag;

@end

@interface ThreeTableViewCell : UITableViewCell

@property (nonatomic,weak) id<ThreeTableViewCellDelegate> delegate;


-(void)reloadCellData:(NSArray *)dataArr  WithMeetingArr:(NSArray*)meetingArr;



@end
