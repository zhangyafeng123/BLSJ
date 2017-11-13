//
//  gaikuangRightView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "gaikuangRightView.h"

@interface gaikuangRightView ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIPageControl *pageC;
@property (nonatomic, strong)UIScrollView *scrollV;
@property (nonatomic, strong)UIButton *deletebtn;
@end


@implementation gaikuangRightView

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)imageArr
{
    if ([super initWithFrame:frame]) {
        
        self.scrollV = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollV.delegate  = self;
        self.scrollV.pagingEnabled = YES;
        self.scrollV.contentSize = CGSizeMake(imageArr.count * self.bounds.size.width, self.bounds.size.height);
        [self addSubview:self.scrollV];
        
        for (int i = 0; i < imageArr.count; i++) {
            UIImageView *imagesubV = [[UIImageView alloc] initWithFrame:CGRectMake(i * frame.size.width, 0, frame.size.width, frame.size.height)];
            imagesubV.userInteractionEnabled= YES;
            imagesubV.image = [UIImage imageNamed:imageArr[i]];
            [_scrollV addSubview:imagesubV];
        }
        self.pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(frame.size.width/2 - 50, 70, 100, 20)];
        self.pageC.numberOfPages = imageArr.count;
//        [self.pageC setValue:[UIImage imageNamed:@"滑动2"] forKeyPath:@"_pageImage"];
//
//        [self.pageC setValue:[UIImage imageNamed:@"滑动1"] forKeyPath:@"_currentPageImage"];
        self.pageC.currentPageIndicatorTintColor =  [UIColor colorWithRed:226.0/255 green:194.0/255 blue:128.0/255 alpha:1];
        self.pageC.pageIndicatorTintColor = [UIColor blackColor];
        [self addSubview:self.pageC];
        [self bringSubviewToFront:self.pageC];
        self.deletebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.deletebtn.frame = CGRectMake(self.frame.size.width - 80, 50, 40, 40);
        [self.deletebtn setImage:[UIImage imageNamed:@"关闭"] forState:(UIControlStateNormal)];
        [self.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.deletebtn];
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.x;
    NSInteger i = y / scrollView.frame.size.width;
    self.pageC.currentPage = i;
    
}

- (void)deletebtnaction:(UIButton *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(deleteRigthBtnactionMethod)]) {
        [self.delegate deleteRigthBtnactionMethod];
    }
    
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
    [self removeFromSuperview];
}

#pragma CATransition动画实现
- (void) transitionWithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    int value = (arc4random() % 6) + 1;
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = 0.7;
    
    //设置运动type
    if (value==1) {
        animation.type = @"cube";
    }
    if (value==2) {
        animation.type = @"fade";
    }
    if (value==3) {
        animation.type = @"oglFlip";
    }
    if (value==5) {
        animation.type = @"rippleEffect";
    }
    if (value==4) {
        animation.type = @"pageCurl";
    }
    if (value==6) {
        animation.type = @"suckEffect";
    }
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}


@end
