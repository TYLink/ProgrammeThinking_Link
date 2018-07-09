//
//  NSObject+LinkKVO.m
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/9.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import "NSObject+LinkKVO.h"
#import <objc/message.h>

@implementation NSObject (LinkKVO)

- (void)Link_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    /*
     1、自定义子类
     2、重新setName 在方法中调用 super的 通知观察者
     3、修改当前对象的isa 指针 ！ 指向自定义的子类
     */
    
    // 1、动态生成一个类
    // 1.1  创建 self 的子类  获取类名
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [@"LinkKVO_" stringByAppendingString:oldClassName ];
    const char * newName = [newClassName UTF8String];
    //    创建一个 Class
    Class MyClass = objc_allocateClassPair([self class], newName, 0);
    objc_registerClassPair(MyClass);
    
    //2、添加Set方法
    class_addMethod(MyClass, @selector(setName:), (IMP)setName, "v@:");
    
    //3、修改isa 指针
    object_setClass(self, MyClass);
 
    //    4、保存观察者对象
    objc_setAssociatedObject(self, @"objc", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

//1、调用super 的set方法
//2、通知外界
void setName(id self,SEL _cmd,NSString * newName){
    //保存子类类型
    id class = [self class];
   
    //改变self的isa指针
    object_setClass(self, class_getSuperclass(class));
   
    //调用父类的set方法!!
    
//    此处可能会报错 要是报错请按照
//    -Project-Build Setting- Enable Strict Checking of objc_msgSend Calls 修改为NO即可
    objc_msgSend(self, @selector(setName:),newName);

    //拿到观察者
    id objc = objc_getAssociatedObject(self, @"objc");
   
    //通知观察者
    objc_msgSend(objc, @selector(observeValueForKeyPath:ofObject:change:context:),self,@"name",nil,nil);
  
    //改回子类类型
    object_setClass(self, class);
}

@end
