//
//  LoginAndRegistService.m
//  AndyNewFram
//
//  Created by lingnet on 2017/4/14.
//  Copyright © 2017年 xurenqinag. All rights reserved.
//

#import "LoginAndRegistService.h"

@implementation LoginAndRegistService

/**
 登录
 
 @param userName 手机号/用户名
 @param password 密码
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postLoginWithUsername:(NSString *)userName password:(NSString *)password complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure{
    NSString* path = [NSString stringWithFormat:@"%@",MyLoginURL];
    NSDictionary* param = @{@"username":userName,@"password":password,@"type":@"1",@"jingdu":@"1",@"weidu":@"1"};
    
    [EZHHttpClenit postWithOldURLString:path params:param WithSuccess:^(id responseObject) {
        !complate?:complate(responseObject);
    } WithFailure:^(NSError *error) {
        !failure?:failure(error);
    }];
}

/**
 获取首页的轮播图
 
 @param complate 完成请求
 @param failure 请求失败
 */
+(void)getIndexBannersListsWithComplate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure{
    NSString *path = INDEXURL;
    [EZHHttpClenit postWithOldURLString:path params:nil WithSuccess:^(id responseObject) {
        !complate?:complate(responseObject);
    } WithFailure:^(NSError *error) {
        !failure?:failure(error);
    }];
}
@end
