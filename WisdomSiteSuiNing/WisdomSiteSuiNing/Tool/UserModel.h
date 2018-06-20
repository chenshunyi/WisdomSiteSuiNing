//
//  user.h
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/5.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic,strong)NSString*access_token;
@property(nonatomic,strong)NSString*avatar;
@property(nonatomic,strong)NSString*email;
@property(nonatomic,strong)NSString*expired_at;
@property(nonatomic,strong)NSString* id;
@property(nonatomic,strong)NSString*username;

@property(nonatomic,strong)NSString*user_id;
@property(nonatomic,strong)NSString*phone;
@property(nonatomic,strong)NSString*qq;
@property(nonatomic,strong)NSString*province;
@property(nonatomic,strong)NSString*city;
@property(nonatomic,strong)NSString*adr;
@property(nonatomic,strong)NSString*area;
@property(nonatomic,strong)NSString*locale;
@property(nonatomic,strong)NSString*tit;
@property(nonatomic,strong)NSString*age;
@property(nonatomic,strong)NSString*gender;//性别
@property(nonatomic,strong)NSString*sfz;//身份证


@property(nonatomic,strong)NSArray*userAuthArr;//身份证




+ (UserModel *)shareInstance;


-(id)initWithDictionary:(NSDictionary*)dict;


@end
