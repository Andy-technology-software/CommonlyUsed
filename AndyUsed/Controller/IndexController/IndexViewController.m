//
//  IndexViewController.m
//  AndyNewFram
//
//  Created by lingnet on 2017/4/24.
//  Copyright © 2017年 xurenqinag. All rights reserved.
//

#import "IndexViewController.h"

#import "LoginAndRegistService.h"

#import "IndexModel.h"

#import "IndexViewTableViewCell.h"
@interface IndexViewController ()<UITableViewDataSource,UITableViewDelegate,IndexViewCellDelegate,MWPhotoBrowserDelegate>{
    UITableView* _tableView;
}
@property (strong, nonatomic) UINavigationController *photoNavigationController;
@property (strong, nonatomic) MWPhotoBrowser *photoBrowser;
@property (strong, nonatomic) UIWindow *keyWindow;
@property(nonatomic,retain)NSMutableArray* photos;

@property(nonatomic,retain)NSMutableArray* picturesArr;
@property(nonatomic,retain)NSMutableArray* picturesArr1;


@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.picturesArr = [[NSMutableArray alloc] init];
    self.picturesArr1 = [[NSMutableArray alloc] init];
    self.photos = [[NSMutableArray alloc] init];
    
    [self createTableView];
    [self getIndexBannder];
}

- (void)viewWillAppear:(BOOL)animated{

}

- (void)getIndexBannder {
    [LoginAndRegistService getIndexBannersListsWithComplate:^(id responseObject) {
        NSDictionary* sourceDic = [MyController dictionaryWithJsonString:[responseObject objectForKey:@"data"]];
        NSArray* aa = sourceDic[@"ad"];
        self.picturesArr = [IndexModel mj_objectArrayWithKeyValuesArray:sourceDic[@"ad"]];
        for (IndexModel* M in self.picturesArr) {
            NSLog(@"----%@",M.img);
            [self.picturesArr1 addObject:M.img];
            [self.photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", M.img]]]];
        }
        [_tableView reloadData];
    } failure:^(NSError *error) {
        [HUD warning:@"请求出错"];
    }];
}

#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:nil];
    tableBg.backgroundColor = [UIColor colorWithRed:219/255.0 green:225/255.0 blue:230/255.0 alpha:1];
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
    static NSString *cellIdentifier = @"CellIdentifier";
    IndexViewTableViewCell* cell0 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell0) {
        cell0 = [[IndexViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell0.IndexViewCellDelegate = self;
    cell0.picArr = [[NSMutableArray alloc] initWithArray:self.picturesArr1];
    IndexModel* model = nil;
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell0 configCellWithModel:model];
    
    return cell0;

}
#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MyController getScreenWidth] * 43/72;
}

- (void)didselectADPic:(NSInteger)index{
    [_photoBrowser setCurrentPhotoIndex:index];
    UIViewController *rootController = [self.keyWindow rootViewController];
    [rootController presentViewController:self.photoNavigationController animated:YES completion:nil];
}

#pragma mark - getter 创建一个显示图片的window
- (UIWindow *)keyWindow{
    if(_keyWindow == nil){
        _keyWindow = [[UIApplication sharedApplication] keyWindow];
    }
    return _keyWindow;
}
#pragma mark - 初始化MWPhotoBrowser
- (MWPhotoBrowser *)photoBrowser{
    if (_photoBrowser == nil) {
        _photoBrowser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        _photoBrowser.displayActionButton = YES;
        _photoBrowser.displayNavArrows = YES;
        _photoBrowser.displaySelectionButtons = NO;
        _photoBrowser.alwaysShowControls = NO;
        _photoBrowser.wantsFullScreenLayout = YES;
        _photoBrowser.zoomPhotosToFill = YES;
        _photoBrowser.enableGrid = NO;
        _photoBrowser.startOnGrid = NO;
    }
    return _photoBrowser;
}

- (UINavigationController *)photoNavigationController{
    if (_photoNavigationController == nil) {
        _photoNavigationController = [[UINavigationController alloc] initWithRootViewController:self.photoBrowser];
        _photoNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    [self.photoBrowser reloadData];
    return _photoNavigationController;
}

#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return [self.photos count];
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    if (index < self.photos.count){
        return [self.photos objectAtIndex:index];
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
