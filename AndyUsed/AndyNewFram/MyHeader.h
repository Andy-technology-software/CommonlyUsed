//
//  MyHeader.h
//  E展汇
//
//  Created by iMac on 16/2/14.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#ifndef MyHeader_h
#define MyHeader_h

//提现

//40288199525dfde001525e5a9b690008
#define KK_DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width
#define KK_DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
#define MyfriendsURL @"http://os.ehuizhan.com.cn/app/user_app!userFriends.action?userId=402881a752de9f830152df16048e0001&pnum=1&num=10"
//我的账户列表

#define AllAccountURL @"http://os.ehuizhan.com.cn/app/user_app!userAccount.action"

#define MyAuthorityURL @"http://os.ehuizhan.com.cn/app/user_app!updateUserInfo.action"
//登录 注册 验证码
#define MyRegisterURL @"http://os.ehuizhan.com.cn/app/user_app!register.action"

#define ChangPwd @"http://os.ehuizhan.com.cn/app/user_app!updatePwd.action"

#define MyLoginURL @"http://os.ehuizhan.com.cn/app/user_app!login.action"

#define YanCodeURL @"http://os.ehuizhan.com.cn/app/public!getCode.action"

//红包类型
#define RedKindURL @"http://os.ehuizhan.com.cn/app/red_packets!getRedPacketsType.action"
//发红包
#define SendRedURL @"http://os.ehuizhan.com.cn/app/red_packets!sendRedPacket.action"

//拆红包
#define ChaiRedURL @"http://os.ehuizhan.com.cn/app/red_packets!getRedPacket.action"

//红包领取记录
#define LingQuURL @"http://os.ehuizhan.com.cn/app/red_packets!redPacketsHis.action"

//红包收发记录
#define ShouFaURL @"http://os.ehuizhan.com.cn/app/red_packets!redPacketsHis.action"
//我的账户和记录
#define mAccountUrl @"http://os.ehuizhan.com.cn/app/user_app!balance.action"

#define mRecordUrl  @"http://os.ehuizhan.com.cn/app/user_app!records.action"

//获取行业城市
#define CityURL @"http://os.ehuizhan.com.cn/app/exhibition!citys.action"

#define HangYeURL @"http://os.ehuizhan.com.cn/app/exhibition!industryTypes.action"

//创建展会
#define ExhibitionCreatURL @"http://os.ehuizhan.com.cn/app/exhibition!saveEx.action"

#define ExhibitionCreat1URL @"http://os.ehuizhan.com.cn/app/exhibition!exSave.action"
//我的关注
//展会
#define ExhitFocusURL @"http://os.ehuizhan.com.cn/app/user_app!userExhibition.action"
#define FaBuProductURL  @"http://os.ehuizhan.com.cn/app/product_app!publishPro.action"
//商家和个人
#define FocusURL @"http://os.ehuizhan.com.cn/app/user_app!userFollow.action"
#define FansURL @"http://os.ehuizhan.com.cn/app/user_app!userFans.action"

#define MyExhitURL @"http://os.ehuizhan.com.cn/app/user_app!userExhibition.action"

//获取企业信息
#define GetQiYeURL @"http://os.ehuizhan.com.cn/app/user_app!userInfo.action"
#define GetQiYeURL1 @"http://os.ehuizhan.com.cn/app/user_app!userDetail.action"

#define SaveQiYeURL @"http://os.ehuizhan.com.cn/app/user_app!updateUserInfo.action"

#define MyProductURL @"http://os.ehuizhan.com.cn/app/user_app!userProduct.action"

#define QiYeAuthURL @"http://os.ehuizhan.com.cn/app/user_app!userInfo.action"

#define SaveQiYeURL1 @"http://os.ehuizhan.com.cn/app/user_app!updateInfo.action"

#define FeedBackURL @"http://os.ehuizhan.com.cn/app/more!userAdvise.action"

#define TIJIAOSHENHE @"http://os.ehuizhan.com.cn/app/user_app!authentication.action"

#define TIJIAOSHENHE1 @"http://os.ehuizhan.com.cn/app/user_app!authente.action"


//我的账户
#define BankURL  @"http://os.ehuizhan.com.cn/app/balance!bindBankCard.action"

#define BankCardURL @"http://os.ehuizhan.com.cn/app/balance!bindBankCardList.action"

#define KindBankURL @"http://os.ehuizhan.com.cn/app/balance!bankList.action"

#define RecordListsURL @"http://os.ehuizhan.com.cn/app/balance!cashRecord.action"

#define RecordSURL @"http://os.ehuizhan.com.cn/app/user_app!records.action"

#define AddresssURL @"http://os.ehuizhan.com.cn/app/user_app!authentication.action"

#define MybanksURL @"http://os.ehuizhan.com.cn/app/balance!applyCash.action"

//充值
#define ChongURL @"http://os.ehuizhan.com.cn/app/user_account!createBill.action"
//红包更改状态
#define PayChangURL @"http://os.ehuizhan.com.cn/app/user_account!changeBillStatus.action"

#define VipListsURL @"http://os.ehuizhan.com.cn/app/user_account!vipList.action"

#define SearchURL @"http://os.ehuizhan.com.cn/app/index!searchInfo.action"

#define SearchFriend @"http://os.ehuizhan.com.cn/hx/friend!searchList.action"

#define AddFriendURL @"http://os.ehuizhan.com.cn/hx/friend!addFriend.action"

#define AddGroupURL @"http://os.ehuizhan.com.cn/hx/group!add.action"

#define SearchGroupURL @"http://os.ehuizhan.com.cn/hx/group!searchGroup.action"

#define FriendsListURL  @"http://os.ehuizhan.com.cn/hx/friend!getList.action"

#define AlipayBackURL  @"http://os.ehuizhan.com.cn/app/notify!notify_url.action"

#define ForeGetURL @"http://os.ehuizhan.com.cn/app/user_app!forgetPass.action"

//上传背景墙
#define UpImageURL @"http://os.ehuizhan.com.cn/app/user_app!uploadImg.action"

//删除照片墙
#define DeleateURL  @"http://os.ehuizhan.com.cn/app/balance!fireBankCard.action"







#endif 
