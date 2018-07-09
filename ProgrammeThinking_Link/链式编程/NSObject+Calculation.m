//
//  NSObject+Calculation.m
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/8.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import "NSObject+Calculation.h"

@implementation NSObject (Calculation)

+ (int)link_MakeCalculation:(void(^)(CalculationManager *mgr))block{
    
//    在这里处理一下基本操作 并使用Block将 工具类传出 以便继续支持链式
    CalculationManager *mgr = [[CalculationManager alloc] init];
    block(mgr);
    return mgr.result;
    
}


@end
