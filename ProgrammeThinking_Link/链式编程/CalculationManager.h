//
//  CalculationManager.h
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/8.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationManager : NSObject

@property(assign, nonatomic)int result;

//加
-(CalculationManager *(^)(int value))add;

//减
-(CalculationManager *(^)(int value))sub;



@end
