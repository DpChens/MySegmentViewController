//
//  HorizonalCollectionViewController.m
//  我的app
//
//  Created by 陈荣 on 16/3/29.
//  Copyright © 2016年 陈荣. All rights reserved.
//

#import "HorizonalCollectionViewController.h"
@interface HorizonalCollectionViewController()

@end
static NSString *ID = @"HorizonalCell";

@implementation HorizonalCollectionViewController

- (instancetype)initWithViewControllers:(NSArray *)controllers
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
//    // 设置cell的尺寸
//    layout.itemSize = [UIScreen mainScreen].bounds.size;
    // 清空行距
    layout.minimumLineSpacing = 0;
    
    // 设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _controllers = [NSMutableArray arrayWithArray:controllers];
        for (UIViewController *controller in controllers) {
            [self addChildViewController:controller];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.scrollEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}


#pragma mark - UICollectionViewDataSource && UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _controllers.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // dequeueReusableCellWithReuseIdentifier
    // 1.首先从缓存池里取cell
    // 2.看下当前是否有注册Cell,如果注册了cell，就会帮你创建cell
    // 3.没有注册，报错
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
   UIViewController  *indexController = _controllers[indexPath.row];
     indexController.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:indexController.view];
    return cell;
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollStop:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_viewDidScroll) {
        _viewDidScroll();
    }
}

- (void)scrollToViewAtIndex:(NSUInteger)index
{
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    _currentIndex = index;
}

- (void)scrollStop:(BOOL)didScrollStop
{
    CGFloat horizonalOffset = self.collectionView.contentOffset.x;
    CGFloat screenWidth = self.collectionView.frame.size.width;

    NSUInteger focusIndex = (horizonalOffset + screenWidth / 2) / screenWidth;
    if (didScrollStop) {
        _currentIndex = focusIndex;
        if (_changeIndex) {_changeIndex(focusIndex);}
    }
}



@end
