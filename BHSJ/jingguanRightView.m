//
//  jingguanRightView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "jingguanRightView.h"
#import "JGDetailView.h"

@interface jingguanRightView ()
@property (nonatomic, strong)UIButton *deletebtn;
@property (nonatomic, strong)UIImageView *backimg;

@property (nonatomic, strong)UIButton *threebtn;
@property (nonatomic, strong)UIButton *manyoubtn;
@property (nonatomic, strong)UIButton *twobtn;
@property (nonatomic, strong)UIButton *onebtn;
@property (nonatomic, strong)UIButton *fivebtn;
@property (nonatomic, strong)UIButton *sixbtn;
@property (nonatomic, strong)JGDetailView *JGdetailV;
@end

@implementation jingguanRightView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.backimg = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backimg.image = [UIImage imageNamed:@"景观体验new"];
        self.backimg.userInteractionEnabled = YES;
        [self addSubview:self.backimg];
        
        //
        self.deletebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.deletebtn.frame = CGRectMake(self.frame.size.width - 80, 50, 40, 40);
        [self.deletebtn setImage:[UIImage imageNamed:@"关闭"] forState:(UIControlStateNormal)];
        [self.deletebtn addTarget:self action:@selector(deletebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.deletebtn];
        
        //3
        self.threebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.threebtn.frame = CGRectMake(400, 250, 40, 40);
        self.threebtn.tag = 160;
        [self.threebtn setImage:[UIImage imageNamed:@"景观3"] forState:(UIControlStateNormal)];
        [self.threebtn addTarget:self action:@selector(threebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.threebtn];
        //manyou
        self.manyoubtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.manyoubtn.frame = CGRectMake(380, 300, 40, 40);
        self.manyoubtn.tag = 161;
        [self.manyoubtn setImage:[UIImage imageNamed:@"景观漫游"] forState:(UIControlStateNormal)];
        [self.manyoubtn addTarget:self action:@selector(threebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.manyoubtn];
        //2
        self.twobtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.twobtn.frame = CGRectMake(360, 350, 40, 40);
        self.twobtn.tag = 162;
        [self.twobtn setImage:[UIImage imageNamed:@"景观2"] forState:(UIControlStateNormal)];
        [self.twobtn addTarget:self action:@selector(threebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.twobtn];
        //1
        self.onebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.onebtn.frame = CGRectMake(330, 430, 40, 40);
        self.onebtn.tag = 163;
        [self.onebtn setImage:[UIImage imageNamed:@"景观1"] forState:(UIControlStateNormal)];
        [self.onebtn addTarget:self action:@selector(threebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.onebtn];
        
        //
        self.fivebtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.fivebtn.frame = CGRectMake(300, 390, 40, 40);
        self.fivebtn.tag = 164;
        [self.fivebtn setImage:[UIImage imageNamed:@"景观4"] forState:(UIControlStateNormal)];
        [self.fivebtn addTarget:self action:@selector(threebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.fivebtn];
        
        //
        self.sixbtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.sixbtn.frame = CGRectMake(390, 410, 40, 40);
        self.sixbtn.tag = 165;
        [self.sixbtn setImage:[UIImage imageNamed:@"景观漫游"] forState:(UIControlStateNormal)];
        [self.sixbtn addTarget:self action:@selector(threebtnaction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.sixbtn];
    }
    return self;
}
- (void)threebtnaction:(UIButton *)sender
{
    [self.JGdetailV removeFromSuperview];
   
    // 当前顶层窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
      [self transitionWithSubtype:kCATransitionFromLeft ForView:window];
    NSArray *arr;
    if (sender.tag == 160) {
        arr = @[@"jingguan/360/3/3_cube_0.jpg",@"jingguan/360/3/3_cube_1.jpg",@"jingguan/360/3/3_cube_2.jpg",@"jingguan/360/3/3_cube_3.jpg",@"jingguan/360/3/3_cube_4.jpg",@"jingguan/360/3/3_cube_5.jpg"];
        self.JGdetailV = [[JGDetailView alloc] initWithFrame:self.bounds imageArr:arr ismy:NO];
       
    } else if (sender.tag == 161){
        //manyou
        arr = [diffrentArrManager getjingguanMY];
        self.JGdetailV = [[JGDetailView alloc] initWithFrame:self.bounds imageArr:arr ismy:YES];
    } else if(sender.tag == 162){
        arr = @[@"jingguan/360/2/2_cube_0.jpg",@"jingguan/360/2/2_cube_1.jpg",@"jingguan/360/2/2_cube_2.jpg",@"jingguan/360/2/2_cube_3.jpg",@"jingguan/360/2/2_cube_4.jpg",@"jingguan/360/2/2_cube_5.jpg"];
        self.JGdetailV = [[JGDetailView alloc] initWithFrame:self.bounds imageArr:arr ismy:NO];
    } else if (sender.tag == 163){
         arr = @[@"jingguan/360/1/1_cube_0.jpg",@"jingguan/360/1/1_cube_1.jpg",@"jingguan/360/1/1_cube_2.jpg",@"jingguan/360/1/1_cube_3.jpg",@"jingguan/360/1/1_cube_4.jpg",@"jingguan/360/1/1_cube_5.jpg"];
        self.JGdetailV = [[JGDetailView alloc] initWithFrame:self.bounds imageArr:arr ismy:NO];
    } else if (sender.tag == 164){
        arr = @[@"JG4-0.jpg",@"JG4-1.jpg",@"JG4-2.jpg",@"JG4-3.jpg",@"JG4-4.jpg",@"JG4-5.jpg"];
         self.JGdetailV = [[JGDetailView alloc] initWithFrame:self.bounds imageArr:arr ismy:NO];
        
    } else if (sender.tag == 165){
        arr = [diffrentArrManager getjingguanMYnew];
        self.JGdetailV = [[JGDetailView alloc] initWithFrame:self.bounds imageArr:arr ismy:YES];
    }
    
    [window addSubview:self.JGdetailV];
}
- (void)deletebtnaction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(deleteBtnselectedAction)]) {
        [self.delegate deleteBtnselectedAction];
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
