//
//  LoginAndRegistService.h
//  AndyNewFram
//
//  Created by lingnet on 2017/4/14.
//  Copyright © 2017年 xurenqinag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginAndRegistService : NSObject

/**
 登录

 @param userName 手机号/用户账号
 @param password 密码
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postLoginWithUsername:(NSString*)userName password:(NSString*)password complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;

/**
 获取首页的轮播图
 
 @param complate 完成请求
 @param failure 请求失败
 */
+(void)getIndexBannersListsWithComplate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;
@end
