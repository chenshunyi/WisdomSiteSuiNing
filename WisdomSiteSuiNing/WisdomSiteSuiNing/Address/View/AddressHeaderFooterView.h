//
//  AddressHeaderFooterView.h
//  WisdomSiteSuiNing
//
//  Created by chenshunyi on 2018/6/24.
//  Copyright © 2018年 dyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressHeaderFooterView : UIView

@property (nonatomic,copy) void(^unfolderButtonClickBlock)(NSInteger section);

-(void)reloadHeaderFooterView:(NSDictionary *)data withUnfolder:(BOOL)unfolder withSection:(NSInteger)section;


@end
