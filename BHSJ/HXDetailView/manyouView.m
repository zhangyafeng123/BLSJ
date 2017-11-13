//
//  manyouView.m
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "manyouView.h"
#import "ZWSpinImageView.h"
@interface manyouView ()<ZWSpinImageViewDelegate>

@property (nonatomic, strong)ZWSpinImageView *spinIV;

@end

@implementation manyouView

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSMutableArray *)imageArray
{
    if ([super initWithFrame:frame]) {
        self.spinIV = [[ZWSpinImageView alloc] initWithFrame:self.bounds];
        self.spinIV.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.spinIV.imagesArray = imageArray;
        self.spinIV.delegate = self;
        //xunhuan
        self.spinIV.isRepeat = YES;
        
        [self addSubview:self.spinIV];
        
        [self.spinIV autoMoveForward];
        
        
        
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
