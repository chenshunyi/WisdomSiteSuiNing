//
//  NSString+Phone.h
//  WisdomSite
//
//  Created by chenshunyi on 2018/5/20.
//  Copyright © 2018年 董亚杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Phone)

//Phone
+ (BOOL)telePhoneCall:(NSString*)telno;
+ (BOOL)telePhoneCallWithChecking:(NSString*)telno;


@end
