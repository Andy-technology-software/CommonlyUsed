//
//  EChartViewController.m
//  AndyNewFram
//
//  Created by lingnet on 2017/4/28.
//  Copyright © 2017年 xurenqinag. All rights reserved.
//

#import "EChartViewController.h"

@interface EChartViewController ()<EColumnChartDelegate, EColumnChartDataSource>
@property (strong, nonatomic) EColumnChart *eColumnChart;
@property (nonatomic, strong) NSArray *data;

@end

@implementation EChartViewController

- (void)viewWillAppear:(BOOL)animated{
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeData];
    
    [self makeView];
}

- (void)makeData{
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 50; i > 0; i--){
        int value = arc4random() % 100;
        EColumnDataModel *eColumnDataModel = [[EColumnDataModel alloc] initWithLabel:[NSString stringWithFormat:@"%d", i] value:value index:i unit:@"kWh"];
        [temp addObject:eColumnDataModel];
    }
    _data = [NSArray arrayWithArray:temp];
}

- (void)makeView{
    _eColumnChart = [[EColumnChart alloc] initWithFrame:CGRectMake(40, 100, 250, 200)];
    [_eColumnChart setDelegate:self];
    [_eColumnChart setDataSource:self];
    
    [self.view addSubview:_eColumnChart];
    
    UIButton* lefB = [MyController createButtonWithFrame:CGRectMake(10, CGRectGetMaxY(_eColumnChart.frame) + 20, 60, 40) ImageName:nil Target:self Action:@selector(lefBClick) Title:@"左滑"];
    [lefB setBackgroundColor:[UIColor greenColor]];
    [lefB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:lefB];
    
    UIButton* rightB = [MyController createButtonWithFrame:CGRectMake([MyController getScreenWidth] - 10 - 60, CGRectGetMaxY(_eColumnChart.frame) + 20, 60, 40) ImageName:nil Target:self Action:@selector(rightBClick) Title:@"右滑"];
    [rightB setBackgroundColor:[UIColor greenColor]];
    [rightB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:rightB];
}

- (void)lefBClick{
    if (self.eColumnChart == nil) return;
    [self.eColumnChart moveLeft];
}

- (void)rightBClick{
    if (self.eColumnChart == nil) return;
    [self.eColumnChart moveRight];
}

#pragma -mark- EColumnChartDataSource

- (NSInteger)numberOfColumnsInEColumnChart:(EColumnChart *)eColumnChart{
    return [_data count];
}

- (NSInteger)numberOfColumnsPresentedEveryTime:(EColumnChart *)eColumnChart{
    return 7;
}

- (EColumnDataModel *)highestValueEColumnChart:(EColumnChart *)eColumnChart{
    EColumnDataModel *maxDataModel = nil;
    float maxValue = -FLT_MIN;
    for (EColumnDataModel *dataModel in _data)
    {
        if (dataModel.value > maxValue)
        {
            maxValue = dataModel.value;
            maxDataModel = dataModel;
        }
    }
    return maxDataModel;
}

- (EColumnDataModel *)eColumnChart:(EColumnChart *)eColumnChart valueForIndex:(NSInteger)index{
    if (index >= [_data count] || index < 0) return nil;
    return [_data objectAtIndex:index];
}


#pragma -mark- EColumnChartDelegate
- (void)eColumnChart:(EColumnChart *)eColumnChart
     didSelectColumn:(EColumn *)eColumn{
    NSLog(@"Index: %d  Value: %f", eColumn.eColumnDataModel.index, eColumn.eColumnDataModel.value);
    

}

- (void)eColumnChart:(EColumnChart *)eColumnChart
fingerDidEnterColumn:(EColumn *)eColumn{
    /**The EFloatBox here, is just to show an example of
     taking adventage of the event handling system of the Echart.
     You can do even better effects here, according to your needs.*/
    NSLog(@"Finger did enter %d", eColumn.eColumnDataModel.index);
    CGFloat eFloatBoxX = eColumn.frame.origin.x + eColumn.frame.size.width * 1.25;
    CGFloat eFloatBoxY = eColumn.frame.origin.y + eColumn.frame.size.height * (1-eColumn.grade);
    
}

- (void)eColumnChart:(EColumnChart *)eColumnChart
fingerDidLeaveColumn:(EColumn *)eColumn{
    NSLog(@"Finger did leave %d", eColumn.eColumnDataModel.index);
    
}

- (void)fingerDidLeaveEColumnChart:(EColumnChart *)eColumnChart{
    
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
