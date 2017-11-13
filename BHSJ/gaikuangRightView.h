//
//  gaikuangRightView.h
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "gaikuangSuperView.h"

@protocol gaikuangRightViewDelegate <NSObject>

- (void)deleteRigthBtnactionMethod;

@end


@interface gaikuangRightView : gaikuangSuperView

@property (nonatomic, assign)id<gaikuangRightViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)imageArr;
@end
