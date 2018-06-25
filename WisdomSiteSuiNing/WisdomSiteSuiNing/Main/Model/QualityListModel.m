
//
//  QualityListModel.m
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/14.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import "QualityListModel.h"

@implementation QualityListModel

//-(instancetype)initWithDic:(NSDictionary*)dic{
//    self=[super init];
//    if (self) {
//        //用kvc的方式给属性赋值
//        [self setValuesForKeysWithDictionary:dic];
//        self.aid_user=[[aid_userModel alloc]initWithaid_user:[dic objectForKey:@"aid_user"]];
//        self.zid_user=[[zid_userModel alloc]initWithDictionary:[dic objectForKey:@"zid_user"]];
//    }
//    return self;
//}
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//
//}
-(id)initWithQualityListDictionary:(NSDictionary*)dict{
    if (self = [super init]){
        if ([dict isKindOfClass:[NSDictionary class]]){
            DTAPI_DICT_ASSIGN_STRING(id, @"");
            DTAPI_DICT_ASSIGN_STRING(aid, @"");
            DTAPI_DICT_ASSIGN_STRING(dte, @"");
            DTAPI_DICT_ASSIGN_STRING(zid, @"");
            DTAPI_DICT_ASSIGN_STRING(ste, @"");
            DTAPI_DICT_ASSIGN_STRING(cmt, @"");
            DTAPI_DICT_ASSIGN_STRING(ret, @"");
            DTAPI_DICT_ASSIGN_STRING(ptn, @"");
            DTAPI_DICT_ASSIGN_STRING(dtz, @"");
            DTAPI_DICT_ASSIGN_STRING(rsk, @"");
            DTAPI_DICT_ASSIGN_STRING(fid, @"");
            DTAPI_DICT_ASSIGN_STRING(dtf, @"");
            DTAPI_DICT_ASSIGN_STRING(cmf, @"");
            DTAPI_DICT_ASSIGN_STRING(zgq, @"");
            DTAPI_DICT_ASSIGN_STRING(ste_txt, @"");
            DTAPI_DICT_ASSIGN_STRING(cq, @"");
            
          
            
            //如果是普通字段  用上面的类型
            //如果是对象类型就是你原来写的类型(并且aid_userModel中也要按照上面的模式写)
            self.aid_user = [[aid_userModel alloc] initWithaid_user:[dict objectForKey:@"aid_user"]];
            self.zid_user = [[zid_userModel alloc] initWithDictionary:[dict objectForKey:@"zid_user"]];
            self.fid_user = [[fid_user alloc]initWithfid_user:[dict objectForKey:@"fid_user"]];
            
            
            
            NSUserDefaults *user_d = [NSUserDefaults standardUserDefaults];
            NSString *userid = [user_d objectForKey:@"id"];
            
//            if (![self.zid_user.user_id isEqualToString:userid] && ![self.fid_user.user_id isEqualToString:userid]) {//非整改  非复核人
//                self.type = @"0";
//            }else if ([self.zid_user.user_id isEqualToString:userid] && [self.fid_user.user_id isEqualToString:userid]){
//                self.type = @"3";
//            }else{
//                if ([self.zid_user.user_id isEqualToString:userid]){//整改人
//                    self.type = @"1";
//                }else{//复核人
//                    self.type = @"2";
//                }
//            }
            
            if ([self.ste isEqualToString:@"0"]) {//未整改
                if ([self.zid_user.user_id isEqualToString:userid]){//整改人
                    self.type = @"1";
                }
            }else if ([self.ste isEqualToString:@"1"] || [self.ste isEqualToString:@"2"]){//不通过/已整改
                if ([self.fid_user.user_id isEqualToString:userid]){//复核人
                    self.type = @"2";
                }
            }
            
            
            //数组的处理方式   数组里面如果是字典
            if ([[dict objectForKey:@"image_ques"] isKindOfClass:[NSArray class]]) {
                self.image_ques=[dict objectForKey:@"image_ques"];
            }else{
                self.image_ques=@[];
            }
            if ([[dict objectForKey:@"image_res"] isKindOfClass:[NSArray class]]) {
                self.image_res=[dict objectForKey:@"image_res"];
            }else{
                self.image_res=@[];
            }
            if ([[dict objectForKey:@"image_ys"] isKindOfClass:[NSArray class]]) {
                self.image_ys=[dict objectForKey:@"image_ys"];
            }else{
                self.image_ys=@[];
            }
            
//            self.image_res=[dict objectForKey:@"image_res"];
//            self.image_ys=[dict objectForKey:@"image_ys"];
            self.images1=[dict objectForKey:@"images1"];
            self.images2=[dict objectForKey:@"images2"];
            self.images3=[dict objectForKey:@"images3"];
            

          

            
        }
    }
    return self;
}

@end
