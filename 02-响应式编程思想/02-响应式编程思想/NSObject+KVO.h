//
//  NSObject+KVO.h
//  02-响应式编程思想
//
//  Created by 沈海超 on 19/9/23.
//  Copyright © 2019年 沈海超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)
- (void)SF_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end
