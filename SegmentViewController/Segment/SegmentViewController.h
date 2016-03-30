//
//  SegmentViewController.h
//  我的app
//
//  Created by 陈荣 on 16/3/29.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleBarView.h"
#import "HorizonalCollectionViewController.h"
@interface SegmentViewController : UIViewController
@property (nonatomic, strong) HorizonalCollectionViewController *viewPager;
@property (nonatomic, strong) TitleBarView *titleBar;
- (instancetype)initWithTitle:(NSString *)title andSubTitles:(NSArray *)subTitles andControllers:(NSArray *)controllers;
@end
