//
//  Calculator.m
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/9.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(Calculator *)calculate:(int (^)(int result))calculate{
    
    self.result = calculate(self.result);
    return self;
}

-(BOOL)equal:(BOOL (^)(int result))operation{
    return operation(self.result);
}

@end
