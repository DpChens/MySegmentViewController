# MySegmentViewController
3个类一句话实现iOS中的分页控制器，使用block回调，逻辑清晰  觉得不错就给个star

>1.效果图


 ![image](https://github.com/DpChens/MySegmentViewController/raw/master/gif/yy.gif)

>2.用法

```
SegmentViewController *segment =[[SegmentViewController alloc] initWithTitle:@"滑动页面"andSubTitles:@[@"页面一", @"页面二",@"页面三"]andControllers:@[controller1, controller2,controller3]];
```



> 辅助功能  在UIColor+Util.h可以设置颜色，粗细


```
#define TOP_VIEW_HEIGHT 46 //界面上方导航线条的宽度
#define SEGMENT_LINE_HEIGHT 4  //底部划线的高度
@interface UIColor (Util)
+(UIColor *)themeColor;  //主题颜色－ 导航条颜色
+(UIColor *)titleBarColor; //多界面滑动字体颜色
+(UIColor *)selectTitleBarColor;//多界面滑动字体颜色 选中时

```
