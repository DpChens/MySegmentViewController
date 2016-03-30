//
//  MyNavigationController.m
//  我的app
//
//  Created by 陈荣 on 16/3/19.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import "MyNavigationController.h"
#import "SegmentViewController.h"
#import "UIColor+Util.h"
@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航条颜色
    self.navigationBar.barTintColor
    = [UIColor selectTitleBarColor];
    [[[self.navigationBar subviews]objectAtIndex:0] setAlpha:0.5]; //设置纯透明
    
  
    
    //页面1
    UIViewController *controller1 = [[UIViewController alloc]init];
    controller1.view.backgroundColor = [UIColor yellowColor];
    
    //页面2
    UIViewController *controller2 = [[UIViewController alloc]init];
    controller2.view.backgroundColor = [UIColor greenColor];
    
    //页面2
    UIViewController *controller3 = [[UIViewController alloc]init];
    controller3.view.backgroundColor = [UIColor redColor];
    
    
    SegmentViewController *segment =[[SegmentViewController alloc] initWithTitle:@"滑动页面"andSubTitles:@[@"页面一", @"页面二",@"页面三"]andControllers:@[controller1, controller2,controller3]];
    
    [self pushViewController:segment animated:NO];
}


@end
