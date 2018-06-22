//
//  InformationTableViewCell.h
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/10.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^textFieldDidBeginEditingBLock)(NSIndexPath *indexPath);

@property (nonatomic, copy) void(^textFieldDidEndEditingBLock)(NSIndexPath *indexPath,NSString *text);

-(void)reloadCelldata:(id)data WithTitle:(NSString*)titleStr WithIndexPath:(NSIndexPath*)indexPath;

@end
