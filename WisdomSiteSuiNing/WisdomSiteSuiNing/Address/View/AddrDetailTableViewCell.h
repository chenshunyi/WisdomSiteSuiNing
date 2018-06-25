//
//  AddrDetailTableViewCell.h
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/20.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddrDetailTableViewCell : UITableViewCell

-(void)reloadCellWithName:(NSString*)nameStr WithPhone:(NSString*)phoneStr withHeadImageUrl:(NSString *)imageUrl;


@end
