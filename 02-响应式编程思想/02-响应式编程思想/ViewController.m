//
//  ViewController.m
//  02-响应式编程思想
//
//  Created by 沈海超 on 19/9/23.
//  Copyright © 2019年 沈海超. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"


#import "NSObject+KVO.h"

@interface ViewController ()


@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

// 1.生成一个Person类的子类 NSKVONotifying_Person
// 2.使当前对象的isa指向新的类，就会调用新类的set方法
// 3.重写NSKVONotifying_Person的setAge方法，每次调用，就调用观察者的observeValueForKeyPath方法
// 4.如何在set方法中，拿到观察者，使用运行时让当前对象关联观察者这个属性。

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc] init];
    
    p.age = 0;
    
    _person = p;
    
    [p SF_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
//    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    
   
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"person的值改变了：%d",_person.age);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    _person.age = 10;
}

@end
