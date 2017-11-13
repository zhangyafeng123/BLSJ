//
//  jiexiView.m
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "jiexiView.h"

@implementation jiexiView

- (instancetype)initWithFrame:(CGRect)frame imagestr:(NSString *)str
{
    if ([super initWithFrame:frame]) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        imageV.image = [UIImage imageNamed:str];
        [self addSubview:imageV];
    }
    return self;
}

@end
