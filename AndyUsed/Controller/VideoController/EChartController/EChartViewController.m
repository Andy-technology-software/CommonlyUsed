//
//  EChartViewController.m
//  AndyNewFram
//
//  Created by lingnet on 2017/4/28.
//  Copyright © 2017年 xurenqinag. All rights reserved.
//

#import "EChartViewController.h"
#import "EColumnDataModel.h"
#import "EFloatBox.h"
#import "EColor.h"
#include <stdlib.h>

@interface EChartViewController ()<EColumnChartDelegate, EColumnChartDataSource>
@property (strong, nonatomic) EColumnChart *eColumnChart;
@property (nonatomic, strong) NSArray *data;

@property (nonatomic, strong) UILabel *textLable;
@property (nonatomic, strong) EFloatBox *eFloatBox;
@property (nonatomic, strong) EColumn *eColumnSelected;
@property (nonatomic, strong) UIColor *tempColor;
@end

@implementation EChartViewController
@synthesize tempColor = _tempColor;
@synthesize eFloatBox = _eFloatBox;
@synthesize eColumnChart = _eColumnChart;
@synthesize data = _data;
@synthesize eColumnSelected = _eColumnSelected;

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
        EColumnDataModel *eColumnDataModel = [[EColumnDataModel alloc] initWithLabel:[NSString stringWithFormat:@"%d", i] value:value index:i unit:@"万元"];
        [temp addObject:eColumnDataModel];
    }
    _data = [NSArray arrayWithArray:temp];
}

- (void)makeView{
    _textLable = [MyController createLabelWithFrame:CGRectMake(0, 40, [MyController getScreenWidth], 60) Font:20 Text:nil];
    _textLable.textAlignment = NSTextAlignmentCenter;
    _textLable.textColor = [UIColor brownColor];
    [self.view addSubview:_textLable];
    
    _eColumnChart = [[EColumnChart alloc] initWithFrame:CGRectMake(40, 100, 250, 200)];
    [_eColumnChart setDelegate:self];
    [_eColumnChart setDataSource:self];
    [_eColumnChart setShowHighAndLowColumnWithColor:YES];//高亮
    
    [_eColumnChart setColumnsIndexStartFromLeft:YES];
    
    
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
    if (_eColumnSelected)
    {
        _eColumnSelected.barColor = _tempColor;
    }
    _eColumnSelected = eColumn;
    _tempColor = eColumn.barColor;
    eColumn.barColor = [UIColor blackColor];
    
    _textLable.text = [NSString stringWithFormat:@"总额：%.1f",eColumn.eColumnDataModel.value];

}

- (void)eColumnChart:(EColumnChart *)eColumnChart
fingerDidEnterColumn:(EColumn *)eColumn{
    /**The EFloatBox here, is just to show an example of
     taking adventage of the event handling system of the Echart.
     You can do even better effects here, according to your needs.*/
    NSLog(@"Finger did enter %d", eColumn.eColumnDataModel.index);
    _textLable.text = [NSString stringWithFormat:@"总额：%.1f万元",eColumn.eColumnDataModel.value];
    
    CGFloat eFloatBoxX = eColumn.frame.origin.x + eColumn.frame.size.width * 1.25;
    CGFloat eFloatBoxY = eColumn.frame.origin.y + eColumn.frame.size.height * (1-eColumn.grade);
    if (_eFloatBox)
    {
        [_eFloatBox removeFromSuperview];
        _eFloatBox.frame = CGRectMake(eFloatBoxX, eFloatBoxY, _eFloatBox.frame.size.width, _eFloatBox.frame.size.height);
        [_eFloatBox setValue:eColumn.eColumnDataModel.value];
        [eColumnChart addSubview:_eFloatBox];
    }
    else
    {
        _eFloatBox = [[EFloatBox alloc] initWithPosition:CGPointMake(eFloatBoxX, eFloatBoxY) value:eColumn.eColumnDataModel.value unit:@"万元" title:@"总额"];
        _eFloatBox.alpha = 0.0;
        [eColumnChart addSubview:_eFloatBox];
    }
    eFloatBoxY -= (_eFloatBox.frame.size.height + eColumn.frame.size.width * 0.25);
    _eFloatBox.frame = CGRectMake(eFloatBoxX, eFloatBoxY, _eFloatBox.frame.size.width, _eFloatBox.frame.size.height);
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        _eFloatBox.alpha = 1.0;
        
    } completion:^(BOOL finished) {
    }];
    
}

- (void)eColumnChart:(EColumnChart *)eColumnChart
fingerDidLeaveColumn:(EColumn *)eColumn{
    NSLog(@"Finger did leave %d", eColumn.eColumnDataModel.index);
    
}

- (void)fingerDidLeaveEColumnChart:(EColumnChart *)eColumnChart{
    if (_eFloatBox)
    {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
            _eFloatBox.alpha = 0.0;
            _eFloatBox.frame = CGRectMake(_eFloatBox.frame.origin.x, _eFloatBox.frame.origin.y + _eFloatBox.frame.size.height, _eFloatBox.frame.size.width, _eFloatBox.frame.size.height);
        } completion:^(BOOL finished) {
            [_eFloatBox removeFromSuperview];
            _eFloatBox = nil;
        }];
        
    }
    
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
