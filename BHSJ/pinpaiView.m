//
//  pinpaiView.m
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "pinpaiView.h"

@interface pinpaiView ()
@property (nonatomic, strong)UIImageView *backImg;
@end

@implementation pinpaiView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backImg = [[UIImageView alloc] initWithFrame:self.bounds];
        self.backImg.image = [UIImage imageNamed:@"bjpinpai"];
        [self addSubview:self.backImg];
    }
    return self;
}
@end
