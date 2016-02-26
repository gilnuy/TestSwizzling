//
//  Swizzl_Foundation.m
//  TestSwizzling
//
//  Created by yanluojun on 16/2/23.
//  Copyright © 2016年 yanluojun. All rights reserved.
//

#import "Swizzl_Foundation.h"
#import <objc/runtime.h>

@implementation NSArray (swArray)
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(objectAtIndex:);
        SEL swizzledSelector = @selector(sw_objectAtIndex:);
        
        Method originalMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), originalSelector);
        Method swizzledMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

-(id)sw_objectAtIndex:(NSUInteger)index {
    @try {
        return [self sw_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        // 在崩溃后会打印崩溃信息，方便我们调试。
        NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
        NSLog(@"%@",exception.callStackSymbols);
        return nil;
    }
    @finally {
        
    }
}
@end

@implementation NSMutableArray (swMutableArray)

+ (void)load {
    [super load];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        {
            SEL originalSelector = @selector(objectAtIndex:);
            SEL swizzledSelector = @selector(sw_objectAtIndex:);
            
            Method originalMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), originalSelector);
            Method swizzledMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), swizzledSelector);
            
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        {
            SEL originalSelector = @selector(insertObject:atIndex:);
            SEL swizzledSelector = @selector(sw_insertObject:atIndex:);
            
            Method originalMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), originalSelector);
            Method swizzledMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), swizzledSelector);
            
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

-(id)sw_objectAtIndex:(NSUInteger)index {
    @try {
        return [self sw_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        // 在崩溃后会打印崩溃信息，方便我们调试。
        NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
        NSLog(@"%@",exception.callStackSymbols);
        return nil;
    }
    @finally {
        
    }
}

- (void)sw_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self sw_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        //如果value和key都非法，系统会先检测到value异常
        //value异常:参数为nil
        //key异常，数组越界
        if ([exception.name isEqualToString:NSInvalidArgumentException]) {
            @try {
                [self sw_insertObject:[NSNull null] atIndex:index];
            }
            @catch (NSException *exception) {
                // 在崩溃后会打印崩溃信息，方便我们调试。
                NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
                NSLog(@"%@",exception.callStackSymbols);
                if ([exception.name isEqualToString:NSRangeException]) {
//                    [self sw_insertObject:[NSNull null] atIndex:0];
                }
            }
            @finally {
                
            }
        } else {
//            [self sw_insertObject:anObject atIndex:0];
        }
        // 在崩溃后会打印崩溃信息，方便我们调试。
        NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
        NSLog(@"%@",exception.callStackSymbols);
    }
    @finally {
        
    }
}

@end

@implementation NSMutableDictionary (swMutableDictionary)

+ (void)load {
    [super load];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(setObject:forKey:);
        SEL swizzledSelector = @selector(sw_setObject:forKey:);
        
        Method originalMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), originalSelector);
        Method swizzledMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

-(void)sw_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    @try {
        [self sw_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        // 在崩溃后会打印崩溃信息，方便我们调试。
        NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
        NSLog(@"%@",exception.callStackSymbols);
        [self sw_setObject:[NSNull null] forKey:aKey];
    }
    @finally {
        
    }
}

@end

