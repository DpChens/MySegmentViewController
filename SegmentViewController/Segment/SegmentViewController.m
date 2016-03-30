//
//  SegmentViewController.m
//  我的app
//
//  Created by 陈荣 on 16/3/29.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import "SegmentViewController.h"
#import "UIColor+Util.h"
@interface SegmentViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *controllers;

- (instancetype)initWithTitle:(NSString *)title andSubTitles:(NSArray *)subTitles andControllers:(NSArray *)controllers underTabbar:(BOOL)underTabbar;
@end


@implementation SegmentViewController
- (instancetype)initWithTitle:(NSString *)title andSubTitles:(NSArray *)subTitles andControllers:(NSArray *)controllers
{
    return [self initWithTitle:title andSubTitles:subTitles andControllers:controllers underTabbar:NO];
}

- (instancetype)initWithTitle:(NSString *)title andSubTitles:(NSArray *)subTitles andControllers:(NSArray *)controllers underTabbar:(BOOL)underTabbar
{
    self = [super init];
    if (self) {
        if (underTabbar == NO) {
            self.edgesForExtendedLayout = UIRectEdgeNone;//scrollView视图不延伸整个屏幕
        }
        
        
        if (title) {self.title = title;}
        
        CGFloat titleBarHeight = TOP_VIEW_HEIGHT;
        _titleBar = [[TitleBarView alloc] initWithFrame:CGRectMake(0, 0 +(underTabbar ? 51 : 0), self.view.bounds.size.width, titleBarHeight) andTitles:subTitles];
        _titleBar.backgroundColor = [UIColor themeColor];
        [self.view addSubview:_titleBar];
        
        
        _viewPager = [[HorizonalCollectionViewController alloc] initWithViewControllers:controllers];
        
        CGFloat height = self.view.bounds.size.height - (underTabbar ? 0 : titleBarHeight) ;
        _viewPager.view.frame = CGRectMake(0, (underTabbar ? 0 : titleBarHeight), self.view.bounds.size.width, height);
        
        [self addChildViewController:self.viewPager];
        [self.view addSubview:_viewPager.view];
        [self.view sendSubviewToBack:_viewPager.view];
        
        
        
        
        
        __weak TitleBarView *weakTitleBar = _titleBar;
        __weak HorizonalCollectionViewController *weakViewPager = _viewPager;
        
        _viewPager.changeIndex = ^(NSUInteger index) {
            weakTitleBar.currentIndex = index;
            for (UIButton *button in weakTitleBar.titleButtons) {
                if (button.tag != index) {
                    [button setTitleColor:[UIColor titleBarColor] forState:UIControlStateNormal];
                    button.transform = CGAffineTransformIdentity;
                } else {
                    [button setTitleColor:[UIColor selectTitleBarColor] forState:UIControlStateNormal];
                    button.transform = CGAffineTransformMakeScale(1.2, 1.2);
                }
            }
            
        };
        //滑动时移动直线条
        _viewPager.viewDidScroll = ^()
        {
            CGPoint offset = weakViewPager.collectionView.contentOffset;
            CGFloat x = offset.x/weakViewPager.controllers.count;
            
            if (x > 0 && x < weakViewPager.collectionView.frame.size.width)
            {
                CGRect frame = weakTitleBar.navLabel.frame;
                frame.origin.x = x + frame.size.width/2;//修正居中显示
                weakTitleBar.navLabel.frame = frame;
            }
        };
        
        
        _titleBar.titleButtonClicked = ^(NSUInteger index) {
            [weakViewPager scrollToViewAtIndex:index];
            
            //            多此一举  scroll在滑动的时候 线会自动动
            //            [UIView animateWithDuration:0.25 animations:^{
            //                 weakTitleBar.navLabel.frame = frame;
            //            }];
            
        };
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}



@end

