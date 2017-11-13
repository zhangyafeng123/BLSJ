//
//  giakuangLeftView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "giakuangLeftView.h"

@interface giakuangLeftView  ()

@property (nonatomic, strong)UIImageView *leftbackimg;
@property (nonatomic, strong)UIButton *deletebtn;
//@property (nonatomic, strong)UIImageView *leftimg;
@property (nonatomic, strong)UIImageView *backimg;

@end

@implementation giakuangLeftView


- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.backimg = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backimg.image = [UIImage imageNamed:@"1-项目概况-1项目简介"];
        [self addSubview:self.backimg];
        
//        self.leftbackimg = [[UIImageView alloc] initWithFrame:CGRectMake(80, 160, 280, 400)];
//        self.leftbackimg.backgroundColor = [UIColor clearColor];
//        self.leftbackimg.image = [UIImage imageNamed:@"内容"];
//        [self addSubview:self.leftbackimg];
        //
        self.deletebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.deletebtn.frame = CGRectMake(self.frame.size.width - 80, 50, 40, 40);
        [self.deletebtn setImage:[UIImage imageNamed:@"关闭"] forState:(UIControlStateNormal)];
        [self.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.deletebtn];
    }
    return self;
}

- (void)deletebtnaction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(deleteactionforLeft)]) {
        [self.delegate deleteactionforLeft];
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
