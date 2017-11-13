//
//  ViewController.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "ViewController.h"
#import "gaikuangSuperView.h"
#import "quweiView.h"
#import "jingguanView.h"
#import "huxingView.h"
#import "pinpaiView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondbtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (weak, nonatomic) IBOutlet UIButton *fivebtn;
@property (weak, nonatomic) IBOutlet UIImageView *backImg;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImg;
@property (nonatomic, strong)gaikuangSuperView *gaikuangV;
@property (nonatomic, strong)quweiView *quweiV;
@property (nonatomic, strong)jingguanView *jingguanV;
@property (nonatomic, strong)huxingView *huxingV;
@property (nonatomic, strong)pinpaiView *pinpaiV;
@end

@implementation ViewController
- (IBAction)firstBtnAction:(UIButton *)sender {
    self.bottomImg.image = [UIImage imageNamed:@"项目概况"];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    self.gaikuangV.hidden = NO;
    self.quweiV.hidden = YES;
    self.jingguanV.hidden = YES;
    self.huxingV.hidden = YES;
    self.pinpaiV.hidden = YES;
}
- (IBAction)secondBtnAction:(UIButton *)sender {
    self.bottomImg.image = [UIImage imageNamed:@"区位交通"];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    self.gaikuangV.hidden = YES;
    self.quweiV.hidden = NO;
    self.jingguanV.hidden = YES;
    self.huxingV.hidden = YES;
    self.pinpaiV.hidden = YES;
}
- (IBAction)threeBtnAction:(UIButton *)sender {
     self.bottomImg.image = [UIImage imageNamed:@"景观展示"];
     [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    self.gaikuangV.hidden = YES;
    self.quweiV.hidden = YES;
    self.jingguanV.hidden = NO;
    self.huxingV.hidden = YES;
    self.pinpaiV.hidden = YES;
}
- (IBAction)fourBtnAction:(UIButton *)sender {
     self.bottomImg.image = [UIImage imageNamed:@"户型鉴赏"];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    self.gaikuangV.hidden = YES;
    self.quweiV.hidden = YES;
    self.jingguanV.hidden = YES;
    self.huxingV.hidden = NO;
    self.pinpaiV.hidden = YES;
}
- (IBAction)fivebtnAction:(UIButton *)sender {
    self.bottomImg.image = [UIImage imageNamed:@"百隆品牌"];
    [self transitionWithSubtype:kCATransitionFromLeft ForView:self.view];
    self.gaikuangV.hidden = YES;
    self.quweiV.hidden = YES;
    self.jingguanV.hidden = YES;
    self.huxingV.hidden = YES;
    self.pinpaiV.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"001" withExtension:@"mp3"];
    mucback = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    mucback.numberOfLoops =10000;
    [mucback setVolume:1];
    [mucback play];
    
    [self getview];
    // 当前顶层窗口
    
    UIImageView *imagevtop = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
    imagevtop.alpha = 0.7;
    imagevtop.image = [UIImage imageNamed:@"logo.jpg"];
    [self.view addSubview:imagevtop];
    
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    //[ud setBool:NO forKey:@"isInitDataBase"];
    BOOL isInitDataBase = [ud boolForKey:@"isInitDataBase"];
    if(isInitDataBase == NO){
        [[DatabaseManager getInstance] initDatabase];
        [ud setBool:YES forKey:@"isInitDataBase"];
    }
    
    
    NSArray *list = [[DatabaseManager getInstance] selectSQL:@"SELECT ifin FROM lv"];
    
    
    if ([[[list objectAtIndex:0] objectAtIndex:0] isEqualToString:@"YES"]) {
        [self.view setFrame:CGRectMake(0, 0, 1024, 768)];
        tt = [NSTimer scheduledTimerWithTimeInterval:10
                                              target:self
                                            selector:@selector(myfuncion)
                                            userInfo:nil
                                             repeats:YES];
        
    }else{
        NSLog(@"time out....");
        
        [self.view setFrame:CGRectMake(1024, 0, 1024, 768)];
    }

    
}
- (void)getview
{
    //概况
    self.gaikuangV = [[gaikuangSuperView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.gaikuangV];
    [self.view insertSubview:self.gaikuangV aboveSubview:self.backImg];
    
    self.quweiV = [[quweiView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.quweiV];
    self.quweiV.hidden = YES;
    [self.view insertSubview:self.quweiV aboveSubview:self.backImg];
    
    self.jingguanV = [[jingguanView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.jingguanV];
    self.jingguanV.hidden = YES;
    [self.view insertSubview:self.jingguanV aboveSubview:self.backImg];
    
    self.huxingV = [[huxingView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.huxingV];
    self.huxingV.hidden = YES;
    [self.view insertSubview:self.huxingV aboveSubview:self.backImg];
    
    self.pinpaiV = [[pinpaiView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.pinpaiV];
    self.pinpaiV.hidden = YES;
    [self.view insertSubview:self.pinpaiV aboveSubview:self.backImg];
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


-(void)myfuncion
{
    NSString *datetimg=@"2017-12-08 09:00:00";
    NSDateFormatter *datef=[[NSDateFormatter alloc] init];
    [datef setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //datetimg=[datef stringFromDate:[NSDate date]];
    
    NSDate *curdatesss=[[NSDate date] init];
    NSDate *starttimes=[datef dateFromString:datetimg];
    //NSLog(@"---------text--------2012-=--------");
    
    if([self comparetoday:starttimes andseconddate:curdatesss]){
        NSString *sql = [[NSString alloc] initWithFormat:@"update lv set ifin='NO'"];
        [[DatabaseManager getInstance] execSQL:sql];
        //[self.window makeKeyWindow]
        [self.view setFrame:CGRectMake(1024, 0, 1024, 768)];
        [tt invalidate];
    }
    
    
}

-(BOOL)comparetoday:(NSDate *)firsetdate andseconddate:(NSDate *)seconddate
{
    
    NSDate *resultdate = [firsetdate earlierDate:seconddate];
    BOOL vvvv = [firsetdate isEqualToDate:resultdate];
    return vvvv;
}


@end
