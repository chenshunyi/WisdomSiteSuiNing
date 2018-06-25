//
//  zid_userModel.h
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/14.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface zid_userModel : NSObject

@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *signature;
@property(nonatomic,copy)NSString * gender;
@property(nonatomic,copy)NSString *qq;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *province;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *area;
@property(nonatomic,copy)NSString *locale;
@property(nonatomic,copy)NSString *created_at;
@property(nonatomic,copy)NSString *updated_at;
@property(nonatomic,copy)NSString *tit;
@property(nonatomic,copy)NSString *cod;
@property(nonatomic,copy)NSString *alv;
@property(nonatomic,copy)NSString *aid;
@property(nonatomic,copy)NSString *dpt;
@property(nonatomic,copy)NSString *lat;
@property(nonatomic,copy)NSString *lot;
@property(nonatomic,copy)NSString *rfid;
@property(nonatomic,copy)NSString *dwid;
@property(nonatomic,copy)NSString *nbid;
@property(nonatomic,copy)NSString *age;
@property(nonatomic,copy)NSString *sfz;
@property(nonatomic,copy)NSString *adr;
@property(nonatomic,copy)NSString *bzi;
@property(nonatomic,copy)NSString *gzi;
@property(nonatomic,copy)NSString *brc;
@property(nonatomic,copy)NSString *qyc;
@property(nonatomic,copy)NSString *app;
@property(nonatomic,copy)NSString *rid;
@property(nonatomic,copy)NSString *nme;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
