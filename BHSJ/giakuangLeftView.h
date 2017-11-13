//
//  giakuangLeftView.h
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "gaikuangSuperView.h"


@protocol gaikuangSuperViewDelegate <NSObject>

- (void)deleteactionforLeft;

@end

@interface giakuangLeftView : gaikuangSuperView

@property (nonatomic, assign)id <gaikuangSuperViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
