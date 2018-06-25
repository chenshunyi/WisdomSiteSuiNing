//
//  HeadTableViewCell.h
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/10.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HeadTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^changeHeadImageBlock)(NSInteger tag);

-(void)reloadCelldata:(id)data Withimage:(UIImage*)image;

@end
