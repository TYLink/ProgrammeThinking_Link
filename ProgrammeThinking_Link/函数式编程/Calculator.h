//
//  Calculator.h
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/9.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic, assign) int result;

-(Calculator *)calculate:(int (^)(int result))calculate;

-(BOOL)equal:(BOOL (^)(int result))operation;



@end
