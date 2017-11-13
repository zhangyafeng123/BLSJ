//
//  gaikuangSuperView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "gaikuangSuperView.h"
#import "giakuangLeftView.h"
#import "gaikuangRightView.h"

@interface gaikuangSuperView ()<gaikuangSuperViewDelegate,gaikuangRightViewDelegate>

@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)giakuangLeftView *leftV;
@property (nonatomic, strong)gaikuangRightView *rightV;

@end

@implementation gaikuangSuperView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self interView];
    }
    return self;
}
//界面
- (void)interView
{
    self.backgroundColor = [UIColor clearColor];
    
    self.leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.leftBtn.frame = CGRectMake(self.frame.size.width - 250, self.frame.size.height - 150, 90, 40);
    [self.leftBtn setImage:[UIImage imageNamed:@"项目简介点亮"] forState:(UIControlStateSelected)];
      [self.leftBtn setImage:[UIImage imageNamed:@"项目简介"] forState:(UIControlStateNormal)];
    [self.leftBtn addTarget:self action:@selector(leftBtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.leftBtn];
    //
    self.rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.rightBtn.frame = CGRectMake(self.frame.size.width - 150, self.frame.size.height - 150, 90, 40);
    [self.rightBtn setImage:[UIImage imageNamed:@"产品配置"] forState:(UIControlStateNormal)];
     [self.rightBtn setImage:[UIImage imageNamed:@"产品配置点亮"] forState:(UIControlStateSelected)];
    [self.rightBtn addTarget:self action:@selector(rightBtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.rightBtn];
    
}
- (void)leftBtnaction:(UIButton *)sender
{
    
    self.leftBtn.selected = YES;
    self.rightBtn.selected = NO;
   
    
    //leftv
     [self.rightV removeFromSuperview];
    [self.leftV removeFromSuperview];
    self.leftV = [[giakuangLeftView alloc]initWithFrame:self.bounds];
    self.leftV.delegate =self;
    [self addSubview:self.leftV];
    [self sendSubviewToBack:self.leftV];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
}
- (void)rightBtnaction:(UIButton *)sender
{
    self.leftBtn.selected = NO;
    self.rightBtn.selected = YES;
    [self.rightV removeFromSuperview];
    [self.leftV removeFromSuperview];
    self.rightV = [[gaikuangRightView alloc] initWithFrame:self.bounds imageArr:@[@"1-项目概况-2项目配套",@"1-项目概况-2项目配套2",@"1-项目概况-2项目配套3",@"1-项目概况-2项目配套4"]];
    self.rightV.delegate = self;
    [self addSubview:self.rightV];
    [self sendSubviewToBack:self.rightV];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
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
- (void)deleteactionforLeft
{
    self.leftBtn.selected = NO;
    self.rightBtn.selected = NO;
}
- (void)deleteRigthBtnactionMethod
{
    self.leftBtn.selected = NO;
    self.rightBtn.selected = NO;
}

@end
