//
//  TitleBarView.h
//  我的app
//
//  Created by 陈荣 on 16/3/19.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleBarView : UIScrollView

@property (nonatomic, strong) NSMutableArray *titleButtons;
@property (nonatomic, strong) UILabel *navLabel;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, copy) void (^titleButtonClicked)(NSUInteger index);

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles;

- (void)setTitleButtonsColor;

@end
