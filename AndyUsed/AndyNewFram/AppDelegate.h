//
//  AppDelegate.h
//  AndyNewFram
//
//  Created by lingnet on 2017/4/7.
//  Copyright © 2017年 xurenqinag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIViewController *viewController;
- (void)setRootVC;
- (void)setLoginRoot;

@end

