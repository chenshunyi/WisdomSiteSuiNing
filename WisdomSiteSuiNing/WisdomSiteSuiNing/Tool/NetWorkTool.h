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

