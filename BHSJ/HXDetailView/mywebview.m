//
//  mywebview.m
//  BHSJ
//
//  Created by linjianguo on 2017/11/6.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "mywebview.h"

@interface mywebview ()<UIWebViewDelegate>
@property (nonatomic, strong)UIWebView *webview;
@property (nonatomic, strong)UIButton *deletebtn;
@end

@implementation mywebview


- (instancetype)initWithFrame:(CGRect)frame weburl:(NSString *)url
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.webview = [[UIWebView alloc] initWithFrame:self.bounds];
        
        [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        
        [self addSubview:self.webview];
        
        self.webview.delegate = self;
        
        
    }
    return self;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //
    self.deletebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.deletebtn.frame = CGRectMake(self.frame.size.width - 160, self.frame.size.height - 63, 35, 50);
    [self.deletebtn setImage:[UIImage imageNamed:@"last"] forState:(UIControlStateNormal)];
    [self.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.deletebtn];
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
