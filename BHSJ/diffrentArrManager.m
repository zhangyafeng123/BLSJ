//
//  diffrentArrManager.m
//  BHSJ
//
//  Created by linjianguo on 2017/10/13.
//  Copyright © 2017年 zhangyafeng. All rights reserved.
//

#import "diffrentArrManager.h"

@implementation diffrentArrManager

+(NSMutableArray *)getDniaokan
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 31; i++) {
        @autoreleasepool {
            NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"DN-%d",i] ofType:@"jpg"];
           
            [arr addObject:str];
           
        }
       
    }
    return arr;
}
//D manyou
+(NSMutableArray *)getDmanyou
{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < 2599; i++) {
        @autoreleasepool {
            
            NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"DM-%d",i] ofType:@"jpg"];
            [arr addObject:str];
        }
        
    }
    return arr;
}

//A manyou
+(NSMutableArray *)getAmanyou
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 1506; i++) {
        @autoreleasepool {
        NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"63AMnew-%d",i] ofType:@"jpg"];

        [arr addObject:str];
        }
    }
    return arr;
}
//C niaokan
+(NSMutableArray *)getCniaokan
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 62; i++) {
        @autoreleasepool {
            NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"35-%d",i] ofType:@"jpg"];
           
            [arr addObject:str];
        }
        
    }
    return arr;
}
//B2
+(NSMutableArray *)getB2niaolan
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 1; i < 32; i++) {
       NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"B2-%d",i] ofType:@"jpg"];
        [arr addObject:str];
    }
    return arr;
}

//A niaokan
+(NSMutableArray *)getAniaokan
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 62; i++) {
        @autoreleasepool {

            NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"63-%d",i] ofType:@"jpg"];
            
            [arr addObject:str];
        }
    }
    return arr;
}

//jingguan
+(NSMutableArray *)getjingguanMY
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 751; i++) {
        @autoreleasepool {
            
            NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"jg-%d",i] ofType:@"jpg"];
            
            [arr addObject:str];
        }
    }
    return arr;
}

//jingguannew
+(NSMutableArray *)getjingguanMYnew
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 300; i++) {
        @autoreleasepool {
            
            NSString *str = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"JGNEW%d",i] ofType:@"jpg"];
            
            [arr addObject:str];
        }
    }
    return arr;
}
@end
