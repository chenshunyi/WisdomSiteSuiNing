//
//  QualityListModel.h
//  WisdomSite
//
//  Created by 董亚杰 on 2018/5/14.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "aid_userModel.h"
#import "zid_userModel.h"
#import "fid_user.h"

@interface QualityListModel : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *aid;
@property(nonatomic,copy)NSString *dte;
@property(nonatomic,copy)NSString *zid;
@property(nonatomic,copy)NSString * ste;
@property(nonatomic,copy)NSString *cmt;
@property(nonatomic,copy)NSString *ret;
@property(nonatomic,copy)NSString *ptn;
@property(nonatomic,copy)NSString *dtz;
@property(nonatomic,copy)NSString *rsk;
@property(nonatomic,copy)NSString *fid;
@property(nonatomic,copy)NSString *dtf;
@property(nonatomic,copy)NSString *cmf;
@property(nonatomic,copy)NSString *zgq;
@property(nonatomic,copy)NSString *ste_txt;
@property(nonatomic,copy)NSString *cq;
@property(nonatomic,copy)NSArray *image_ques; //发布人上传图片(质量整改)
@property(nonatomic,copy)NSArray *image_res; //责任人上传图片
@property(nonatomic,copy)NSArray *image_ys; //复核人上传图片


@property(nonatomic,copy)NSArray *images1; //发布人上传图片(安全整改)
@property(nonatomic,copy)NSArray *images2; // 责任人上传图片
@property(nonatomic,copy)NSArray *images3; // 复核人上传图片

@property(nonatomic,strong)aid_userModel*aid_user;
@property(nonatomic,strong)zid_userModel*zid_user;
@property(nonatomic,strong)fid_user*fid_user;



//@property(nonatomic,copy)NSString *type; //0:非整改非复核   1:整改人   2:复核人   3即是整改又是复核人
@property(nonatomic,copy)NSString *type; //1:整改人   2:复核人

-(id)initWithQualityListDictionary:(NSDictionary*)dict;


@end
