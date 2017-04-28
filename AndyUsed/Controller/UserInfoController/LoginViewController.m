//
//  LoginViewController.m
//  E展汇
//
//  Created by 徐仁强 on 16/2/3.
//  Copyright © 2016年 徐仁强. All rights reserved.
//

#import "LoginViewController.h"

#import "LoginAndRegistService.h"
@interface LoginViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView* _tableView;
}

@property(nonatomic,retain)UIImageView* loginIV;
@property(nonatomic,retain)UIImageView* leftNameIV1;
@property(nonatomic,retain)UIImageView* leftPWIV1;
@property(nonatomic,retain)UIImageView* nameImageView;
@property(nonatomic,retain)UIImageView* PWImageView;

@property(nonatomic,retain)UITextField* nameTF;
@property(nonatomic,retain)UITextField* PWTF;

@property(nonatomic,retain)UILabel* zhucewangjiLable;

@property(nonatomic,retain)UIButton* leftDengluBtn;
@property(nonatomic,retain)UIButton* dengluBtn;
@property(nonatomic,retain)UIButton* zhuceBtn;
@property(nonatomic,retain)UIButton* wangjimimaBtn;

@property (nonatomic,assign)CLLocationCoordinate2D dingwei;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    [self getLat];
    
}
#pragma mark -- 获取经纬度
-(void)getLat {
//    [[CCLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
//        NSLog(@"%f +++++++++++ %f",locationCorrrdinate.latitude,locationCorrrdinate.longitude);
//        self.dingwei = locationCorrrdinate;
//    }];
}
#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [MyController getScreenWidth], [MyController getScreenHeight]) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:nil];
    tableBg.image = [UIImage imageNamed:@"背景"];
    [_tableView setBackgroundView:tableBg];
    //分割线类型
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    //_tableView.backgroundColor = [UIColor colorWithRed:190 green:30 blue:96 alpha:1];
    [self.view addSubview:_tableView];
}
#pragma mark - tableView行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
#pragma mark - tableVie点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self makecellUI:cell];
    return cell;
}
- (void)makecellUI:(UITableViewCell*)cell{
    self.loginIV = [[UIImageView alloc] init];
    self.loginIV.image = [UIImage imageNamed:@"登录-logo"];
    [cell addSubview:self.loginIV];
    [self.loginIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([MyController getScreenWidth] / 2 - 43);
        make.top.mas_equalTo(65);
        make.width.mas_offset(86);
        make.height.mas_offset(135);
    }];
    
    self.nameImageView = [[UIImageView alloc] init];
    [cell addSubview:self.nameImageView];
    self.nameImageView.image = [UIImage imageNamed:@"登录-框"];
    
    [self.nameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.loginIV.mas_bottom).offset(53);
        make.height.mas_offset(52);
    }];
    
    self.leftNameIV1 = [[UIImageView alloc] init];
    self.leftNameIV1.image = [UIImage imageNamed:@"登录-1"];
    [cell addSubview:self.leftNameIV1];
    [self.leftNameIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.top.mas_equalTo(self.nameImageView.mas_top).offset(16);
        make.width.mas_offset(18);
        make.height.mas_offset(18);
    }];
    
    self.nameTF = [MyController createTextFieldWithFrame:cell.frame placeholder:@"请输入用户名" passWord:NO leftImageView:nil rightImageView:nil Font:16];
    [cell addSubview:self.nameTF];
    [self.nameTF mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(65);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.nameImageView);
        make.height.mas_offset(52);
    }];
    
    self.PWImageView = [[UIImageView alloc] init];
    [cell addSubview:self.PWImageView];
    self.PWImageView.image = [UIImage imageNamed:@"登录-框"];
    
    [self.PWImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.nameImageView.mas_bottom).offset(2);
        make.height.mas_offset(52);
    }];
    
    self.leftPWIV1 = [[UIImageView alloc] init];
    self.leftPWIV1.image = [UIImage imageNamed:@"登录-2"];
    [cell addSubview:self.leftPWIV1];
    [self.leftPWIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.top.mas_equalTo(self.PWImageView.mas_top).offset(16);
        make.width.mas_offset(18);
        make.height.mas_offset(18);
    }];
    
    self.PWTF = [MyController createTextFieldWithFrame:cell.frame placeholder:@"请输入密码" passWord:YES leftImageView:nil rightImageView:nil Font:16];
    [cell addSubview:self.PWTF];
    [self.PWTF mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(65);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.PWImageView);
        make.height.mas_offset(52);
    }];
    
    self.leftDengluBtn = [MyController createButtonWithFrame:cell.frame ImageName:@"登录-箭头" Target:self Action:@selector(leftDengluBtnClick) Title:nil];
    [cell addSubview:self.leftDengluBtn];
    
    [self.leftDengluBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.PWImageView.mas_bottom).offset(10);
        make.height.mas_offset(50);
        make.width.mas_offset(52);
    }];
    
    self.dengluBtn = [MyController createButtonWithFrame:cell.frame ImageName:nil Target:self Action:@selector(dengluBtnClick) Title:@"登录"];
    [self.dengluBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.dengluBtn setBackgroundColor:[UIColor blackColor]];
    self.dengluBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cell addSubview:self.dengluBtn];
    
    [self.dengluBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftDengluBtn.mas_right);
        make.top.mas_equalTo(self.leftDengluBtn);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(self.leftDengluBtn);
    }];
    
    self.zhucewangjiLable = [[UILabel alloc] init];
    self.zhucewangjiLable.text = @"立即注册  | 忘记密码 ？";
    [cell addSubview:self.zhucewangjiLable];
    self.zhucewangjiLable.textColor = [UIColor whiteColor];
    self.zhucewangjiLable.numberOfLines = 1;
    self.zhucewangjiLable.font = [UIFont systemFontOfSize:12];
    
    [self.zhucewangjiLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.top.mas_equalTo(self.dengluBtn.mas_bottom).offset(13);
        make.height.mas_offset(12);
    }];
    
    self.zhuceBtn = [MyController createButtonWithFrame:cell.frame ImageName:nil Target:self Action:@selector(zhuceBtnClick) Title:nil];
    [cell addSubview:self.zhuceBtn];
    
    [self.zhuceBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(200);
        make.top.mas_equalTo(self.dengluBtn.mas_bottom);
        make.right.mas_equalTo(-65);
        make.height.mas_offset(30);
    }];
    
    self.wangjimimaBtn = [MyController createButtonWithFrame:cell.frame ImageName:nil Target:self Action:@selector(wangjimimaBtnClick) Title:nil];
    [cell addSubview:self.wangjimimaBtn];
    
    [self.wangjimimaBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.zhuceBtn.mas_right);
        make.top.mas_equalTo(self.zhuceBtn);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(self.zhuceBtn);
    }];
    
}
#pragma mark - 左边登录响应
- (void)leftDengluBtnClick{
    NSLog(@"登录1");
    [self rdv_tabBarController].selectedIndex = 0;
    [(AppDelegate *)[UIApplication sharedApplication].delegate setRootVC];
}
#pragma mark - 登录响应
- (void)dengluBtnClick{
    NSLog(@"登录2");
    if (![RegularExpressions validateMobile:self.nameTF.text]) {
        
        [HUD warning:@"请正确输入手机号"];
        return;
    }else if (self.PWTF.text.length < 6){
        
        [HUD warning:@"请输入六位以上密码"];
        return;
    }else{
        [HUD loading];
//        [self createLoginRequest];
        [self testWithUserName:self.nameTF.text AndPassword:self.PWTF.text];
    }
    
}
#pragma mark - 注册响应
- (void)zhuceBtnClick{
    NSLog(@"注册");
}
#pragma mark - 忘记密码响应
- (void)wangjimimaBtnClick{
    NSLog(@"忘记密码");
}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableView.frame.size.height;
}

- (void)testWithUserName:(NSString*)userName AndPassword:(NSString*)password{
    [LoginAndRegistService postLoginWithUsername:userName password:password complate:^(id responseObject) {
//        NSDictionary *infoDic = [UtilityFunc parseJSONStringToNSDictionary:responseObject[@"data"]];
        
        NSDictionary *infoDic = [MyController dictionaryWithJsonString:responseObject[@"data"]];
        LoginDataBaseModel* model = [LoginDataBaseModel mj_objectWithKeyValues:infoDic];
        
        NSString *dataStr = [responseObject objectForKey:@"data"];
        NSDictionary *dic  = [MyController dictionaryWithJsonString:dataStr];

        NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:dic[@"vip"] forKey:@"isVIP"];
        [userDefaults synchronize];
        
        NSUserDefaults* userDefaultsAuthentInfo5 = [NSUserDefaults standardUserDefaults];
        [userDefaultsAuthentInfo5 setObject:dic[@"authentInfo5"] forKey:@"authentInfo5"];
        [userDefaultsAuthentInfo5 synchronize];
        
        [[DBManager shareManager] insertLoginModel:model];
        
        NSLog(@"设备唯一标识：%@",[XRQGetOnlyUUID getUUID]);
        
        [JPUSHService setAlias:model.userName callbackSelector:@selector(callBack) object:nil];
        
        //登录环信
//        [[EMClient sharedClient] loginWithUsername:self.nameTF.text password:self.nameTF.text completion:^(NSString *aUsername, EMError *aError) {
//            if (!aError) {
//                NSLog(@"登陆成功");
//                [[EMClient sharedClient] setApnsNickname:model.nickName];
//            } else {
//                NSLog(@"登陆失败");
//            }
//        }];
        
        [[EMClient sharedClient] loginWithUsername:self.nameTF.text password:self.nameTF.text];
        
        [(AppDelegate *)[UIApplication sharedApplication].delegate setRootVC];
    } failure:^(NSError *error) {
        [HUD error:@"请检查网络"];
    }];
}

@end
