//
//  HorizonalCollectionViewController.h
//  我的app
//
//  Created by 陈荣 on 16/3/29.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizonalCollectionViewController : UICollectionViewController
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, copy) void (^changeIndex)(NSUInteger index);
@property (nonatomic, copy) void (^viewDidScroll)();

- (instancetype)initWithViewControllers:(NSArray *)controllers;

- (void)scrollToViewAtIndex:(NSUInteger)index;
@end
