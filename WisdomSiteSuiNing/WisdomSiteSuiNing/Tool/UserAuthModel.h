//
//  UserAuthModel.h
//  WisdomSite
//
//  Created by chenshunyi on 2018/6/6.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAuthModel : NSObject


@property(nonatomic,strong)NSString*id;
@property(nonatomic,strong)NSString*name;
//@property(nonatomic,strong)NSString*parent;
@property(nonatomic,strong)NSString*route;
@property(nonatomic,strong)NSString*order;
//@property(nonatomic,strong)NSString*data;
@property(nonatomic,strong)NSString*icon;

-(id)initWithDictionary:(NSDictionary*)dict;


@end
