//
//  quweiDeitailView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "quweiDeitailView.h"


@interface quweiDeitailView ()
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UIButton *deletebtn;
@property (nonatomic, strong)UIButton *topBtn;
@property (nonatomic, strong)UIButton *firstBtn;
@property (nonatomic, strong)UIButton *secondBtn;
@property (nonatomic, strong)UIButton *threeBtn;
@end

@implementation quweiDeitailView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.imageV= [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageV.image = [UIImage imageNamed:@"bjother"];
        [self addSubview:self.imageV];
        self.deletebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.deletebtn.frame = CGRectMake(self.frame.size.width - 80, 50, 40, 40);
        [self.deletebtn setImage:[UIImage imageNamed:@"关闭"] forState:(UIControlStateNormal)];
        [self.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.deletebtn];
        
        
        self.topBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.topBtn.frame = CGRectMake(self.bounds.size.width - 100, self.bounds.size.height - 400, 60, 60);
        self.topBtn.tag = 149;
        [self.topBtn setImage:[UIImage imageNamed:@"商业配套"] forState:(UIControlStateNormal)];
        [self.topBtn setImage:[UIImage imageNamed:@"商业配套点亮"] forState:(UIControlStateSelected)];
        [self.topBtn addTarget:self action:@selector(firstBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.topBtn];
        
        self.firstBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.firstBtn.frame = CGRectMake(self.bounds.size.width - 100, self.bounds.size.height - 300, 60, 60);
         self.firstBtn.tag = 150;
        [self.firstBtn setImage:[UIImage imageNamed:@"教育配套"] forState:(UIControlStateNormal)];
        [self.firstBtn setImage:[UIImage imageNamed:@"教育配套点亮"] forState:(UIControlStateSelected)];
        [self.firstBtn addTarget:self action:@selector(firstBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.firstBtn];
        
        self.secondBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.secondBtn.frame = CGRectMake(self.bounds.size.width - 100, self.bounds.size.height - 200, 60, 60);
        self.secondBtn.tag = 151;
        [self.secondBtn setImage:[UIImage imageNamed:@"医疗配套"] forState:(UIControlStateNormal)];
        [self.secondBtn setImage:[UIImage imageNamed:@"医疗配套点亮"] forState:(UIControlStateSelected)];
        [self.secondBtn addTarget:self action:@selector(firstBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.secondBtn];
        
        self.threeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.threeBtn.frame = CGRectMake(self.bounds.size.width - 100, self.bounds.size.height - 100, 60, 60);
        self.threeBtn.tag = 152;
        [self.threeBtn setImage:[UIImage imageNamed:@"行政配套"] forState:(UIControlStateNormal)];
        [self.threeBtn setImage:[UIImage imageNamed:@"行政配套点亮"] forState:(UIControlStateSelected)];
        [self.threeBtn addTarget:self action:@selector(firstBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.threeBtn];
        
    }
    return self;
}

- (void)firstBtnAction:(UIButton *)sender
{
    if (sender.tag == 149) {
        self.imageV.image = [UIImage imageNamed:@"商业热点"];
        self.topBtn.selected = YES;
        self.firstBtn.selected = NO;
        self.secondBtn.selected = NO;
        self.threeBtn.selected = NO;
    } else if (sender.tag == 150) {
        self.imageV.image = [UIImage imageNamed:@"教育热点"];
        self.topBtn.selected = NO;
        self.firstBtn.selected = YES;
        self.secondBtn.selected = NO;
        self.threeBtn.selected = NO;
    } else if (sender.tag == 151){
         self.imageV.image = [UIImage imageNamed:@"医疗热点"];
        self.topBtn.selected = NO;
        self.firstBtn.selected = NO;
        self.secondBtn.selected = YES;
        self.threeBtn.selected = NO;
    } else {
         self.imageV.image = [UIImage imageNamed:@"行政热点"];
        self.topBtn.selected = NO;
        self.firstBtn.selected = NO;
        self.secondBtn.selected = NO;
        self.threeBtn.selected = YES;
    }
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
