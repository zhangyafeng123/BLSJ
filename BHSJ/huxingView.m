//
//  huxingView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "huxingView.h"
#import "HXsecondView.h"
#import "HXthreeView.h"
#import "HXfourView.h"
#import "HXfiveView.h"
#import "HXsixView.h"
@interface huxingView ()

@property (nonatomic, strong)UIButton *secondBtn;
@property (nonatomic, strong)UIButton *threeBtn;
@property (nonatomic, strong)UIButton *fourBtn;
@property (nonatomic, strong)UIButton *fiveBtn;
@property (nonatomic, strong)UIButton *sixBtn;
@property (nonatomic, strong)UIImageView *backImg;

@property (nonatomic, strong)HXsecondView *HXsec;
@property (nonatomic, strong)HXthreeView *HXthree;
@property (nonatomic, strong)HXfourView *HXfour;
@property (nonatomic, strong)HXfiveView *HXfive;
@property (nonatomic, strong)HXsixView *HXsix;

@end

@implementation huxingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backImg = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backImg.image = [UIImage imageNamed:@"first"];
        [self addSubview:self.backImg];
        //2
        self.secondBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.secondBtn.frame = CGRectMake(self.bounds.size.width - 395, 130, 27, 40);
        self.secondBtn.tag = 200;
        [self.secondBtn setImage:[UIImage imageNamed:@"4-户型鉴赏-0/2#.png"] forState:(UIControlStateNormal)];
        [self.secondBtn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.secondBtn];
        //3
        self.threeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.threeBtn.frame = CGRectMake(self.bounds.size.width - 270, 320, 27, 40);
        self.threeBtn.tag = 201;
        [self.threeBtn setImage:[UIImage imageNamed:@"4-户型鉴赏-0/3#.png"] forState:(UIControlStateNormal)];
        [self.threeBtn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.threeBtn];
        //4
        self.fourBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.fourBtn.frame = CGRectMake(self.bounds.size.width - 400, 400, 27, 40);
        self.fourBtn.tag = 202;
        [self.fourBtn setImage:[UIImage imageNamed:@"4-户型鉴赏-0/4#.png"] forState:(UIControlStateNormal)];
        [self.fourBtn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.fourBtn];
        //5
        self.fiveBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.fiveBtn.frame = CGRectMake(self.bounds.size.width - 600, 500, 27, 40);
        self.fiveBtn.tag = 203;
        [self.fiveBtn setImage:[UIImage imageNamed:@"4-户型鉴赏-0/5#.png"] forState:(UIControlStateNormal)];
        [self.fiveBtn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.fiveBtn];
        //6
        self.sixBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.sixBtn.frame = CGRectMake(self.bounds.size.width - 650, 160, 27, 40);
        self.sixBtn.tag = 204;
        [self.sixBtn setImage:[UIImage imageNamed:@"4-户型鉴赏-0/6#.png"] forState:(UIControlStateNormal)];
        [self.sixBtn addTarget:self action:@selector(btnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.sixBtn];
    }
    return self;
}

- (void)btnaction:(UIButton *)sender
{
    
    // 当前顶层窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:window];
    if (sender.tag == 200) {
        self.HXsec = [[HXsecondView alloc] initWithFrame:self.bounds];
        [window addSubview:self.HXsec];
        
    } else if (sender.tag == 201){
        self.HXthree = [[HXthreeView alloc] initWithFrame:self.bounds];
        [window addSubview:self.HXthree];
    } else if (sender.tag == 202){
        self.HXfour = [[HXfourView alloc] initWithFrame:self.bounds];
        [window addSubview:self.HXfour];
    } else if (sender.tag == 203){
        self.HXfive = [[HXfiveView alloc] initWithFrame:self.bounds];
        [window addSubview:self.HXfive];
    } else if (sender.tag == 204){
        self.HXsix = [[HXsixView alloc] initWithFrame:self.bounds];
        [window addSubview:self.HXsix];
    }
        
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
