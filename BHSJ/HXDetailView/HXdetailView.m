//
//  HXdetailView.m
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "HXdetailView.h"
#import "niaokanView.h"
#import "jiexiView.h"
#import "manyouView.h"
#import "mywebview.h"
@interface HXdetailView ()
@property (nonatomic, strong)UIButton *deletebtn;

@property (nonatomic, strong)UIButton *jiexibtn;
@property (nonatomic, strong)UIButton *niaolanbtn;
@property (nonatomic, strong)UIButton *manyoubtn;
@property (nonatomic, strong)UIButton *huxingBtn;
@property (nonatomic, strong)UIImageView *bottomImg;

@property (nonatomic, strong)jiexiView *jiexiV;
@property (nonatomic, strong)niaokanView *niaokanV;
@property (nonatomic, strong)manyouView *manyouV;
@property (nonatomic, strong)mywebview *mymeb;

@property (nonatomic, assign)BOOL aaaaa;
@property (nonatomic, assign)BOOL bbbbb;

@end

@implementation HXdetailView


- (instancetype)initWithFrame:(CGRect)frame backImg:(NSString *)backimgstr niaokanhide:(BOOL)niaokanhide manyouhide:(BOOL)manyouhide niaokanArr:(NSMutableArray *)niaokanarr  manyouArr:(NSMutableArray *)manyouarr isDorA:(BOOL)isdora
{
    if ([super initWithFrame:frame]) {
        
        self.aaaaa = manyouhide;
        self.bbbbb = isdora;
        NSLog(@"%d----%d",self.aaaaa,self.bbbbb);
        
        //
        self.bottomImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 80, self.frame.size.width, 80)];
        self.bottomImg.image = [UIImage imageNamed:@"4-户型鉴赏-2户型/底部.png"];
        self.bottomImg.userInteractionEnabled = YES;
        [self addSubview:self.bottomImg];
        //jiexi
        self.jiexibtn  = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.jiexibtn.frame = CGRectMake(50, 30, 90, 30);
        [self.jiexibtn setImage:[UIImage imageNamed:@"4-户型鉴赏-2户型/户型解析.png"] forState:(UIControlStateNormal)];
        [self.jiexibtn setImage:[UIImage imageNamed:@"4-户型鉴赏-2户型/户型解析点亮.png"] forState:(UIControlStateSelected)];
        self.jiexibtn.selected = YES;
        [self.jiexibtn addTarget:self action:@selector(jiexibtnaction) forControlEvents:(UIControlEventTouchUpInside)];
        [self.bottomImg addSubview:self.jiexibtn];
        //niaolan
        self.niaolanbtn  = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.niaolanbtn.frame = CGRectMake(50 + 90 + 10, 30, 90, 30);
        self.niaolanbtn.hidden = niaokanhide;
        [self.niaolanbtn setImage:[UIImage imageNamed:@"4-户型鉴赏-2户型/户型鸟瞰.png"] forState:(UIControlStateNormal)];
        [self.niaolanbtn setImage:[UIImage imageNamed:@"4-户型鉴赏-2户型/户型鸟瞰点亮.png"] forState:(UIControlStateSelected)];
        [self.niaolanbtn addTarget:self action:@selector(niaolanbtnaction) forControlEvents:(UIControlEventTouchUpInside)];
        [self.bottomImg addSubview:self.niaolanbtn];
        //manyou
        self.manyoubtn  = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.manyoubtn.frame = CGRectMake(50 + 100 + 100, 30, 90, 30);
        self.manyoubtn.hidden = manyouhide;
        [self.manyoubtn setImage:[UIImage imageNamed:@"4-户型鉴赏-2户型/户型漫游.png"] forState:(UIControlStateNormal)];
        [self.manyoubtn setImage:[UIImage imageNamed:@"4-户型鉴赏-2户型/户型漫游点亮.png"] forState:(UIControlStateSelected)];
        [self.manyoubtn addTarget:self action:@selector(manyoubtnaction) forControlEvents:(UIControlEventTouchUpInside)];
        [self.bottomImg addSubview:self.manyoubtn];
        //quanjinghuxing
        self.huxingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.huxingBtn.frame = CGRectMake(350, 30, 90, 30);
        [self.huxingBtn setImage:[UIImage imageNamed:@"111"] forState:(UIControlStateNormal)];
        [self.huxingBtn setImage:[UIImage imageNamed:@"222"] forState:(UIControlStateSelected)];
        
        [self.huxingBtn addTarget:self action:@selector(huxingbtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.bottomImg addSubview:self.huxingBtn];
        //无漫游
        if (manyouhide) {
            self.huxingBtn.hidden = YES;
        } else {
            //有漫游
            self.huxingBtn.hidden = NO;
        }
        
        self.deletebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.deletebtn.frame = CGRectMake(self.frame.size.width - 120, 30, 90, 30);
        
        [self.deletebtn setImage:[UIImage imageNamed:@"4-户型鉴赏-2户型/返回.png"] forState:(UIControlStateNormal)];
        [self.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.bottomImg addSubview:self.deletebtn];
        
        
        //
        self.jiexiV = [[jiexiView alloc] initWithFrame:self.bounds imagestr:backimgstr];
        self.jiexiV.hidden = NO;
        [self addSubview:self.jiexiV];
        [self insertSubview:self.jiexiV belowSubview:self.bottomImg];
        
        if (niaokanhide == NO) {
            self.niaokanV = [[niaokanView alloc] initWithFrame:self.bounds imageArr:niaokanarr];
            self.niaokanV.hidden = YES;
            [self addSubview:self.niaokanV];
            [self insertSubview:self.niaokanV belowSubview:self.bottomImg];
        }
        //
        if (manyouhide == NO) {
            self.manyouV = [[manyouView alloc] initWithFrame:self.bounds imageArr:manyouarr];
            self.manyouV.hidden = YES;
            [self addSubview:self.manyouV];
            [self insertSubview:self.manyouV belowSubview:self.bottomImg];
        }
        
    }
    return self;
}
//jiexi
- (void)jiexibtnaction
{
    self.jiexibtn.selected = YES;
    self.niaolanbtn.selected = NO;
    self.manyoubtn.selected = NO;
    self.huxingBtn.selected = NO;
    self.jiexiV.hidden = NO;
    self.niaokanV.hidden = YES;
    self.manyouV.hidden = YES;
     [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
}
//niaokan
- (void)niaolanbtnaction
{
    self.jiexibtn.selected = NO;
    self.niaolanbtn.selected = YES;
    self.manyoubtn.selected = NO;
    self.huxingBtn.selected = NO;
    self.jiexiV.hidden = YES;
    self.niaokanV.hidden = NO;
    self.manyouV.hidden = YES;
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
    
}
//manyou
- (void)manyoubtnaction
{
    self.jiexibtn.selected = NO;
    self.niaolanbtn.selected = NO;
    self.manyoubtn.selected = YES;
    self.huxingBtn.selected = NO;
    self.jiexiV.hidden = YES;
    self.niaokanV.hidden = YES;
    self.manyouV.hidden = NO;
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.superview];
}
- (void)huxingbtnaction:(UIButton *)sender
{
    self.jiexibtn.selected = NO;
    self.niaolanbtn.selected = NO;
    self.manyoubtn.selected = NO;
    self.huxingBtn.selected = YES;
    
    NSString *str;
    
    if (self.aaaaa == NO) {
        if (self.bbbbb)
        {
            str = @"http://720yun.com/t/8ccj55eOuO5?pano_id=7403444";
        } else
        {
            str = @"http://720yun.com/t/0fej55hv5O2?pano_id=7443132";
        }
    }
    
    NSLog(@"%@",str);
    // 当前顶层窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:window];
    self.mymeb = [[mywebview alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) weburl:str];
    [window addSubview:self.mymeb];
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
