//
//  jingguanView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "jingguanView.h"
#import "gaikuangRightView.h"
#import "jingguanRightView.h"
@interface jingguanView ()<gaikuangRightViewDelegate,jingguanRightViewDelegate>
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)gaikuangRightView *rightV;
@property (nonatomic, strong)jingguanRightView *rightV1;


@property (nonatomic, strong)UIButton *btn1;
@property (nonatomic, strong)UIButton *btn2;
@property (nonatomic, strong)UIButton *btn3;
@property (nonatomic, strong)UIButton *btn4;
@property (nonatomic, strong)UIButton *btn5;
@property (nonatomic, strong)UIButton *btn6;
@property (nonatomic, strong)UIButton *btn7;
@property (nonatomic, strong)UIButton *btn8;

@end


@implementation jingguanView

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
    self.backImg = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backImg.image = [UIImage imageNamed:@"bjjingguan"];
    [self addSubview:self.backImg];
    
    
    self.leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.leftBtn.frame = CGRectMake(self.frame.size.width - 250, self.frame.size.height - 150, 90, 40);
    [self.leftBtn setImage:[UIImage imageNamed:@"特色园林"] forState:(UIControlStateNormal)];
    [self.leftBtn setImage:[UIImage imageNamed:@"特色园林点亮"] forState:(UIControlStateSelected)];
    [self.leftBtn addTarget:self action:@selector(leftBtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.leftBtn];
    //
    self.rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.rightBtn.frame = CGRectMake(self.frame.size.width - 150, self.frame.size.height - 150, 90, 40);
    [self.rightBtn setImage:[UIImage imageNamed:@"景观体验"] forState:(UIControlStateNormal)];
    [self.rightBtn setImage:[UIImage imageNamed:@"景观体验点亮"] forState:(UIControlStateSelected)];
    [self.rightBtn addTarget:self action:@selector(rightBtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.rightBtn];
    //8_btn
    
    //1崎山叠翠
    self.btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn1.frame = CGRectMake(235, 455, 80, 90);
    [self.btn1 setImage:[UIImage imageNamed:@"崎山叠翠"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn1];
    //义景清泉
    self.btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn2.frame = CGRectMake(400, 300, 80, 90);
    [self.btn2 setImage:[UIImage imageNamed:@"义景清泉"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn2];
    //龙潭夜月
    self.btn3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn3.frame = CGRectMake(370, 350, 80, 90);
    [self.btn3 setImage:[UIImage imageNamed:@"龙潭夜月"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn3];
    //四顾云台
    self.btn4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn4.frame = CGRectMake(430, 390, 80, 90);
    [self.btn4 setImage:[UIImage imageNamed:@"四顾云台"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn4];
    //渔浦秋风
    self.btn5 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn5.frame = CGRectMake(520, 495, 80, 90);
    [self.btn5 setImage:[UIImage imageNamed:@"渔浦秋风"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn5];
    //风台夕照
    self.btn6 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn6.frame = CGRectMake(545, 270, 80, 90);
    [self.btn6 setImage:[UIImage imageNamed:@"风台夕照"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn6];
    //化乐晓钟
    self.btn7 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn7.frame = CGRectMake(self.frame.size.width - 210, 260, 80, 90);
    [self.btn7 setImage:[UIImage imageNamed:@"化乐晓钟"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn7];
    //城南烟树
    self.btn8 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn8.frame=  CGRectMake(self.frame.size.width - 120, 250, 80, 90);
    [self.btn8 setImage:[UIImage imageNamed:@"城南烟树"] forState:(UIControlStateNormal)];
    [self addSubview:self.btn8];
    
}
- (void)leftBtnaction:(UIButton *)sender
{
    self.leftBtn.selected = YES;
    self.rightBtn.selected = NO;
    [self.rightV removeFromSuperview];
     [self.rightV1 removeFromSuperview];
    self.rightV = [[gaikuangRightView alloc] initWithFrame:self.bounds imageArr:@[@"3-景观展示-1特色园林1",@"3-景观展示-1特色园林2",@"3-景观展示-1特色园林3",@"3-景观展示-1特色园林4"]];
    self.rightV.delegate = self;
    [self addSubview:self.rightV];
    [self insertSubview:self.rightV aboveSubview:self.btn8];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
    
}
- (void)rightBtnaction:(UIButton *)sener
{
    self.leftBtn.selected = NO;
    self.rightBtn.selected = YES;
     [self.rightV removeFromSuperview];
     [self.rightV1 removeFromSuperview];
    self.rightV1 = [[jingguanRightView alloc] initWithFrame:self.bounds];
    self.rightV1.delegate = self;
    
    [self addSubview:self.rightV1];
    [self insertSubview:self.rightV1 aboveSubview:self.btn8];
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

- (void)deleteRigthBtnactionMethod
{
    self.leftBtn.selected = NO;
    self.rightBtn.selected = NO;
}
- (void)deleteBtnselectedAction
{
    self.leftBtn.selected = NO;
    self.rightBtn.selected = NO;
}
@end
