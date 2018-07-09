//
//  NSObject+LinkKVO.h
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/9.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LinkKVO)

- (void)Link_addObserver:(NSObject *)observer
              forKeyPath:(NSString *)keyPath
                 options:(NSKeyValueObservingOptions)options
                 context:(nullable void *)context;

@end
