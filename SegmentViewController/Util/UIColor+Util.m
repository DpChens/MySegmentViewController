//
//  UIColor+Util.m
//  我的app
//
//  Created by 陈荣 on 16/3/24.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)
+(UIColor *)themeColor
{
    return [UIColor colorWithRed:245.0/255 green:245.0/255 blue:249.0/255 alpha:0.5];
    
}

+(UIColor *)titleBarColor
{
    return [UIColor colorWithRed:149.0/255 green:149.0/255 blue:149.0/255 alpha:0.5];
    
}
+(UIColor *)selectTitleBarColor
{
    return [UIColor colorWithRed:58.0/255 green:178.0/255 blue:137.0/255 alpha:1.0];
    
}
+(UIColor *)selectTitleBarAlphe
{
    return [UIColor colorWithRed:58.0/255 green:178.0/255 blue:137.0/255 alpha:0.5];
}

@end
