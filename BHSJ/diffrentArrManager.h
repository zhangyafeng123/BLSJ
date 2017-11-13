//
//  diffrentArrManager.h
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface diffrentArrManager : NSObject
//D niaokan
+(NSMutableArray *)getDniaokan;
//D manyou
+(NSMutableArray *)getDmanyou;
//A manyou
+(NSMutableArray *)getAmanyou;
//A niaokan
+(NSMutableArray *)getAniaokan;
//C niaokan
+(NSMutableArray *)getCniaokan;
//B2
+(NSMutableArray *)getB2niaolan;
//jingguan
+(NSMutableArray *)getjingguanMY;

//jingguannew
+(NSMutableArray *)getjingguanMYnew;
@end
