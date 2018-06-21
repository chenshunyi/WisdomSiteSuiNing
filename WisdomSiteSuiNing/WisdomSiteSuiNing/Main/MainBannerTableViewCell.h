//
//  MainBannerTableViewCell.h
//  WisdomSiteSuiNing
//
//  Created by 董亚杰 on 2018/6/21.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainBannerTableViewCell : UITableViewCell

@property(nonatomic,copy) void (^buttonActionBlock)(NSInteger tag);

/**
    cell的高是215
 
 @param picArr 图片名数组
 */
-(void)reloadCellWithPicArr:(NSArray *)picArr;


@end
