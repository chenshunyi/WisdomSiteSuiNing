
//
//  NetWorkTool.m
//  NetWorkTool
//
//  Created by chenshunyi on 2018/4/27.
//  Copyright © 2018年 house365. All rights reserved.
//

#import "NetWorkTool.h"
//#import "ChangeViewController.h"
//#import "QualityAuditViewController.h"

#ifdef   JiangBeiSwich

#define BaseUrl  @"http://api.jiangbei.ademo.vip"

#else

#define BaseUrl  @"http://api.ademo.vip"

#endif

#define K_UserAuth                              @"用户权限"
#define K_AUthMsg                               @"授权信息"
#define K_UploadPic                             @"上传图片"
#define K_Login                                 @"登录"
#define K_Main                                  @"首页"
#define K_My                                    @"我的"
#define K_Addrerss                              @"部门"
#define K_AddrerssDetail                        @"部门人员信息"
#define K_Device                                @"设备"
#define K_DeviceDetail                          @"设备详情"
#define K_Publish                               @"整改发布"
#define K_PublishContent                        @"整改发布内容信息"
#define K_Quality                               @"质量整改详情"
#define K_QualityList                           @"质量整改列表"
#define K_SafeList                              @"安全整改列表"
#define K_CommissionQuality                     @"质量安全整改-代办"
#define K_gongZhong                             @"工种"
#define K_Shigong                               @"施工队伍"
#define K_Notifation                            @"内部通知信息"
#define K_QualityStudyList                      @"质量学习"
#define K_SafeStudyList                         @"安全学习"
#define K_TechnologyDisclosureList              @"技术交底"
#define K_SafeDisclosureList                    @"安全交底"
#define K_ModifyUserMessage                     @"用户资料修改"
#define K_NotiDetail                            @"内部通知详情"
#define K_Safe                                  @"安全整改详情"
#define K_ProgressList                          @"进度列表"
#define K_ProgressDetail                        @"进度详情"
#define K_XiaoMuDetail                          @"项目详情"
#define K_Parameter                             @"合同台账"
#define K_Pay                                   @"合同支付"
#define K_Change                                @"合同变更"
#define K_DataManagement                        @"竣工验收资料管理"
#define K_Legacy                                @"遗留问题"
#define K_LegacyDetail                          @"遗留问题详情"
#define K_Final                                 @"决算管理"
#define K_Document                              @"文档管理"
#define K_DocumentDetail                        @"文档管理详情"
#define K_Meeting                               @"我的会议"
#define K_MeetingDetail                         @"我的会议详情"
#define K_NotiCarousel                          @"首页消息通知"

@implementation NetWorkTool

+ (NetWorkTool *)shareInstance{
    static NetWorkTool * s_instance_dj_singleton = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_instance_dj_singleton == nil) {
            s_instance_dj_singleton = [[NetWorkTool alloc] init];
        }
    });
    return (NetWorkTool *)s_instance_dj_singleton;
    
}

#pragma mark 用户权限
-(void)requestUserAuthorityResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *url = @"/v1/auth/get-menu";
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [params setObject:[user objectForKey:@"id"] forKey:@"uid"];
    [self sendRequest:K_UserAuth baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}
#pragma mark 项目详情 (江北项目接口)
-(void)requestXiangMuDetailWithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *url = @"/v1/site";
    [self sendRequest:K_XiaoMuDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 合同台账 (江北项目接口)
-(void)requestParameterMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/v1/invest/contract";
    [self sendRequest:K_Parameter baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 合同支付管理 (江北项目接口)
-(void)requestPayMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/v1/invest/contract-pay";
    [self sendRequest:K_Pay baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 合同变更管理 (江北项目接口)
-(void)requestChangeMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/v1/invest/contract-change";
    [self sendRequest:K_Change baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 竣工验收资料管理 (江北项目接口)
-(void)requestDataManagementMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/v1/document/completion-acceptance";
    [self sendRequest:K_DataManagement baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
}

#pragma mark 遗留问题 (江北项目接口)
-(void)requestLegacyMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page withSearchText:(NSString *)searchText WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/v1/document/legacy-issues";
    if ([CustomString isNotEmptyString:searchText]) {
        url = @"/v1/document/search-issues";
        [params setValue:searchText forKey:@"nme"];
    }
    [self sendRequest:K_Legacy baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
}

#pragma mark 遗留问题详情 (江北项目接口)
-(void)requestLegacyDetailDetailMsgWithId:(NSString*)ID WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:ID forKey:@"id"];
    NSString *url = @"/v1/document/legacy-issues-detail";
    [self sendRequest:K_LegacyDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
}



#pragma mark 决算管理 (江北项目接口)
-(void)requestFinalMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/v1/document/project-budget";
    [self sendRequest:K_Final baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
}
#pragma mark 文档管理 (江北项目接口)
-(void)requestDocumentMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/v1/document/index";
    [self sendRequest:K_Document baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
}

#pragma mark 文档管理详情页
-(void)requestDocumentDetailMsgWithId:(NSString*)Id WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:Id forKey:@"id"];
    NSString *url = @"/v1/document/doc-detail";
    [self sendRequest:K_DocumentDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 质量(安全)整改列表---代办整改
-(void)requestCommissionQualityMsgWithtype:(NSString *)type pageSize:(NSString*)pageSize page:(NSString*)page user_id:(NSString*)user_id withResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:type forKey:@"type"];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:user_id forKey:@"user_id"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/device/default/to-do";
    [self sendRequest:K_CommissionQuality baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}


#pragma mark 我的会议 (江北项目接口)
-(void)requestMeetingListMsgWithUserId:(NSString*)userId WithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    [params setValue:userId forKey:@"userId"];
    NSString *url = @"/v1/document/meeting";
    [self sendRequest:K_Meeting baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
}
#pragma mark 我的会议详情 (江北项目接口)
-(void)requestMeetingDetailMsgWithUserId:(NSString*)ID WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:ID forKey:@"id"];
    NSString *url = @"/v1/document/meet-detail";
    [self sendRequest:K_MeetingDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
}


#pragma mark 上传图片
-(void)requestUploadPicWithPicArr:(NSArray *)picArr withResponse:(netWorkCallBack)callBackBlock{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSString *url = @"/device/default/upload";
    [self sendRequest:K_UploadPic baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:picArr params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}



#pragma mark 登录
-(void)requestLoginMsgWithCity:(NSString *)userName withPsw:(NSString *)psw withResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setValue:userName forKey:@"username"];
    [params setValue:psw forKey:@"password"];
    NSString *url = @"/v1/auth/login";
    [self sendRequest:K_Login baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 个人信息
-(void)requestMyMsgWithUserId:(NSString*)userId WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:userId forKey:@"id"];
    NSString *url = @"/personnel/default/user";
    [self sendRequest:K_My baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}
#pragma mark 整改发布界面公用数据
-(void)requestPublishContentsWithResponse:(netWorkCallBack)callBackBlock{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *url = @"/device/default/get-common-data";
    [self sendRequest:K_PublishContent baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        //        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}
//#pragma mark 整改发布
////#pragma mark 整改发布
//-(void)requestPublishQualityNeededWithType:(NSString *)type withSaveDic:(NSDictionary *)saveDic withResponse:(netWorkCallBack)callBackBlock{
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//
//    for (int i = 0; i<saveDic.allKeys.count; i++) {
//        NSString *keyStr = [saveDic.allKeys objectAtSafeIndex:i];
//        id values = [saveDic objectForKey:keyStr];
//        if ([keyStr isEqualToString:K_pic]) {//如果是图片
//            NSData *data=[NSJSONSerialization dataWithJSONObject:values options:NSJSONWritingPrettyPrinted error:nil];
//            NSString *jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//            [params setValue:jsonStr forKey:keyStr];
//
//        }else if ([keyStr isEqualToString:K_ptn] || [keyStr isEqualToString:K_cmt]){
//            NSDictionary *valueDic = (NSDictionary *)values;
//            [params setValue:[valueDic objectForKey:K_Title] forKey:keyStr];
//        }else{
//            NSDictionary *valueDic = (NSDictionary *)values;
//            [params setValue:[valueDic objectForKey:K_Titleid] forKey:keyStr];
//        }
//    }
//
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [params setObject:[user objectForKey:@"id"] forKey:@"aid"];
//    [params setValue:type forKey:@"type"];
//
//    NSString *url = @"/device/default/submit";
//    [self sendRequest:K_Publish baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
//        //        NSLog(@"%@",responseObject);
//        callBackBlock(nil,responseObject);
//    } failure:^(id operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//        callBackBlock(responseObject,nil);
//    } method:RequestMethod_POST];
//
//}
#pragma mark 质量整改列表
-(void)requestQualityListMsgWithState:(NSString *)state pageSize:(NSString*)pageSize page:(NSString*)page user_id:(NSString*)user_id withResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:state forKey:@"state"];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:user_id forKey:@"user_id"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/device/default/quality-correction-list";
    [self sendRequest:K_QualityList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 安全整改列表
-(void)requestSafeListMsgWithState:(NSString *)state pageSize:(NSString*)pageSize page:(NSString*)page user_id:(NSString*)user_id withResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:state forKey:@"state"];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:user_id forKey:@"user_id"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/device/default/safety-correction-list";
    [self sendRequest:K_SafeList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 质量整改详情
-(void)requestQualityMsgWithUserId:(NSString*)userId WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:userId forKey:@"id"];
    NSString *url = @"/device/default/quality-correction-details";
    [self sendRequest:K_Quality baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 安全整改详情
-(void)requestSafeMsgWithUserId:(NSString*)userId WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:userId forKey:@"id"];
    NSString *url = @"/device/default/safety-correction-details";
    [self sendRequest:K_Safe baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

//#pragma mark 整改审核
//-(void)requestAuditWithType:(NSString *)type WithID:(NSString*)ID withSaveDic:(NSDictionary *)saveDic withResponse:(netWorkCallBack)callBackBlock{
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    
//    for (int i = 0; i<saveDic.allKeys.count; i++) {
//        NSString *keyStr = [saveDic.allKeys objectAtSafeIndex:i];
//        id values = [saveDic objectForKey:keyStr];
//        if ([keyStr isEqualToString:K_picture]) {//如果是图片
//            NSData *data=[NSJSONSerialization dataWithJSONObject:values options:NSJSONWritingPrettyPrinted error:nil];
//            NSString *jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//            [params setValue:jsonStr forKey:keyStr];
//            
//        }else if ([keyStr isEqualToString:K_state]){
//            NSDictionary *valueDic = (NSDictionary *)values;
//            [params setValue:[valueDic objectForKey:K_stateId] forKey:keyStr];
//        }else{
//            NSString *valueStr = (NSString *)values;
//            [params setValue:valueStr forKey:keyStr];
//        }
//    }
//    
//    [params removeObjectForKey:@"cmt"];//去除整改内容的信息
//    
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [params setObject:[user objectForKey:@"id"] forKey:@"user_id"];
//    [params setObject:ID forKey:@"id"];
//    [params setValue:type forKey:@"type"];
//    
//    NSString *url = @"/device/default/review";
//    [self sendRequest:K_Publish baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//        callBackBlock(nil,responseObject);
//    } failure:^(id operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//        callBackBlock(responseObject,nil);
//    } method:RequestMethod_POST];
//    
//}


#pragma mark 进度查看列表
-(void)requestProgressListMsgWithResponse:(netWorkCallBack)callBackBlock{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //我把前面一部分URL 写成了宏
    NSString *url = @"/device/default/schedules";
    [self sendRequest:K_ProgressList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}
#pragma mark 进度查看详情
-(void)requestProgressDetailMsgWithSCD:(NSString *)scd WithResponse:(netWorkCallBack)callBackBlock{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:scd forKey:@"scd"];
    //我把前面一部分URL 写成了宏
    NSString *url = @"/device/default/children-schedules";
    [self sendRequest:K_ProgressDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 获取班组(施工队伍信息)
-(void)requestLaowuShigongMsgWithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *url = @"/personnel/default/team-list";
    [self sendRequest:K_Shigong baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_GET];
    
}

#pragma mark 获取工种信息
-(void)requestGongzhongMsgWithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *url = @"/personnel/default/work-type-list";
    [self sendRequest:K_gongZhong baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_GET];
    
}

#pragma mark 获取内部通知
-(void)requestNotiMsgWithUserId:(NSString *)userId pageSize:(NSString*)pageSize page:(NSString*)page withResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:userId forKey:@"userId"];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    ///personnel/default/notice-list
    NSString *url = @"/personnel/default/notice-list";
    [self sendRequest:K_Notifation baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}
#pragma mark 获取内部通知详情
-(void)requestNotiDetailMsgWithId:(NSString *)ID withResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:ID forKey:@"id"];
    ///personnel/default/notice-list
    NSString *url = @"/personnel/default/notice-detail";
    [self sendRequest:K_NotiDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}
#pragma mark 首页通知(轮播形式)
-(void)requestnoticearouselMsgWithUserId:(NSString *)userId pageSize:(NSString*)pageSize withResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:userId forKey:@"userId"];
    [params setValue:pageSize forKey:@"pageSize"];
    NSString *url = @"/personnel/default/notice-carousel";
    [self sendRequest:K_NotiCarousel baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}


#pragma mark 获取设备信息
-(void)requestDeviceMsgWithpageSize:(NSString*)pageSize page:(NSString*)page Response:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/device/default/devices";
    [self sendRequest:K_Device baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_GET];
    
}

#pragma mark 获取设备详情
-(void)requestDeviceDetailMsgWithDeviceId:(NSString*)deviceId WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:deviceId forKey:@"id"];
    NSString *url = @"/device/default/device-detail";
    [self sendRequest:K_DeviceDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}



#pragma mark 通讯录部门 (添加刷新)
-(void)requestAddressMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/personnel/default/departments";
    [self sendRequest:K_Addrerss baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}

#pragma mark 通讯录部门人员信息
-(void)requestAddressDetailMsgWithUserId:(NSString*)userId pageSize:(NSString*)pageSize page:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:userId forKey:@"id"];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSString *url = @"/personnel/default/department-profiles";
    [self sendRequest:K_AddrerssDetail baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}



#pragma mark 首页 进度
-(void)requestMainMsgWithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSString *url = @"/v1/site/index";
    [self sendRequest:K_Main baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}


#pragma mark 质量学习
-(void)requestQualityStudyListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:state forKey:@"state"];
    NSString *url = @"/device/default/quality-study";
    [self sendRequest:K_QualityStudyList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_GET];
    
}
#pragma mark 安全学习
-(void)requestSafeStudyListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:state forKey:@"state"];
    NSString *url = @"/device/default/safety-study";
    [self sendRequest:K_SafeStudyList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_GET];
    
}

#pragma mark 技术交底
-(void)requestTechnologyDisclosureListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:state forKey:@"state"];
    NSString *url = @"/device/default/technical-disclosure";
    [self sendRequest:K_TechnologyDisclosureList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_GET];
    
}

#pragma mark 安全交底
-(void)requestSafeDisclosureListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:state forKey:@"state"];
    NSString *url = @"/device/default/safety-delivery";
    [self sendRequest:K_SafeDisclosureList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_GET];
    
}

#pragma mark 质量学习 安全学习 技术交底 安全交底  四个接口
-(void)requestQualityAndSafeListMsgWithType:(NSString *)type withState:(NSString *)state pageSize:(NSString*)pageSize page:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:state forKey:@"state"];
    [params setObject:type forKey:@"type"];
    [params setValue:pageSize forKey:@"pageSize"];
    [params setValue:page forKey:@"page"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [params setObject:[user objectForKey:@"id"] forKey:@"userId"];
    NSString *url = @"/device/default/common-state";
    [self sendRequest:K_SafeDisclosureList baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:nil params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}


#pragma mark 用户资料修改
-(void)requestModifyUserMessage:(UIImage *)image WithSaveDic:(NSDictionary *)saveDic WithResponse:(netWorkCallBack)callBackBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValuesForKeysWithDictionary:saveDic];
    //    [params setva]
    //我把前面一部分URL 写成了宏
    NSString *url = @"/personnel/default/update-user";
    [self sendRequest:K_ModifyUserMessage baseUrl:[NSString stringWithFormat:@"%@%@",BaseUrl,url] photos:@[image] params:params success:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(nil,responseObject);
    } failure:^(id operation, id responseObject) {
        NSLog(@"%@",responseObject);
        callBackBlock(responseObject,nil);
    } method:RequestMethod_POST];
    
}
#pragma mark - 请求封装

/**
 封装的GET POST请求
 
 @param requestName 请求名
 @param baseUrl 请求域名
 @param photos 图片数组(无图片写nil)
 @param params 请求参数
 @param success 失败回调
 @param failure 失败回调
 @param requestMethod  GET  /POST方法
 */
-(void)sendRequest:(NSString *)requestName
           baseUrl:(NSString *)baseUrl
            photos:(NSArray *)photos
            params:(NSMutableDictionary *)params
           success:(TFHttpCallback)success
           failure:(TFHttpCallback)failure
            method:(RequestMethod)requestMethod{
    
    //创建http对象
    AFHTTPSessionManager*session=[AFHTTPSessionManager manager];
    //返回的数据类型
    session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    [params setValue:@"app" forKey:@"channl"];
    [params setValue:version forKey:@"v"];
    [params setValue:version forKey:@"version"];
    [params setValue:@"C6EC6968-EB81-40FC-85A0-2C9466F2C473" forKey:@"deviceid"];
    
    if (requestMethod == RequestMethod_POST) {
        [session POST:baseUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            if (photos && (photos.count > 0)) {
                for (int i = 0; i < photos.count; i ++) {
                    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
                    formatter.dateFormat=@"yyyyMMddHHmmss";
                    NSString *str=[formatter stringFromDate:[NSDate date]];
                    NSString *fileName=[NSString stringWithFormat:@"%@.png",str];
                    UIImage *image = photos[i];
                    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
                    //                    [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image.png"];
                    [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
                }
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"网络请求成功 [%@]:%@  \n POST参数 :%@",requestName,task.currentRequest.URL.absoluteString,params);
            success(task.currentRequest,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"网络请求失败 [%@]:%@  \n POST参数 :%@",requestName,task.currentRequest.URL.absoluteString,params);
            failure(task.currentRequest,error);
        }];
    }else if (requestMethod == RequestMethod_GET){
        [session GET:baseUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"网络请求成功 [%@]:%@",requestName,task.currentRequest.URL.absoluteString);
            success(task.currentRequest,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"网络请求失败 [%@]:%@",requestName,task.currentRequest.URL.absoluteString);
            failure(task.currentRequest,error);
        }];
    }
    
}

-(void)downLoadFileWithUrl:(NSString *)url{
    //创建http对象
    AFHTTPSessionManager*session=[AFHTTPSessionManager manager];
    //返回的数据类型
    session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
}
/**
 下载文件
 
 @param requestURLString 文件URL
 @param parameters 参数字典
 @param savedPath 保存路径
 @param success 成功回调
 @param failure 失败回调
 @param progress 进度回调
 */
- (void)downloadFileWithURL:(NSString*)requestURLString
                 parameters:(NSDictionary *)parameters
                  savedPath:(NSString*)savedPath
            downloadSuccess:(void (^)(NSURLResponse *response, NSURL *filePath))success
            downloadFailure:(void (^)(NSError *error))failure
           downloadProgress:(void (^)(NSProgress *downloadProgress))progress

{
    //创建http对象
    AFHTTPSessionManager*session=[AFHTTPSessionManager manager];
    //返回的数据类型
    session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURLString]];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
        NSLog(@"%@",downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:savedPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if(error){
            failure(error);
        }else{
            success(response,filePath);
        }
    }];
    
    [task resume];
}





@end
