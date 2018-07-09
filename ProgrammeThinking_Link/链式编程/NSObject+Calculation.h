//
//  NSObject+Calculation.h
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/8.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculationManager.h"

@interface NSObject (Calculation)

+ (int)link_MakeCalculation:(void(^)(CalculationManager *mgr))block;


@end
