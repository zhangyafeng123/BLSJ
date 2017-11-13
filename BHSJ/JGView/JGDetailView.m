//
//  JGDetailView.m
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "JGDetailView.h"
#import "ZWSpinImageView.h"

@interface JGDetailView ()<ZWSpinImageViewDelegate>

@property (nonatomic, strong)ZWSpinImageView *spinIV;

@end

@implementation JGDetailView


- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)arr ismy:(BOOL)ismy
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        if (ismy == YES) {
            self.spinIV = [[ZWSpinImageView alloc] initWithFrame:self.bounds];
            self.spinIV.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            self.spinIV.imagesArray = arr;
            self.spinIV.delegate = self;
            //xunhuan
            self.spinIV.isRepeat = YES;
            
            [self addSubview:self.spinIV];
            
            [self.spinIV autoMoveForward];
        } else {
            JAPanoView *panoView=[[JAPanoView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
            [self addSubview:panoView];
            
            panoView.delegate=self;
            [panoView setFrontImage:[UIImage imageNamed:arr[0]] rightImage:[UIImage imageNamed:arr[1]] backImage:[UIImage imageNamed:arr[2]] leftImage:[UIImage imageNamed:arr[3]] topImage:[UIImage imageNamed:arr[4]] bottomImage:[UIImage imageNamed:arr[5]]];
        }
        
        
        UIButton *deletebtn =[UIButton buttonWithType:(UIButtonTypeCustom)];
        deletebtn.frame = CGRectMake(self.frame.size.width - 80, 50, 40, 40);
        [deletebtn setImage:[UIImage imageNamed:@"关闭"] forState:(UIControlStateNormal)];
        [deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:deletebtn];
        
    }
    return self;
}
- (void)dealloc {
    
    [self removeSpinImageView];
}
//销毁视图
- (void)removeSpinImageView {
    [self.spinIV removeFromSuperview];
    self.spinIV = nil;
}
- (void)deletebtnaction:(UIButton *)sender
{
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
