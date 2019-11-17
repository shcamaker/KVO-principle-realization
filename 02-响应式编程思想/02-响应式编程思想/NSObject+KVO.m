//
//  NSObject+KVO.m
//  02-响应式编程思想
//
//  Created by 沈海超 on 19/9/23.
//  Copyright © 2019年 沈海超. All rights reserved.
//

#import "NSObject+KVO.h"

#import <objc/runtime.h>

#import "SFKVONotifying_Person.h"

@implementation NSObject (KVO)

- (void)SF_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    
//    SFKVONotifying_Person *person = [[SFKVONotifying_Person alloc] init];    
    // 修改isa指针,就是把当前对象指向一个新类
    object_setClass(self, [SFKVONotifying_Person class]);
    
    // 给对象绑定观测者对象
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

@end
