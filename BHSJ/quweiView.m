//
//  quweiView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "quweiView.h"
#import "quweiDeitailView.h"
@interface quweiView ()
@property (nonatomic, strong)UIImageView *backImageV;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)quweiDeitailView *detailV;
@end

@implementation quweiView
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.backImageV = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backImageV.image = [UIImage imageNamed:@"bjnew"];
        self.backImageV.userInteractionEnabled = YES;
        [self addSubview:self.backImageV];
        
        self.rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.rightBtn.frame = CGRectMake(self.bounds.size.width - 150, self.bounds.size.height - 150, 90, 40);
        [self.rightBtn setImage:[UIImage imageNamed:@"区位展示new"] forState:(UIControlStateNormal)];
        [self.rightBtn setImage:[UIImage imageNamed:@"区位展示点亮"] forState:(UIControlStateHighlighted)];
        [self.rightBtn addTarget:self action:@selector(rightBtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.backImageV addSubview:self.rightBtn];
    }
    return self;
}
- (void)rightBtnaction:(UIButton *)sender
{
   
    // 当前顶层窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:window];
    self.detailV = [[quweiDeitailView alloc] initWithFrame:self.bounds];
    [window addSubview:self.detailV];
    
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
