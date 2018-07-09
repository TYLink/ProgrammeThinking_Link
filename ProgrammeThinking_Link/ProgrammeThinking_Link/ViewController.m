//
//  ViewController.m
//  ProgrammeThinking_Link
//
//  Created by Dnion on 2018/7/8.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Calculation.h"
#import "Calculator.h"

#import "Person.h"
#import "NSObject+LinkKVO.h"

@interface ViewController ()

@property (nonatomic, strong) Person * P;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self calculation];//链式编程
    
//    [self calculate];//函数式编程
    
//    [self observer];// 响应式编程
}

//链式编程
-(void)calculation{
    
    int result = [NSString link_MakeCalculation:^(CalculationManager *mgr) {
        mgr.add(10).add(20).sub(10);
    }];
    
    NSLog(@"10 + 20 - 10 = %d",result);
}

//函数式编程
-(void)calculate{
    
    Calculator *calcul = [[Calculator alloc] init];
    BOOL isEqual = [[calcul calculate:^int(int result) {
        
        result += 5;
        result *= 5;
        return result;
        
    }] equal:^BOOL(int result) {
        
        return result == 25;
        
    }];
    
    NSLog(@"%@", isEqual ? @"相等" : @"不相等");
}

-(void)observer{
//   响应式编程最具代表性的就是 KVO
//   demo 的响应式编程的 案例就用的自定义 KVO （根据系统KVO 实现的原理）

//    系统KVO 实现原理
/*   1、自定义子类
      2、重新子类中的 set 方法，在方法中调用父类的 Set 方法 并通知观察者
      3、修改当前对象的isa 指针 ！ 指向自定义的子类
*/
    
    Person *p = [[Person alloc] init];
    _P = p;

//    监听name 属性
//    [p addObserver:self
//        forKeyPath:@"name"
//           options:NSKeyValueObservingOptionNew
//           context:nil];

    [p Link_addObserver:self
             forKeyPath:@"name"
                options:NSKeyValueObservingOptionNew
                context:nil];
    
}

//一点P 对象的name 属性改变 就执行
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"%@",_P.name);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int i = 0;
    i ++;
    _P.name = [NSString stringWithFormat:@"%d",i];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
