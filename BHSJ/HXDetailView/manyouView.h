//
//  manyouView.h
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface manyouView : UIView

@property (nonatomic, strong)NSMutableArray *imageArr;

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSMutableArray *)imageArray;

@end
