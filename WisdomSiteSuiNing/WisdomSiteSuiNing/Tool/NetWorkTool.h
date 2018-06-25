//
//  NetWorkTool.h
//  NetWorkTool
//
//  Created by chenshunyi on 2018/4/27.
//  Copyright © 2018年 house365. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, RequestMethod) {
    RequestMethod_GET,
    RequestMethod_POST,
    RequestMethod_PUT
};

typedef void (^netWorkCallBack)(NSError *error,id response);

typedef void(^TFHttpCallback)(id operation, id responseObject);


@interface NetWorkTool : NSObject

+ (NetWorkTool *)shareInstance;

//#pragma mark 用户权限
-(void)requestUserAuthorityResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 项目详情 (江北项目接口)
-(void)requestXiangMuDetailWithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 合同台账 (江北项目接口)
-(void)requestParameterMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 合同支付管理 (江北项目接口)
-(void)requestPayMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 合同变更管理 (江北项目接口)
-(void)requestChangeMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 竣工验收资料管理 (江北项目接口)
-(void)requestDataManagementMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 遗留问题 (江北项目接口)
-(void)requestLegacyMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page withSearchText:(NSString *)searchText WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 遗留问题详情 (江北项目接口)
-(void)requestLegacyDetailDetailMsgWithId:(NSString*)ID WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 决算管理 (江北项目接口)
-(void)requestFinalMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 文档管理 (江北项目接口)
-(void)requestDocumentMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 我的会议 (江北项目接口)
-(void)requestMeetingListMsgWithUserId:(NSString*)userId WithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 我的会议详情 (江北项目接口)
-(void)requestMeetingDetailMsgWithUserId:(NSString*)ID WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 首页通知(轮播形式)
-(void)requestnoticearouselMsgWithUserId:(NSString *)userId pageSize:(NSString*)pageSize withResponse:(netWorkCallBack)callBackBlock;
/**
 登录
 
 @param userName 用户名
 @param psw 密码
 @param callBackBlock 回调
 */
-(void)requestLoginMsgWithCity:(NSString *)userName withPsw:(NSString *)psw withResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 上传图片
-(void)requestUploadPicWithPicArr:(NSArray *)picArr withResponse:(netWorkCallBack)callBackBlock;
/**
 授权信息网络请求
 
 @param city 城市
 @param zmParams post参数
 @param callBackBlock 回调
 */
//-(void)requestAuthMsgWithCity:(NSString *)city withZmParams:(NSString *)zmParams withResponse:(netWorkCallBack)callBackBlock;

//首页

-(void)requestMainMsgWithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 个人信息
-(void)requestMyMsgWithUserId:(NSString*)userId WithResponse:(netWorkCallBack)callBackBlock;

//获取内部通知
-(void)requestNotiMsgWithUserId:(NSString *)userId pageSize:(NSString*)pageSize page:(NSString*)page withResponse:(netWorkCallBack)callBackBlock;

// 获取内部详情
-(void)requestNotiDetailMsgWithId:(NSString *)ID withResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 质量整改列表
-(void)requestQualityListMsgWithState:(NSString *)state pageSize:(NSString*)pageSize page:(NSString*)page user_id:(NSString*)user_id withResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 安全整改列表
-(void)requestSafeListMsgWithState:(NSString *)state pageSize:(NSString*)pageSize page:(NSString*)page user_id:(NSString*)user_id withResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 文档管理详情页
-(void)requestDocumentDetailMsgWithId:(NSString*)Id WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 质量(安全)整改列表---代办整改
-(void)requestCommissionQualityMsgWithtype:(NSString *)type pageSize:(NSString*)pageSize page:(NSString*)page user_id:(NSString*)user_id withResponse:(netWorkCallBack)callBackBlock;


/**
 进度查看列表
 @param callBackBlock 返回值
 */
-(void)requestProgressListMsgWithResponse:(netWorkCallBack)callBackBlock;
/**
 进度查看详情
 @param scd 进度id
 @param callBackBlock 返回值
 */
-(void)requestProgressDetailMsgWithSCD:(NSString *)scd WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 整改发布界面公用数据
-(void)requestPublishContentsWithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 整改发布
-(void)requestPublishQualityNeededWithType:(NSString *)type withSaveDic:(NSDictionary *)saveDic withResponse:(netWorkCallBack)callBackBlock;

//质量整改详情
-(void)requestQualityMsgWithUserId:(NSString*)userId WithResponse:(netWorkCallBack)callBackBlock;

// 安全整改详情
-(void)requestSafeMsgWithUserId:(NSString*)userId WithResponse:(netWorkCallBack)callBackBlock;

//通讯录 部门
-(void)requestAddressMsgWithPageSize:(NSString*)pageSize WithPage:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;
//-(void)requestAddressMsgWithResponse:(netWorkCallBack)callBackBlock;

// 通讯录部门人员信息
-(void)requestAddressDetailMsgWithUserId:(NSString*)userId pageSize:(NSString*)pageSize page:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;

// 获取设备信息
-(void)requestDeviceMsgWithpageSize:(NSString*)pageSize page:(NSString*)page Response:(netWorkCallBack)callBackBlock;

//#pragma mark 整改审核
-(void)requestAuditWithType:(NSString *)type WithID:(NSString*)ID withSaveDic:(NSDictionary *)saveDic withResponse:(netWorkCallBack)callBackBlock;


// 获取设备详情
-(void)requestDeviceDetailMsgWithDeviceId:(NSString*)deviceId WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 获取班组(施工队伍信息)
-(void)requestLaowuShigongMsgWithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 获取工种信息
-(void)requestGongzhongMsgWithResponse:(netWorkCallBack)callBackBlock;


//#pragma mark 质量学习
-(void)requestQualityStudyListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 安全学习
-(void)requestSafeStudyListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock;

//#pragma mark 技术交底
-(void)requestTechnologyDisclosureListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 安全交底
-(void)requestSafeDisclosureListMsgWithState:(NSString *)state WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 质量学习 安全学习 技术交底 安全交底  四个接口

/**
 质量学习 安全学习 技术交底 安全交底  四个接口
 
 @param type 类型 2安全交底；3安全学习； 5质量交底；6质量学习
 @param state   0全部  1未学习  2已学习
 @param callBackBlock 数据回调
 */
-(void)requestQualityAndSafeListMsgWithType:(NSString *)type withState:(NSString *)state pageSize:(NSString*)pageSize page:(NSString*)page WithResponse:(netWorkCallBack)callBackBlock;
//#pragma mark 用户资料修改
-(void)requestModifyUserMessage:(UIImage *)image WithSaveDic:(NSDictionary *)saveDic WithResponse:(netWorkCallBack)callBackBlock;




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
           downloadProgress:(void (^)(NSProgress *downloadProgress))progress;


@end

