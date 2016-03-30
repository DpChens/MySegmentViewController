//
//  TitleBarView.m
//  我的app
//
//  Created by 陈荣 on 16/3/19.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import "TitleBarView.h"
#import "UIColor+Util.h"


@interface TitleBarView ()

@end

@implementation TitleBarView

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _currentIndex = 0;
        _titleButtons = [NSMutableArray new];
        
        CGFloat buttonWidth = frame.size.width / titles.count;
        CGFloat buttonHeight = frame.size.height;
        
        [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor themeColor];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor titleBarColor] forState:UIControlStateNormal];
            [button setTitle:title forState:UIControlStateNormal];
            
            button.frame = CGRectMake(buttonWidth * idx, 0, buttonWidth, buttonHeight);
            button.tag = idx;
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_titleButtons addObject:button];
            [self addSubview:button];
            [self sendSubviewToBack:button];
        }];
        
        //添加lable条
        _navLabel = [[UILabel alloc] initWithFrame:CGRectMake(buttonWidth/4, TOP_VIEW_HEIGHT - SEGMENT_LINE_HEIGHT, buttonWidth/2, SEGMENT_LINE_HEIGHT)];
        _navLabel.backgroundColor = [UIColor selectTitleBarColor];
        [self addSubview:_navLabel];
    
        //
        self.contentSize = CGSizeMake(frame.size.width, TOP_VIEW_HEIGHT);
        self.showsHorizontalScrollIndicator = NO;
        UIButton *firstTitle = _titleButtons[0];
        [firstTitle setTitleColor:[UIColor selectTitleBarColor] forState:UIControlStateNormal];
        firstTitle.transform = CGAffineTransformMakeScale(1.15, 1.15);
    }
    
    return self;
}


- (void)onClick:(UIButton *)button
{
    if (_currentIndex != button.tag) {
        UIButton *preTitle = _titleButtons[_currentIndex];
        
        [preTitle setTitleColor:[UIColor titleBarColor] forState:UIControlStateNormal];
        preTitle.transform = CGAffineTransformIdentity;
        
        [button setTitleColor:[UIColor selectTitleBarColor] forState:UIControlStateNormal];
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        _currentIndex = button.tag;
        _titleButtonClicked(button.tag);
    }
}

- (void)setTitleButtonsColor
{
    for (UIButton *button in self.subviews) {
        button.backgroundColor = [UIColor themeColor];
    }
}

@end
