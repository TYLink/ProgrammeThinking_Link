//
//  CalculationManager.m
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/8.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import "CalculationManager.h"

@implementation CalculationManager

//加
-(CalculationManager *(^)(int value))add{
    
    return ^(int value){
        self ->_result += value;
        return self;
    };
}

//减
-(CalculationManager *(^)(int value))sub{
    return ^(int value){
        self ->_result -= value;
        return self;
    };
}


@end
