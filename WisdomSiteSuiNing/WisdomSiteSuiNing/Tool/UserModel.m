//
//  user.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/5.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel


+ (UserModel *)shareInstance{
    static UserModel*userModel=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userModel == nil) {
            userModel = [[UserModel alloc] init];
        }
    });
    return (UserModel *)userModel;
}

//+ (NetWorkTool *)shareInstance{
//    static NetWorkTool * s_instance_dj_singleton = nil ;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        if (s_instance_dj_singleton == nil) {
//            s_instance_dj_singleton = [[NetWorkTool alloc] init];
//        }
//    });
//    return (NetWorkTool *)s_instance_dj_singleton;
//}

-(id)initWithDictionary:(NSDictionary*)dict {
    if (self = [super init]){
        if ([dict isKindOfClass:[NSDictionary class]]){
            DTAPI_DICT_ASSIGN_STRING(access_token, @"");
            DTAPI_DICT_ASSIGN_STRING(avatar, @"");
            DTAPI_DICT_ASSIGN_STRING(email, @"");
            DTAPI_DICT_ASSIGN_STRING(expired_at, @"");
            DTAPI_DICT_ASSIGN_STRING(id, @"");
            DTAPI_DICT_ASSIGN_STRING(username, @"");
            
            DTAPI_DICT_ASSIGN_STRING(gender, @"");
            DTAPI_DICT_ASSIGN_STRING(user_id, @"");
            DTAPI_DICT_ASSIGN_STRING(phone, @"");
            DTAPI_DICT_ASSIGN_STRING(qq, @"");
            DTAPI_DICT_ASSIGN_STRING(province, @"");
            DTAPI_DICT_ASSIGN_STRING(city, @"");
            DTAPI_DICT_ASSIGN_STRING(adr, @"");
            DTAPI_DICT_ASSIGN_STRING(area, @"");
            DTAPI_DICT_ASSIGN_STRING(locale, @"");
            DTAPI_DICT_ASSIGN_STRING(tit, @"");
            DTAPI_DICT_ASSIGN_STRING(age, @"");
            DTAPI_DICT_ASSIGN_STRING(sfz, @"");
                        
        }
    }
    return self;
}


@end
