//
//  aid_userModel.m
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/14.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "aid_userModel.h"

@implementation aid_userModel

-(id)initWithaid_user:(NSDictionary*)dict{
    if (self = [super init]){
        if ([dict isKindOfClass:[NSDictionary class]]){
            DTAPI_DICT_ASSIGN_STRING(user_id, @"");
            DTAPI_DICT_ASSIGN_STRING(money, @"");
            DTAPI_DICT_ASSIGN_STRING(avatar, @"");
            DTAPI_DICT_ASSIGN_STRING(signature, @"");
            DTAPI_DICT_ASSIGN_STRING(gender, @"");
            DTAPI_DICT_ASSIGN_STRING(qq, @"");
            DTAPI_DICT_ASSIGN_STRING(phone, @"");
            DTAPI_DICT_ASSIGN_STRING(province, @"");
            DTAPI_DICT_ASSIGN_STRING(city, @"");
            DTAPI_DICT_ASSIGN_STRING(area, @"");
            DTAPI_DICT_ASSIGN_STRING(locale, @"");
            DTAPI_DICT_ASSIGN_STRING(created_at, @"");
            DTAPI_DICT_ASSIGN_STRING(updated_at, @"");
            DTAPI_DICT_ASSIGN_STRING(tit, @"");
            DTAPI_DICT_ASSIGN_STRING(cod, @"");
            DTAPI_DICT_ASSIGN_STRING(alv, @"");
            DTAPI_DICT_ASSIGN_STRING(aid, @"");
            DTAPI_DICT_ASSIGN_STRING(dpt, @"");
            DTAPI_DICT_ASSIGN_STRING(lat, @"");
            DTAPI_DICT_ASSIGN_STRING(lot, @"");
            DTAPI_DICT_ASSIGN_STRING(rfid, @"");
            DTAPI_DICT_ASSIGN_STRING(dwid, @"");
            DTAPI_DICT_ASSIGN_STRING(nbid, @"");
            DTAPI_DICT_ASSIGN_STRING(age, @"");
            DTAPI_DICT_ASSIGN_STRING(sfz, @"");
            DTAPI_DICT_ASSIGN_STRING(adr, @"");
            DTAPI_DICT_ASSIGN_STRING(bzi, @"");
            DTAPI_DICT_ASSIGN_STRING(gzi, @"");
            DTAPI_DICT_ASSIGN_STRING(brc, @"");
            DTAPI_DICT_ASSIGN_STRING(qyc, @"");
            DTAPI_DICT_ASSIGN_STRING(app, @"");
            DTAPI_DICT_ASSIGN_STRING(rid, @"");
            
            
            
        }
    }
    return self;
}


@end
