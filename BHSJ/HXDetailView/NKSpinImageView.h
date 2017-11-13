//
//  NKSpinImageView.h
//  BHSJ
//
//  Created by linjianguo on 2017/10/17.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NKSpinImageView;
@protocol ZWSpinImageViewDelegate <NSObject>

@optional

- (void)spinImageView:(NKSpinImageView *)view didSelectAtIndex:(NSInteger)index;
- (void)spinImageViewBeginLoadData:(NKSpinImageView *)view;
- (void)spinImageViewEndLoadData:(NKSpinImageView *)view;
- (void)spinImageViewFailedLoadData:(NKSpinImageView *)view;

@end

@protocol ZWSpinImageViewDatasource <NSObject>

- (UIImage *)spinImageView:(NKSpinImageView *)view imageAtIndex:(NSInteger)index;


@optional

- (NSInteger)numberOfViewsInspinImageView:(NKSpinImageView *)spinImageView;

@end
@interface NKSpinImageView : UIView

@property (nonatomic, weak) id<ZWSpinImageViewDelegate>             delegate;
@property (nonatomic, weak) id<ZWSpinImageViewDatasource>           dataSource;

@property (nonatomic, readonly) UIImageView                     *   imageView;

@property (nonatomic, strong)   NSArray                         *   imagesArray;    //数据源（图片本地路径数组）
@property (nonatomic, readonly) UIImage                         *   currentImage;   //当前显示的图片
@property (nonatomic, assign)   NSInteger                           currentIndex;   //当前下标
@property (nonatomic, assign)   double                              panDistance;    //手势大小
@property (nonatomic, assign)   double                              timeInterval;   //(相当于旋转速度 0-1 之间)

@property (nonatomic, assign)   BOOL                                isRepeat;       //是否重复（循环）



//刷新数据
- (void)reloadData;

//向前移动
- (void)moveForward;

//向后移动
- (void)moveBack;

//自动前进
- (void)autoMoveForward;

//自动后退
- (void)autoMoveBack;

//停止移动
- (void)stopMove;

@end
