//
//  HXsecondView.m
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "HXsecondView.h"
#import "HXdetailView.h"
@interface HXsecondView ()
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UIButton *deletebtn;
@property (nonatomic, strong)UIButton *onebtn;
@property (nonatomic, strong)UIButton *secbtn;
@property (nonatomic, strong)UIButton *threebtn;
@property (nonatomic, strong)HXdetailView *detailV;

@end

@implementation HXsecondView


- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        self.imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageV.userInteractionEnabled = YES;
        self.imageV.image = [UIImage imageNamed:@"4-户型鉴赏-1楼层/2#楼层平面图.png"];
        [self addSubview:self.imageV];
        //
        self.deletebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.deletebtn.frame = CGRectMake(self.frame.size.width - 80, 50, 40, 40);
        
        [self.deletebtn setImage:[UIImage imageNamed:@"关闭"] forState:(UIControlStateNormal)];
        [self.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.deletebtn];
        //D
        self.onebtn  = [UIButton  buttonWithType:(UIButtonTypeCustom)];
        self.onebtn.frame  = CGRectMake(150, 400, 100, 100);
        
        self.onebtn.tag = 250;
        [self.onebtn addTarget:self action:@selector(onebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.imageV addSubview:self.onebtn];
        //D
        self.secbtn  = [UIButton  buttonWithType:(UIButtonTypeCustom)];
        self.secbtn.frame  = CGRectMake(self.bounds.size.width - 250, 400, 100, 100);
        
        self.secbtn.tag = 251;
        [self.secbtn addTarget:self action:@selector(onebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.imageV addSubview:self.secbtn];
        //A
        self.threebtn  = [UIButton  buttonWithType:(UIButtonTypeCustom)];
        self.threebtn.frame  = CGRectMake(self.bounds.size.width / 2 - 50, 500, 100, 100);
        
        self.threebtn.tag = 252;
        [self.threebtn addTarget:self action:@selector(onebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.imageV addSubview:self.threebtn];
    }
    return self;
}
- (void)onebtnaction:(UIButton *)sender
{
    [self.detailV removeFromSuperview];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
    if (sender.tag == 250) {
        
        self.detailV = [[HXdetailView alloc] initWithFrame:self.bounds backImg:@"4-户型鉴赏-2户型/4-户型鉴赏-2户型D.png" niaokanhide:NO manyouhide:NO niaokanArr:[diffrentArrManager getDniaokan] manyouArr:[diffrentArrManager getDmanyou] isDorA:YES];
        
    } else if (sender.tag == 251){
        self.detailV = [[HXdetailView alloc] initWithFrame:self.bounds backImg:@"4-户型鉴赏-2户型/4-户型鉴赏-2户型D.png" niaokanhide:NO manyouhide:NO niaokanArr:[diffrentArrManager getDniaokan] manyouArr:[diffrentArrManager getDmanyou] isDorA:YES];
       
    } else {
        //
        self.detailV = [[HXdetailView alloc] initWithFrame:self.bounds backImg:@"4-户型鉴赏-2户型/4-户型鉴赏-2户型A.png" niaokanhide:NO manyouhide:YES niaokanArr:[diffrentArrManager getB2niaolan] manyouArr:nil isDorA:NO];
        
    }
    [self addSubview:self.detailV];
    [self bringSubviewToFront:self.detailV];
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