//
//  UserAuthModel.m
//  WisdomSite
//
//  Created by chenshunyi on 2018/6/6.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "UserAuthModel.h"

@implementation UserAuthModel


-(id)initWithDictionary:(NSDictionary*)dict {
    if (self = [super init]){
        if ([dict isKindOfClass:[NSDictionary class]]){
            DTAPI_DICT_ASSIGN_STRING(id, @"");
            DTAPI_DICT_ASSIGN_STRING(name, @"");
//            DTAPI_DICT_ASSIGN_STRING(parent, @"");
            DTAPI_DICT_ASSIGN_STRING(route, @"");
            DTAPI_DICT_ASSIGN_STRING(order, @"");
//            DTAPI_DICT_ASSIGN_STRING(data, @"");
            DTAPI_DICT_ASSIGN_STRING(icon, @"");
        }
    }
    return self;
}



@end
