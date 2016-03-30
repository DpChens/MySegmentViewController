//
//  UIColor+Util.h
//  我的app
//
//  Created by 陈荣 on 16/3/24.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#define TOP_VIEW_HEIGHT 46 //界面上方导航线条的宽度
#define SEGMENT_LINE_HEIGHT 4  //底部划线的高度

#import <UIKit/UIKit.h>


@interface UIColor (Util)
+(UIColor *)themeColor;  //主题颜色
+(UIColor *)titleBarColor; //多界面滑动字体颜色
+(UIColor *)selectTitleBarColor;//多界面滑动字体颜色 选中时
+(UIColor *)selectTitleBarAlphe;//多界面滑动字体颜色 选中时 透明

@end
