//
//  Swizzl_Foundation.h
//  TestSwizzling
//
//  Created by yanluojun on 16/2/23.
//  Copyright © 2016年 yanluojun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (swArray)

- (id)sw_objectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray (swMutableArray)

- (id)sw_objectAtIndex:(NSUInteger)index;
- (void)sw_insertObject:(id)anObject atIndex:(NSUInteger)index;

@end

@interface NSMutableDictionary (swMutableDictionary)

- (void)sw_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end

@interface NSObject (swNSObject)

- (void)setValue:(id)value forKey:(NSString *)key;

@end
