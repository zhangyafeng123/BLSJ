//
//  jingguanRightView.h
//  BHSJ
//
//  Created by tao shiqiang on 2017/9/21.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol jingguanRightViewDelegate <NSObject>

- (void)deleteBtnselectedAction;

@end

@interface jingguanRightView : UIView

@property (nonatomic, assign)id <jingguanRightViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame;
@end
