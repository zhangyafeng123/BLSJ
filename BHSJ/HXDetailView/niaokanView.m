//
//  niaokanView.m
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "niaokanView.h"
#import "NKSpinImageView.h"
@interface niaokanView ()<ZWSpinImageViewDelegate>

@property (nonatomic, strong)NKSpinImageView *spinIV;



@end

@implementation niaokanView

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSMutableArray *)arr
{
    if ([super initWithFrame:frame]) {
        self.spinIV = [[NKSpinImageView alloc] initWithFrame:self.bounds];
        self.spinIV.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.spinIV.imagesArray = arr;
        self.spinIV.delegate = self;
        //xunhuan
        self.spinIV.isRepeat = YES;
        
        [self addSubview:self.spinIV];
    }
    return self;
}
- (void)dealloc {
    
    [self removeSpinImageView];
}
//销毁视图
- (void)removeSpinImageView {
    [self.spinIV removeFromSuperview];
    self.spinIV = nil;
}

@end
