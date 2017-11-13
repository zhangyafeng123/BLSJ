//
//  JGDetailView.h
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAPanoView.h"
@interface JGDetailView : UIView<JAPanoViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)arr ismy:(BOOL)ismy;

@end
